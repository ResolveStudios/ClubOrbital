using System.Collections.Generic;
using System.IO;
using System.Linq;
using Unity.Plastic.Newtonsoft.Json;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;
namespace Okashi.Permissions.Editors
{
    public class PermissionManagerEditorWindow : EditorWindow
    {
        private static PermissionManagerEditorWindow _window;
        private int lastroleindex;
        private int roleindex;
        private ReorderableList _list;
        public SRoles srole = new SRoles();
        private bool roleadding;

        private ulong roleid;
        private string rolename;
        private Color rolecolor;
        private bool roleIsRoot;
        private Vector2 scroll;

        [MenuItem("Okashi/Permission Manager")]
        public static void showMgr()
        {
            _window = GetWindow<PermissionManagerEditorWindow>();
            _window.titleContent = new GUIContent("Permissions");
            _window.Show();
        }

        private void OnEnable()
        {
            LoadConfigFile();
            mkList();
        }
        private void OnDisable()
        {
            SaveConfigFile();
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
                Debug.Log("Permission file does not exist, creating new file...");
                srole = new SRoles();
                var json = JsonConvert.SerializeObject(srole, Formatting.Indented);
                File.WriteAllText(file, json);
            }
            else
            {
                Debug.Log("Permission file was found, reading file...");
                var json = File.ReadAllText(file);
                srole = JsonConvert.DeserializeObject<SRoles>(json);
            }
            mkList();
        }
        private void SaveConfigFile()
        {
#if ORBITAL_PLUS
            var file = Directory.GetFiles(new FileInfo(Application.dataPath).Directory.FullName, "*.perm").ToList().First();
            if(!File.Exists(file))
            {
                Debug.Log($"Permission file could not be found in \"{new FileInfo(Application.dataPath).Directory.FullName}\"\n" +
                    $"Please run !o clug \"!o club get-permissionsfile\" in your discord server");
                return;
            }
#else
            var file = Path.Combine(new FileInfo(Application.dataPath).Directory.FullName, "Orbital+.perm");
#endif
            Debug.Log("Saving file...");
            var json = JsonUtility.ToJson(srole, true);
            File.WriteAllText(file, json);

            LoadConfigFile();
        }



