
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;

namespace Okashi.Permissions
{
    public class AcceptTOS : UdonSharpBehaviour
    {
        public PermissionDoor door;
        public PermissionsPickupButton pickupButton;

        public void Accepted()
        {
            if (door)
                door.InteractOverride();
            if(pickupButton)
            {
                pickupButton.SendCustomNetworkEvent(NetworkEventTarget.Owner, "HideButton");
            }
        }
    }
}