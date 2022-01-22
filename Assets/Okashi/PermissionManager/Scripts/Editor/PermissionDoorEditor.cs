using System.Linq;
using UdonSharpEditor;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

namespace Okashi.Permissions.Editors
{
    [CustomEditor(typeof(PermissionDoor))]
    public class PermissionDoorEditor : Editor
    {
        private PermissionDoor self
        {
            get
            {
                try
                {
                    return (PermissionDoor)target;
                }
                catch
                {
                    return (PermissionDoor)target;
                }
            }
        }
        private PermissionManager per
        {
            get
            {
                var pmgo = GameObject.Find("PermissionManager");
                    return pmgo != null ? pmgo.GetComponent<PermissionManager>() : null;
            }
        }
        private ReorderableList rlist;
        private int[] channels = new[]
        {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 5, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
        61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
        81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100,
    };

        public void OnEnable()
        {
            if (PrefabUtility.IsPartOfPrefabInstance(self.gameObject))
                PrefabUtility.UnpackPrefabInstance(self.gameObject, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
            CreateList();
        }

        private void CreateList()
        {
            try
            {
                rlist = new ReorderableList(self.permissionsRequired, typeof(int), true, true, true, true);
                rlist.drawElementCallback += OnDrawElementCallback;
                rlist.onRemoveCallback += (rl) =>
                {
                    serializedObject.FindProperty("permissionsRequired").DeleteArrayElementAtIndex(rl.index);
                    serializedObject.SetIsDifferentCacheDirty();
                    serializedObject.ApplyModifiedProperties();
                    OnEnable();
                };
                rlist.onAddCallback += (rl) =>
                {
                    ArrayUtility.Add(ref self.permissionsRequired, per.roles.Last().permid);
                    serializedObject.SetIsDifferentCacheDirty();
                    serializedObject.ApplyModifiedProperties();
                    OnEnable();
                };
                rlist.drawHeaderCallback += (r) => EditorGUI.LabelField(r, new GUIContent("Allowed Roles"));
            }
            catch
            {
                CreateList();
            }
        }

        private void OnDrawElementCallback(Rect rect, int index, bool isActive, bool isFocused)
        {
            if (!per)
            {
                EditorGUI.LabelField(rect, new GUIContent("Unable to find Permission Manager"));
            }
            else
            {
                var roles = per.roles;
                var roleList = roles.ToList();
                var rolenames = roleList.Select(x => x.PrettyName()).ToList();

                // Getindex of the current role 
                var curIndex = roleList.IndexOf(roleList.Find(x => x.permid == self.permissionsRequired[index]));
                curIndex = EditorGUI.Popup(rect, curIndex, rolenames.ToArray());
                self.permissionsRequired[index] = roleList[curIndex].permid;
            }
        }

        public void OnSceneGUI()
        {
            Repaint();

            if (self.destinationDoor == null || self.destinationDoor.destinationDoor == null) return;
            Handles.color = Color.green;
            Handles.DrawLine(self.destinationDoor.transform.position, self.transform.position);
        }

        public override void OnInspectorGUI()
        {
            Repaint();

           
            EditorGUILayout.Space(10);
            // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
            if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
            self.isOutOfService = EditorGUILayout.Toggle("Out Of Service", self.isOutOfService);
            self.isUnlocked = EditorGUILayout.Toggle("Is Unlocked", self.isUnlocked);
            self.channel = EditorGUILayout.IntPopup("Channel", self.channel, channels.ToList().Select(x => $"Ch {x}").ToArray(), channels);
            EditorGUILayout.BeginHorizontal();
            self.destinationDoor = (PermissionDoor)EditorGUILayout.ObjectField("Destination", self.destinationDoor, typeof(PermissionDoor), true);
            if (self.destinationDoor)
            {
                if (GUILayout.Button("Disconnect", GUILayout.ExpandWidth(false)))
                {
                    self.destinationDoor.destinationDoor = null;
                    self.destinationDoor = null;
                }
            }
            else if (self.destinationDoor == null)
            {
                if (GUILayout.Button("Connect", GUILayout.ExpandWidth(false)))
                {
                    if (self.destinationDoor != null) return;
                    var doors = Resources.FindObjectsOfTypeAll<PermissionDoor>().ToList();
                    var door = doors.Find(x => x != self && x.channel == self.channel && x.destinationDoor == null);
                    if (door != null)
                    {
                        self.destinationDoor = door;
                        door.destinationDoor = self;
                    }
                }
            }
            EditorGUILayout.EndHorizontal();

            if (!per)
            {
                self.roleicon = (Sprite)EditorGUILayout.ObjectField("Icon", self.roleicon, typeof(Sprite), true);
                self.rolename = EditorGUILayout.TextField("Label", self.rolename);
            }
            else
            {
                try
                {
                    var roles = per.roles;
                    var roleList = roles.ToList();
                    var rolenames = roleList.Select(x => x.PrettyName()).ToList();

                    // Getindex of the current role 
                    var curIndex = roleList.IndexOf(roleList.Find(x => x.permid == self.displayrole));
                    if (curIndex < 0) curIndex = roleList.IndexOf(roleList.Last());
                    curIndex = EditorGUILayout.Popup(curIndex, rolenames.ToArray());
                    self.displayrole = roleList[curIndex].permid;
                }
                catch 
                {
                    EditorGUILayout.HelpBox("Please press the load permission button on the permission manager to refresh the permission list.", MessageType.Warning);
                }
            }

            if (per)
            {
                try
                {
                    EditorGUILayout.BeginHorizontal();
                    EditorGUILayout.BeginVertical();
                    rlist.DoLayoutList();
                    EditorGUILayout.EndVertical();
                    if (GUILayout.Button("Clear", GUILayout.ExpandWidth(false)))
                    {
                        self.permissionsRequired = new ulong[0];
                        CreateList();
                    }
                    EditorGUILayout.EndHorizontal();
                }
                catch
                {
                    CreateList();
                }
            }
            else  GUILayout.Box(new GUIContent("Unable to find Permission Manager, Please ensure that you have Permission Manager in your scene."), GUILayout.ExpandWidth(true));
        }
    }
}