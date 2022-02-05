using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEditor;
using UdonSharpEditor;
using System.Linq;
using System;
using System.Threading.Tasks;
using VRC.SDK3.Components;

namespace Okashi.Permissions.Editors
{
    [CustomEditor(typeof(PermissionManager))]
    public class PermissionManagerEditor : Editor
    {
        public PermissionManager self { get { return (PermissionManager)target; } }
        public const string ColorName = "_EmissionColor1";

        public override void OnInspectorGUI()
        {
            Repaint();
            // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
            if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
            if (GUILayout.Button("Load Permissions"))
            {
                if (PrefabUtility.IsPartOfPrefabInstance(self.gameObject))
                    PrefabUtility.UnpackPrefabInstance(self.gameObject, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
                LoadConfigFile();
                MakeSceneAsset();
            }
            base.OnInspectorGUI();
        }

        private void LoadConfigFile()
        {
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
                if (self.rolecontainer)
                    DestroyImmediate(self.rolecontainer.gameObject);
                var go = new GameObject("Roles");
                go.transform.parent = self.transform;
                go.transform.position = Vector3.zero;
                go.transform.rotation = Quaternion.identity;
                go.transform.localScale = Vector3.one;
                self.rolecontainer = go.transform;
                var fi = new List<Role>();
                foreach (var role in data.roles)
                {
                    var _role = MakeRole(role);
                    if(_role != null) fi.Add(_role);
                }
                self.roles = fi.ToArray();
            }
        }
        private void MakeSceneAsset()
        {
            CleanUp();

            var fi = new List<PermissionIcon>();
            // Get ALL MEMBERS 
            var members = GetAllPlayers();
            foreach (var member in members)
            {
                var icon = MakeIcon(member);
                if (icon != null) fi.Add(icon);
            }
            self.icons = fi.ToArray();
        }
        private void CleanUp()
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
        private List<string> GetAllPlayers()
        {
            var totalmembers = new List<string>();
            var members = new List<string>();
            self.roles.Select(r => r.members).ToList().ForEach(a => a.ToList().ForEach(s => { if (!totalmembers.Contains(s)) totalmembers.Add(s); }));
            self.roles.Select(r => r.members).ToList().ForEach(a => a.ToList().ForEach(s => { if (!members.Contains(s) && !string.IsNullOrEmpty(s.Split('|')[1])) members.Add(s); }));
            Debug.Log($"We have {members.Count}/{totalmembers.Count} who are setup");
            return members;
        }
        private PermissionIcon MakeIcon(string member)
        {
            // Get role of member with the highest priorty
            var roles = self.roles.Where(x => x.members.Contains(member)).ToList();
            roles = roles.OrderByDescending(x => x.priority).ToList();
            var data_split = member.Split('|');
            var discord = data_split[0];
            var vrcname = data_split[1];

            var _ref = Instantiate(self.icontmplate, self.iconcontainer);
            if (_ref != null)
            {
                _ref.name = $"{data_split[0]} [{data_split[1]}]";
                _ref.gameObject.SetActive(true);
                _ref.discordname = data_split[0];
                _ref.displayname = data_split[1];
                _ref.priority = roles[0].priority;
                if(_ref.icon != null)_ref.icon.sprite = roles[0].permIcon;
                _ref.iconColor = self.GetPermissionColor(roles[0].permid);
                _ref.isRoot = roles[0].isRoot;
                _ref.isAssigned = true;
                _ref.permid = roles[0].permid;
                return _ref;
            }
            return default(PermissionIcon);
        }
        private Role MakeRole(Role role)
        {
            var _ref = Instantiate(self.roletemplate, self.rolecontainer);
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
            return default(Role);
        }
    }
}