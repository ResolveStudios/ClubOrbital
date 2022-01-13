using System.Linq;
using UdonSharpEditor;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;
using VRC.SDK3.Components;
using VRC.SDKBase;

namespace Okashi.Permissions.Editors
{
    [CustomEditor(typeof(PermissionsPickupButton))]
    public class PermissionsPickupButtonEditor : Editor
    {
        private PermissionsPickupButton self
        {
            get
            {
                try
                {
                    return (PermissionsPickupButton)target;
                }
                catch
                {
                    return (PermissionsPickupButton)target;
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


        public override void OnInspectorGUI()
        {
            Repaint();

           
            EditorGUILayout.Space(10);
            // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
            if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;

            EditorGUI.BeginDisabledGroup(true);
            self.isOn = EditorGUILayout.Toggle("Is On", self.isOn);
            EditorGUI.EndDisabledGroup();

            self.pickup = (VRC_Pickup)EditorGUILayout.ObjectField("VRC Pickup", self.pickup, typeof(VRC_Pickup), true);
            self.objectSync = (VRCObjectSync)EditorGUILayout.ObjectField("Object Sync", self.objectSync, typeof(VRCObjectSync), true);
            self._object = (GameObject)EditorGUILayout.ObjectField("Toggle Object", self._object, typeof(GameObject), true);

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
                        self.permissionsRequired = new int[0];
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