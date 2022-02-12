using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEditor;
using UdonSharpEditor;
using System.Linq;
using System;
using Okashi.SQL;
using UnityEngine.Networking;
using Newtonsoft.Json;
using Unity.EditorCoroutines.Editor;
using System.Collections;

namespace Okashi.Permissions.Editors
{
    [CustomEditor(typeof(PermissionManager))]
    public class PermissionManagerEditor : Editor
    {
        public PermissionManager self { get { return (PermissionManager)target; } }

        public Dictionary<string, Texture> LoadedImage = new Dictionary<string, Texture>();

        public const string ColorName = "_EmissionColor1";
        private UnitySQLData data;

        public override void OnInspectorGUI()
        {
            Repaint();
            GUILayout.Box(AssetDatabase.LoadAssetAtPath<Texture2D>("Assets/Okashi/PermissionManager/Resources/Textures/Assets/Banner.psd"), GUILayout.ExpandWidth(true), GUILayout.Height(100));
            // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
            if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
            if (GUILayout.Button("Load Permissions"))
            {
                if (PrefabUtility.IsPartOfPrefabInstance(self.gameObject))
                    PrefabUtility.UnpackPrefabInstance(self.gameObject, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
                LoadConfigFile();
            }
            base.OnInspectorGUI();
        }

        private void LoadConfigFile()
        {
#if ORBITAL_PLUS
            var file = Path.Combine(new FileInfo(Application.dataPath).Directory.FullName, "Orbital+.perm");
            if (!File.Exists(file))
                Debug.Log("Permission file does not exist, Please use permission manager to create permission file.");
            else
            {
                Debug.Log("Permission file was found, reading file...");
                var json = File.ReadAllText(file);
                data = JsonConvert.DeserializeObject<UnitySQLData>(json);
                
                self.TotalMembers = int.Parse(data.TotalMembers.Value);
                self.OnlineMembers = int.Parse(data.OnlineMembers.Value);

                LoadedImage = new Dictionary<string, Texture>();
                CleanUpRoles();
                CleanUpMembers();

                

                var pr = new List<PermissionRole>();
                data.roles = data.roles.OrderByDescending(x => x.Value.priority).ToDictionary(x => x.Key, x => x.Value);
                foreach (var role in data.roles)
                {
                    var _role = MakeRole(role);
                    if(_role != null) 
                        pr.Add(_role);
                }
                self.roles = pr.ToArray();

                var pm = new List<PermissionMember>();
                foreach (var member in data.members)
                {
                    var _member = MakeMember(member);
                    if (_member != null) 
                        pm.Add(_member);
                }
                self.members = pm.ToArray();
            }
#endif
        }

        private void CleanUpRoles()
        {
            if (self.rolecontainer)
                DestroyImmediate(self.rolecontainer.gameObject);
            var go = new GameObject("Roles");
            go.transform.parent = self.transform;
            go.transform.position = Vector3.zero;
            go.transform.rotation = Quaternion.identity;
            go.transform.localScale = Vector3.one;
            self.rolecontainer = go.transform;
        }
        private void CleanUpMembers()
        {
            if (self.iconcontainer)
                DestroyImmediate(self.iconcontainer.gameObject);
            var go = new GameObject("Icons");
            go.transform.parent = self.transform;
            go.transform.position = Vector3.zero;
            go.transform.rotation = Quaternion.identity;
            go.transform.localScale = Vector3.one;
            self.iconcontainer = go.transform;
        }
             
        private PermissionRole MakeRole(KeyValuePair<ulong, SQLDiscordRole> role)
        {
            var _ref = Instantiate(self.roletemplate, self.rolecontainer);
            if (_ref != null)
            {
                _ref.name = $"{role.Value.name}";
                _ref.gameObject.SetActive(true);
                _ref.priority = role.Value.priority;
                _ref.permid = role.Value.id;
                _ref.permName = role.Value.name;
                _ref.permColor =  new Color(role.Value.color.r/ 255, role.Value.color.g / 255, role.Value.color.b / 255, role.Value.color.a / 255);
                _ref.isRoot = role.Value.root;
                _ref.ApplyProxyModifications();
                return _ref;
            }
            return default(PermissionRole);
        }

        private PermissionMember MakeMember(KeyValuePair<ulong, SQLDiscordMember> member)
        {
            // Get role of member with the highest priorty
            var myroles = data.memberroles.FindAll(x => x.Key == member.Key).Select(x => x.Value).ToList().Select(x => data.roles.Where(y => y.Key == x).First()).Select(x => x.Value).ToList();
            myroles = myroles.OrderByDescending(x => x.priority).ToList();

            var vrcmember = data.vrcmembers.Where(x => x.Key == member.Key);
            var vrcname = vrcmember.Count() > 0 ? vrcmember.First().Value.vrcname : null;
            if (vrcname != null)
            {
                var _ref = Instantiate(self.icontmplate, self.iconcontainer);
                if (_ref != null)
                {
                    _ref.name = $"{member.Value.displayname} {(!string.IsNullOrEmpty(vrcname) ? $"[{vrcname}]" : string.Empty)}";
                    _ref.gameObject.SetActive(true);
                    _ref.permid = myroles[0].id;
                    _ref.discordname = member.Value.displayname;
                    _ref.displayName = data.vrcmembers[member.Key].vrcname; 
                    _ref.priority = myroles[0].priority;
                    _ref.iconColor = new Color(myroles[0].color.r / 255, myroles[0].color.g / 255, myroles[0].color.b / 255, myroles[0].color.a / 255);
                    _ref.isRoot = myroles[0].root;
                    _ref.isAssigned = true;
                    if (_ref.icon != null && !string.IsNullOrEmpty(myroles[0].iconUrl))
                        EditorCoroutineUtility.StartCoroutine(DownloadRoleIcon(_ref, myroles[0].iconUrl), this);
                    _ref.ApplyProxyModifications();
                    return _ref;
                }
            }
            return default(PermissionMember);
        }

        private IEnumerator DownloadRoleIcon(PermissionMember _ref, string iconUrl)
        {
            if (!string.IsNullOrEmpty(iconUrl))
            {
                if (LoadedImage.ContainsKey(iconUrl))
                {
                    var mytexture = (Texture2D)LoadedImage[iconUrl];
                    _ref.icon.sprite = Sprite.Create(mytexture, new Rect(0, 0, mytexture.width, mytexture.height), Vector2.one * 0.5f);
                    _ref.icon.sprite.name = $"{data.roles.Where(x => x.Key == _ref.permid).First().Value.name} Icon";
                }
                else
                {
                    using (UnityWebRequest www = UnityWebRequestTexture.GetTexture(iconUrl))
                    {
                        if (!LoadedImage.TryGetValue(iconUrl, out Texture texture))
                        {
                            yield return www.SendWebRequest();
                            Texture myTexture = DownloadHandlerTexture.GetContent(www);
                            try { LoadedImage.Add(iconUrl, myTexture); } catch { }
                        }
                        _ref.icon.sprite = Sprite.Create((Texture2D)LoadedImage[iconUrl], new Rect(0, 0, LoadedImage[iconUrl].width, LoadedImage[iconUrl].height), Vector2.one * 0.5f);
                        _ref.icon.sprite.name = $"{data.roles.Where(x => x.Key == _ref.permid).First().Value.name} Icon";
                    }
                }
            }
        }
    }
}