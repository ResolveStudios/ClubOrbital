
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace Okashi.Permissions
{
    public class AcceptTOS : UdonSharpBehaviour
    {
        public PermissionDoor door;
        public PickupButton pickupButton;

        public void Accepted()
        {
            if (door)
                door.InteractOverride();
            if(pickupButton)
            {
                Networking.SetOwner(Networking.LocalPlayer, pickupButton.gameObject);
                pickupButton.isOn = false;
            }

        }
    }
}