using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UdonSharpEditor;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

namespace Okashi.Permissions.Editors
{
    [CustomEditor(typeof(PermissionButton))]
    public class PermissionButtonEditor : Editor
    {
        private ReorderableList rlist;
        private PermissionManager per;

        public void OnEnable()
        {
            var t = (PermissionButton)target;
            rlist = new ReorderableList(t.permissions, typeof(int), true, true, true, true);
            rlist.drawElementCallback += OnDrawElementCallback;
            rlist.onRemoveCallback += (rl) =>
            {
                var list = t.permissions.ToList();
                list.RemoveAt(rl.index);
                t.permissions = list.ToArray();
                OnEnable();
            };
            rlist.onAddCallback += (rl) =>
            {
                var list = t.permissions.ToList();
                list.Add(per.roles[per.roles.Length - 1].permid);
                t.permissions = list.ToArray();
                OnEnable();
            };
            rlist.drawHeaderCallback += (r) => EditorGUI.LabelField(r, new GUIContent("Allowed Roles"));
        }

        private void OnDrawElementCallback(Rect rect, int index, bool isActive, bool isFocused)
        {
            var t = (PermissionButton)target;
            var roles = per.roles;
            var roleList = roles.ToList();
            var rolenames = roleList.Select(x => x.PrettyName()).ToList();

            // Getindex of the current role 
            var curIndex = roleList.IndexOf(roleList.Find(x => x.permid == t.permissions[index]));

            curIndex = EditorGUI.Popup(rect, curIndex, rolenames.ToArray());
            t.permissions[index] = roleList[curIndex].permid;
        }

        public override void OnInspectorGUI()
        {
            Repaint();
            var pmgo = GameObject.Find("PermissionManager");
            per = pmgo.GetComponent<PermissionManager>();
            Repaint();
            var t = (PermissionButton)target;
            EditorGUILayout.Space(10);
            // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
            if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;

            EditorGUILayout.PropertyField(serializedObject.FindProperty("useGlobal"));
            EditorGUILayout.PropertyField(serializedObject.FindProperty("Unlocked"));
            EditorGUILayout.PropertyField(serializedObject.FindProperty("behaviour"));
            EditorGUILayout.PropertyField(serializedObject.FindProperty("function"));

            try { rlist.DoLayoutList(); } catch { }

            if (GUILayout.Button("Clear"))
            {
                t.permissions = new ulong[0];
                OnEnable();
            }
            serializedObject.ApplyModifiedProperties();
        }

        public int[] ResizeIconArray(int[] oldArray, int newSize)
        {
            int oldSize = oldArray.Length;
            int[] temp = new int[newSize];
            Array.Copy(oldArray, temp, oldSize);

            return temp;
        }
    }
}