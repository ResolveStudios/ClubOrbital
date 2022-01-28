﻿using System.Collections;
using System.Collections.Generic;
using UdonSharpEditor;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(ZoneManager_v2))]
public class ZoneManager_v2Editor : Editor
{
    public bool debug = false;
    private bool _debug = false;

    public override void OnInspectorGUI()
    {
        if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
        var script = (ZoneManager_v2)target;

        GUI.color = debug ? Color.green : Color.white;
        if (GUILayout.Button("Debug Area")) debug = !debug;
        if (debug != _debug)
        {
            if (debug) script._show();
            else script._hide();
            _debug = debug;
        }
        GUI.color = Color.white;
    }
}
