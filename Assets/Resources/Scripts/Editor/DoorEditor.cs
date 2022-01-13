using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMPro;
using UdonSharpEditor;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(Door)), CanEditMultipleObjects]
public class DoorEditor : Editor
{
    public override void OnInspectorGUI()
    {
        // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
        if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
        var script = (Door)target;
        var so = serializedObject;
        EditorGUILayout.PropertyField(so.FindProperty("useGlobal"), new GUIContent("Use Global"));
        EditorGUILayout.PropertyField(so.FindProperty("animator"), new GUIContent("Animator"));
        if (script.animator)
            EditorGUILayout.PropertyField(so.FindProperty("boolValue"), new GUIContent("Animator (Bool)"));
        EditorGUILayout.Space(10);
        EditorGUILayout.PropertyField(so.FindProperty("isUnlocked"), new GUIContent("Unlocked"));
        EditorGUILayout.PropertyField(so.FindProperty("lockedRef"), new GUIContent("Locked Referance"));
        EditorGUILayout.PropertyField(so.FindProperty("maxOpenTime"), new GUIContent("Max Open Time"));
        EditorGUILayout.Space(10);
        EditorGUILayout.PropertyField(so.FindProperty("dropOffPoint"), new GUIContent("Drop Off"));
        EditorGUILayout.PropertyField(so.FindProperty("tpOnOpen"), new GUIContent("Teleport On Open"));
        if (script.tpOnOpen)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.PropertyField(so.FindProperty("tpLocation"), new GUIContent("Teleport To"));
            EditorGUI.BeginDisabledGroup(script.tpLocation == null);
            if (GUILayout.Button("Clear", GUILayout.ExpandWidth(false))) script.tpLocation = null;
            EditorGUI.EndDisabledGroup();
            EditorGUILayout.EndHorizontal();
        }
        EditorGUILayout.Space(10);
        EditorGUILayout.PropertyField(so.FindProperty("permMgr"), new GUIContent("Permission Manager"));
        if (script.permMgr)
        {
            EditorGUILayout.PropertyField(so.FindProperty("displayIndex"), new GUIContent("Display Index"));
            EditorGUILayout.PropertyField(so.FindProperty("permissions"), new GUIContent("Permissions"));
            EditorGUILayout.PropertyField(so.FindProperty("roleSprite"), new GUIContent("Role Sprite"));
            EditorGUILayout.PropertyField(so.FindProperty("roleName"),new GUIContent("Role Name"));
        }
        EditorGUILayout.PropertyField(so.FindProperty("requestManager"), new GUIContent("Request Manager"));
        so.ApplyModifiedProperties();
        GUILayout.Space(10);
    }
}