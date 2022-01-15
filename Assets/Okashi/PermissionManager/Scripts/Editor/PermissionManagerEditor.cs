using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEditor;
using UdonSharpEditor;
using System.Linq;
using Okashi.Permission.Editors;

namespace Okashi.Permissions.Editors
{
    [CustomEditor(typeof(PermissionManager))]
    public class PermissionManagerEditor : Editor
    {
        public const string ColorName = "_EmissionColor1";

        public override void OnInspectorGUI()
        {
            Repaint();
            var t = (PermissionManager)target;

            base.OnInspectorGUI();

            EditorGUILayout.Space(10);
            // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
            if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
            
            if (GUILayout.Button("Load Permissions"))

            {
                if (PrefabUtility.IsPartOfPrefabInstance(t.gameObject))
                    PrefabUtility.UnpackPrefabInstance(t.gameObject, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
                LoadConfigFile();
                MakeSceneAsset();
            }
        }

        private void MakeSceneAsset()
        {
            var t = (PermissionManager)target;
            if (t.iconcontainer)
                DestroyImmediate(t.iconcontainer.gameObject);
            var go = new GameObject("Icons");
            go.transform.parent = t.transform;
            go.transform.position = Vector3.zero;
            go.transform.rotation = Quaternion.identity;
            go.transform.localScale = Vector3.one;
            t.iconcontainer = go.transform;

            var fi = new List<Icon>();
            foreach (var role in t.roles)
            {
                foreach (var member in role.members)
                {
                    fi.Add(MakeIcon(member.Split('|')[1], role));
                }
            }
            t.icons = fi.ToArray();
        }
        private Icon MakeIcon(string _name, Role _role)
        {
            var t = (PermissionManager)target;
            var _ref = Instantiate(t.icontmplate, t.iconcontainer);
            if (_ref != null)
            {
                _ref.name = $"{_name}";
                _ref.gameObject.SetActive(true);
                _ref.displayname = _name;
                _ref.priority = _role.priority;
                _ref.icon.sprite = _role.permIcon;
                _ref.iconColor = t.GetPermissionColor(_role.permid);
                _ref.isRoot = _role.isRoot;
                _ref.isAssigned = true;
                _ref.permid = _role.permid;
                return _ref;
            }
            return default;
        }
        private Role MakeRole(Role role)
        {
            var t = (PermissionManager)target;
            var _ref = Instantiate(t.roletemplate, t.rolecontainer);
            if (_ref != null)
            {

                _ref.name = $"{role.permName}";
                _ref.gameObject.SetActive(true);
                _ref.priority = role.priority;
                _ref.permid = role.permid;
                _ref.permName = role.permName;
                _ref.permIcon = role.permIcon;
                _ref.permColor = role.permColor;
                _ref.isRoot = role.isRoot;
                _ref.members = role.members;
                return _ref;
            }
            return default;
        }

        public void LoadConfigFile()
        {
            var t = (PermissionManager)target;
#if ORBITAL_PLUS
            var file = Directory.GetFiles(new FileInfo(Application.dataPath).Directory.FullName, "*.perm").ToList().First();
            if (!File.Exists(file))
            {
                Debug.Log($"Permission file could not be found in \"{new FileInfo(Application.dataPath).Directory.FullName}\"\n" +
                    $"Please run !o clug \"!o club get-permissionsfile\" in your discord server");
                return;
            }
#else
            var file = Path.Combine(new FileInfo(Application.dataPath).Directory.FullName, "Orbital+.perm");
#endif
            if (!File.Exists(file))
            {
                Debug.Log("Permission file does not exist, Please use permission manager to create permission file.");
            }
            else
            {
                Debug.Log("Permission file was found, reading file...");
                var json = File.ReadAllText(file);
                var data = JsonUtility.FromJson<SRoles>(json);
                if (t.rolecontainer)
                    DestroyImmediate(t.rolecontainer.gameObject);
                var go = new GameObject("Roles");
                go.transform.parent = t.transform;
                go.transform.position = Vector3.zero;
                go.transform.rotation = Quaternion.identity;
                go.transform.localScale = Vector3.one;
                t.rolecontainer = go.transform;

                var fi = new List<Role>();
                foreach (var role in data.roles)
                {
                    if (!DiscordOnly(role))
                        fi.Add(MakeRole(role));
                }
                t.roles = fi.ToArray();
            }
        }

        private bool DiscordOnly(Role_Serializable role)
        {
            if (role.permName == "@everyone") return false;
            if (string.IsNullOrEmpty(role.permIcon)) return true;
            if (role.permColor == "#000000") return true;
            return false;
        }
    }
}