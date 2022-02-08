
using System;
using System.Linq;
using UdonSharp;
using UdonSharpEditor;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace Okashi.Permissions.Editors
{
    [CustomEditor(typeof(PermissionDriver))]
    public class PermissionDriverEditor : Editor
    {
        private ReorderableList allowedPermsRL;
        private PermissionDriver script => (PermissionDriver)target;

        public void OnEnable()
        {
            allowedPermsRL = SetupAllowedPermissions();
        }

        private ReorderableList SetupAllowedPermissions()
        {
            if (script.allowedPermissions == null) script.allowedPermissions = new ulong[0];
            var reorderableList = new ReorderableList(script.allowedPermissions, typeof(long), true, true, true, true);
            reorderableList.drawHeaderCallback += r =>
            {
                GUI.Label(new Rect(r.x, r.y, r.width, r.height), "Allowed Permissions");
                reorderableList.displayRemove = reorderableList.count > 0;
            };
            reorderableList.onAddCallback += rl =>
            {
                var aplist = script.allowedPermissions.ToList();
                aplist.Add(default);
                script.allowedPermissions = aplist.ToArray();
                OnEnable();
            };
            reorderableList.onRemoveCallback += rl =>
            {
                if (reorderableList.index > -1)
                {
                    var aplist = script.allowedPermissions.ToList();
                    aplist.RemoveAt(reorderableList.index);
                    script.allowedPermissions = aplist.ToArray();
                }
                else
                {
                    var aplist = script.allowedPermissions.ToList();
                    aplist.RemoveAt(reorderableList.count);
                    script.allowedPermissions = aplist.ToArray();
                }
                OnEnable();
            };
            reorderableList.drawElementCallback += (rect, index, isActive, isFocused) =>
            {
                var names = script != null ? script.pmgr.roles.Select(x => new GUIContent(x.PrettyName())).ToArray() : new GUIContent[0];
                var roleid = script.allowedPermissions[Mathf.Clamp(index, 0, script.allowedPermissions.Length - 1)];

                if (script.pmgr.roles.Length > 0)
                {
                    var _index = script.pmgr.roles.ToList().IndexOf(script.pmgr.roles.ToList().Find(x => x.permid == script.allowedPermissions[index]));
                    if (_index == -1) _index = _index = script.pmgr.roles.ToList().IndexOf(script.pmgr.roles.ToList().Last());
                    script.allowedPermissions[index] = script.pmgr.roles[EditorGUI.Popup(rect, _index, names)].permid;
                }
                else GUI.Box(rect, "Please press the Load Permissions on your premissions manager");
            };
            return reorderableList;
        }


        public override void OnInspectorGUI()
        {
            Repaint();
            
            // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
            if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
            script.pmgr = Resources.FindObjectsOfTypeAll<PermissionManager>()[0];
            GUI.color = script.pmgr ? Color.green : Color.red;
            GUILayout.Box(new GUIContent("Permissions Manager was found", script.pmgr ? "Permission Manager was found" : "was unable to find PermissionManager"), GUILayout.ExpandWidth(true));
            GUI.color = Color.white;
            EditorGUILayout.BeginHorizontal();
            if (GUILayout.Button(new GUIContent("Staff", "Add default staff Roles")))
            {
                var aplist = script.allowedPermissions.ToList();
                aplist.Clear();
                script.allowedPermissions = aplist.ToArray();

                aplist = script.allowedPermissions.ToList();
                foreach (var item in script.pmgr.roles)
                {
                    if (item.priority > 18 && !aplist.Contains(item.permid) && !item.PrettyName().ToLower().Contains("bot"))
                    {
                        aplist.Add(item.permid);
                        script.allowedPermissions = aplist.ToArray();
                        OnEnable();
                    }
                }
            }
            if (GUILayout.Button(new GUIContent("Clear", "Clear All Roles")))
            {
                var aplist = script.allowedPermissions.ToList();
                aplist.Clear();
                script.allowedPermissions = aplist.ToArray();
                OnEnable();
            }
            EditorGUILayout.EndHorizontal();

            if (allowedPermsRL != null)
                allowedPermsRL.DoLayoutList();
            else OnEnable();

            serializedObject.ApplyModifiedProperties();
        }
    }
}