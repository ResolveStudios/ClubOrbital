using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

namespace Okashi.Permissions
{
    public class PermissionDebug : UdonSharpBehaviour
    {
        public PermissionManager mgr;
        public TextMeshPro lable;
        public Animator animator;
        public override void OnPlayerTriggerEnter(VRCPlayerApi player)
        {
            var _permission = mgr.GetPlayerPermission(player);
            var _name = mgr.GetPermissionByID(_permission.permid).permName;
            var _color = mgr.GetPermissionColor(_permission.permid);

            string _text = string.Empty;
            if (!string.IsNullOrEmpty(_name))
                _text += "<align=right><size=8>Club <b><color=" + _color + ">" + _name + "</color></b></size></align>\n";
            _text += "Welcome, " + player.displayName;
            lable.text = _text;
            animator.Play("Welcome");

        }
    }
}