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
    public bool debug = true;
    private bool _debug = false;

    public override void OnInspectorGUI()
    {

        if(!debug)
        {
            GUI.color = Color.white;
            if (GUILayout.Button("Debug All Area"))
            {
                var zones = Resources.FindObjectsOfTypeAll<ZoneManager>();
                var floors = Resources.FindObjectsOfTypeAll<ZoneManager_v2>();
                foreach (var zone in zones)
                    zone._show();
                foreach (var item in floors)
                    item._show();
                debug = true;
            }
        }
        else
        {
            GUI.color = Color.green;
            if (GUILayout.Button("Debug All Area"))
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
                debug = false;
            }
        }
    }
}
#endif
