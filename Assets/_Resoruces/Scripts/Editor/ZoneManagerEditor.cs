
using UdonSharp;
using UdonSharpEditor;
using UnityEditor;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

[CustomEditor(typeof(ZoneManager))]
public class ZoneManagerEditor : Editor
{
    public override void OnInspectorGUI()
    {
        var self = (ZoneManager)target;
        // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
        if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
        GUI.color = self.Zone().activeSelf ? Color.green : Color.white;
        if (GUILayout.Button("Debug View"))
            if (self.Zone().activeSelf)
            {
                self.Hide();
                foreach (var mgr in self.GetComponentsInChildren<ZoneManager>(true)) mgr.Hide();
            }
            else
            {
                self.Show();
                foreach (var mgr in self.GetComponentsInChildren<ZoneManager>(true)) mgr.Show();
            }
        GUI.color  = Color.white;
        base.OnInspectorGUI();
    }
}
