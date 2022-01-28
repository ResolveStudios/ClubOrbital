using System.Collections;
using System.Collections.Generic;
using UdonSharpEditor;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(ZoneManager_v2))]
public class ZoneManager_v2Editor : Editor
{
    public override void OnInspectorGUI()
    {
        if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
        var self = (ZoneManager_v2)target;

        GUI.color = self.debug ? Color.green : Color.white;
        if (GUILayout.Button("Debug Area")) self.debug = !self.debug;
        if (self.debug != self._debug)
        {
            if (self.debug) self._show();
            else self._hide();
            self._debug = self.debug;
        }
        GUI.color = Color.white;
        EditorGUILayout.PropertyField(serializedObject.FindProperty("subObjects"));

        serializedObject.ApplyModifiedProperties();
    }
}