        private void OnGUI()
        {
            Repaint();
            if (roleindex != lastroleindex) { mkList(); lastroleindex = roleindex; }

            GUILayout.Box(AssetDatabase.LoadAssetAtPath<Texture2D>("Assets/Okashi/PermissionManager/Resources/Textures/Assets/Banner.psd"), GUILayout.ExpandWidth(true), GUILayout.Height(100));
            EditorGUILayout.BeginHorizontal();
            if (srole.roles != null && srole.roles.Count > 0)
            {
                ColorUtility.TryParseHtmlString(srole.roles[roleindex].permColor, out Color _rolecolor);
                GUI.color = _rolecolor;
            }
            GUIContent[] entry = srole.roles != null && srole.roles.Count > 0 ? srole.roles.Select(x => new GUIContent($"#{x.priority} | {x.permName} ({x.members.Count})")).ToArray() : new GUIContent[0];
            roleindex = EditorGUILayout.Popup(roleindex, entry);
            GUI.color = Color.white;
            EditorGUI.BeginDisabledGroup(srole.roles.Count <= 0);
            GUI.color = Color.red;
            if (GUILayout.Button(new GUIContent("-", "Remove current role"), GUILayout.ExpandWidth(false))) { srole.roles.RemoveAt(roleindex); SaveConfigFile(); }
            GUI.color = Color.white;
            EditorGUI.EndDisabledGroup();
            EditorGUI.BeginDisabledGroup(roleadding);
            if (GUILayout.Button(new GUIContent("+", "Add new role"), GUILayout.ExpandWidth(false)))
            {
                roleid = ulong.MinValue;
                rolename = string.Empty;
                rolecolor = default;
                roleadding = true;
            }
            EditorGUI.EndDisabledGroup();
            if (GUILayout.Button("Refresh", GUILayout.ExpandWidth(false))) { LoadConfigFile(); }
            EditorGUILayout.EndHorizontal();

            if (roleadding)
            {
                roleIsRoot = EditorGUILayout.Toggle("Is Root", roleIsRoot);
                roleid = (ulong)EditorGUILayout.FloatField("Role ID", (long)roleid) ;
                rolename = EditorGUILayout.TextField("Role Name", rolename);
                rolecolor = EditorGUILayout.ColorField("Role Color", rolecolor);
                GUILayout.Space(10);
                if (GUILayout.Button("Add Role"))
                {
                    var role = new Role_Serializable();
                    role.permID = roleid;
                    role.permName = rolename;
                    role.permColor = $"#{ColorUtility.ToHtmlStringRGB(rolecolor)}";
                    role.members = new List<string>();
                    role.isRoot = roleIsRoot;
                    srole.roles.Add(role);

                    SaveConfigFile();

                    roleid = ulong.MinValue;
                    rolename = default;
                    rolecolor = default;
                    roleadding = false;
                }
            }

            if (_list != null && srole.roles.Count > 0)
            {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.BeginVertical();
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField(new GUIContent($"Priority: {srole.roles[roleindex].priority}"), GUILayout.Width(100));
                srole.roles[roleindex].isRoot = EditorGUILayout.Toggle("Is Root", srole.roles[roleindex].isRoot, GUILayout.Width(70));
                EditorGUILayout.EndHorizontal();
                EditorGUI.BeginDisabledGroup(true);
                EditorGUILayout.TextField($"Role ID", srole.roles[roleindex].permID.ToString());
                EditorGUI.EndDisabledGroup();
                srole.roles[roleindex].permName = EditorGUILayout.TextField("Role Name", srole.roles[roleindex].permName);
                ColorUtility.TryParseHtmlString(srole.roles[roleindex].permColor, out Color _roleColor);
                srole.roles[roleindex].permColor = $"#{ColorUtility.ToHtmlStringRGBA(EditorGUILayout.ColorField("Role Color", _roleColor))}";
                EditorGUILayout.EndVertical();
                srole.roles[roleindex].permIcon = AssetDatabase.GetAssetPath(EditorGUILayout.ObjectField(AssetDatabase.LoadMainAssetAtPath(srole.roles[roleindex].permIcon), typeof(Sprite), true, GUILayout.Width(60), GUILayout.Height(60)));
                EditorGUILayout.EndHorizontal();
                scroll = EditorGUILayout.BeginScrollView(scroll);
                _list.DoLayoutList();
                EditorGUILayout.EndScrollView();
            }
            else mkList();


            if (GUILayout.Button("Save"))
            {
                SaveConfigFile();
            }

            GUI.skin.label.alignment = TextAnchor.MiddleRight;
            GUILayout.Label("v9.0.0", GUILayout.ExpandWidth(true));
        }

        private void mkList()
        {
            srole.roles = srole.roles.OrderByDescending(x => x.priority).ToList();
            _list = new ReorderableList(srole.roles != null && srole.roles.Count > 0 ? srole.roles[roleindex].members : null, typeof(string), true, true, true, false);
            _list.drawElementCallback += OnDrawElements;
            _list.onAddCallback += (l) => srole.roles[roleindex].members.Add("|");
            _list.drawHeaderCallback += (r) =>
            {
                if (srole.roles.Count > 0)
                    GUI.Label(r, $"{srole.roles[roleindex].PrettyName()} ({srole.roles[roleindex].members.Count})");
                else
                    GUI.Label(r, "No Roles to Display");
            };
        }
        private void OnDrawElements(Rect rect, int index, bool isActive, bool isFocused)
        {
#if ORBITAL_PLUS
            var split = srole.roles[roleindex].members[index].Split('|');
            var discord = split.Length > 1 ? split[0] : srole.roles[roleindex].members[index];
            var vrchat = split.Length > 1 ? split[1] : string.Empty;
            var w = rect.width - 25;
                EditorGUI.TextField(new Rect(rect.x, rect.y, w, rect.height), 
                new GUIContent(discord),
                vrchat);
            srole.roles[roleindex].members[index] = $"{discord}|{vrchat}";
#else
            var l = srole.roles[roleindex].members[index].Split('|').Length;
            var discord = srole.roles[roleindex].members[index].Split('|')[0];
            var vrchat = l > 1 ? srole.roles[roleindex].members[index].Split('|')[1] : string.Empty;
            var w = rect.width - 25;
            discord = EditorGUI.TextField(new Rect(rect.x, rect.y, w / 2, rect.height), discord);
            vrchat = EditorGUI.TextField(new Rect(rect.x + (w / 2), rect.y, w / 2, rect.height), vrchat);
            srole.roles[roleindex].members[index] = $"{discord}|{vrchat}";
#endif
            if (GUI.Button(new Rect(rect.width - 3, rect.y, 20, 20), "X"))
            {
                srole.roles[roleindex].members.RemoveAt(index);
            }
        }
    }
}