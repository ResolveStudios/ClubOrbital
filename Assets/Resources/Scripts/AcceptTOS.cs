
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;

namespace Okashi.Permissions
{
    public class AcceptTOS : UdonSharpBehaviour
    {
        public bool eventScheduled = false;
        public PermissionDoor door;
        public PermissionsPickupButton pickupButton;

        public void Start()
        {
            if (pickupButton && !eventScheduled)
                pickupButton.SendCustomNetworkEvent(NetworkEventTarget.All, "ShowButton");
        }
        public void Accepted()
        {
            if (door)
                door.InteractOverride();
            if(pickupButton)
            {
                if (eventScheduled)
                    pickupButton.SendCustomNetworkEvent(NetworkEventTarget.All, "HideButton");
            }
        }
    }
}