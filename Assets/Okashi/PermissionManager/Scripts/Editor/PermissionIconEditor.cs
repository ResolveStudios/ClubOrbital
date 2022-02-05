using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEditor;
using UdonSharpEditor;
using System.Linq;

namespace Okashi.Permissions.Editors
{
    [CustomEditor(typeof(PermissionIcon))]
    public class PermissionIconEditor : Editor
    {
        public override void OnInspectorGUI()
        {
            Repaint();
            var t = (PermissionIcon)target;
            // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
            if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
            base.OnInspectorGUI();
        }
    }
}