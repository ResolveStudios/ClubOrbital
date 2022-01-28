using System.Collections;
using System.Collections.Generic;
using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

public class PrepairBake : MonoBehaviour { }

#if UNITY_EDITOR
[CustomEditor(typeof(PrepairBake))]
public class PrepairBakeEditor : Editor 
{
    public override void OnInspectorGUI()
    {
        if (GUILayout.Button("Show Area"))
        {
            var zones = Resources.FindObjectsOfTypeAll<ZoneManager>();
            var floors = Resources.FindObjectsOfTypeAll<ZoneManager_v2>();
            foreach (var zone in zones)
                zone._show();
            foreach (var item in floors)
                item._show();
        }
        if (GUILayout.Button("Hid Area"))
        {
            var zones = Resources.FindObjectsOfTypeAll<ZoneManager>();
            var floors = Resources.FindObjectsOfTypeAll<ZoneManager_v2>();
            foreach (var zone in zones)
            {
                if (zone.gameObject.name != "-- Spawn --")
                    zone._hide();
                else
                    zone._show();
            }
            foreach (var item in floors)
                item._hide();
        }
    }
}
#endif
