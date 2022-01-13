
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;

namespace Okashi.Permissions
{
    public class PermissionButton : UdonSharpBehaviour
    {
        public bool useGlobal;
        public UdonSharpBehaviour behaviour;
        public string function;
        [Space]
        public bool Unlocked;
        private PermissionManager permissionManager;
        public int[] permissions;

        public override void Interact()
        {
            var pmgo = GameObject.Find("PermissionManager");
            permissionManager = pmgo.GetComponent<PermissionManager>();

            if (!Unlocked || (permissionManager && permissions.Length > 0))
            {
                if (permissionManager.HasPermissionIDAny(Networking.LocalPlayer, permissions))
                {
                    if (useGlobal)
                    {
                        Networking.SetOwner(Networking.LocalPlayer, behaviour.gameObject);
                        behaviour.SendCustomNetworkEvent(NetworkEventTarget.Owner, function);
                    }
                    else
                    {
                        behaviour.SendCustomEvent(function);
                    }
                }
            }
            else
            {
                if (useGlobal)
                {
                    Networking.SetOwner(Networking.LocalPlayer, behaviour.gameObject);
                    behaviour.SendCustomNetworkEvent(NetworkEventTarget.Owner, function);
                }
                else
                {
                    behaviour.SendCustomEvent(function);
                }
            }
        }
    }
}