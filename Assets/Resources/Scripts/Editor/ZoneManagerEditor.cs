using System;
using System.Collections;
using System.Collections.Generic;
using UdonSharpEditor;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(ZoneManager))]
public class ZoneManagerEditor : Editor
{
    public bool debug = false;
    private bool _debug;

    public override void OnInspectorGUI()
    {
        Repaint();
        if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
        var self = (ZoneManager)target;

        GUI.color = debug ? Color.green : Color.white;
        if (GUILayout.Button("Debug Area")) debug = !debug;
        if(debug != _debug)
        {
            if (debug) self._show();
            else self._hide();
            _debug = debug;
        }
        GUI.color = Color.white;
        self.UnloadDistance = EditorGUILayout.Slider(new GUIContent("Unload Distance"), self.UnloadDistance, 1, 1000);
        DrawGizmos();
        if (GUI.changed)
        {
            EditorUtility.SetDirty(target);
            Canvas.ForceUpdateCanvases();
            EditorWindow.GetWindow(Type.GetType("UnityEditor.GameView,UnityEditor")).Repaint();
            SceneView.RepaintAll();
            EditorWindow.GetWindow<SceneView>().Repaint();
            HandleUtility.Repaint();
        }
    }

    private void DrawGizmos()
    {
        var self = (ZoneManager)target;
        // Draw lines
        Debug.DrawLine(self.transform.position, self.transform.position + (self.transform.forward * self.UnloadDistance), new Color(0f, 0f, 1f));
        Debug.DrawLine(self.transform.position, self.transform.position + (-self.transform.forward * self.UnloadDistance), new Color(0f, 0f, 0.5f));
        Debug.DrawLine(self.transform.position, self.transform.position + (self.transform.right * self.UnloadDistance), new Color(1f, 0f, 0f));
        Debug.DrawLine(self.transform.position, self.transform.position + (-self.transform.right * self.UnloadDistance), new Color(0.5f, 0f, 1f));
        Debug.DrawLine(self.transform.position, self.transform.position + (self.transform.up * self.UnloadDistance), new Color(0, 1f, 0f));
        Debug.DrawLine(self.transform.position, self.transform.position + (-self.transform.up * self.UnloadDistance), new Color(0, 0.5f, 1f));
    }
}