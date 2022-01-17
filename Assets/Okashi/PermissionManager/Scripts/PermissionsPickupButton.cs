using UdonSharp;
using UnityEngine;
using VRC.SDK3.Components;
using VRC.SDKBase;

namespace Okashi.Permissions
{
    public class PermissionsPickupButton : UdonSharpBehaviour
    {
        public VRC_Pickup pickup;
        public VRCObjectSync objectSync;
        public GameObject _object;
        [UdonSynced] public bool isOn;

        public PermissionManager manager;
        public int[] permissionsRequired;

        public override void OnPickup()
        {
            if (!manager.HasPermissionIDAny(Networking.LocalPlayer, permissionsRequired))
            {
                pickup.Drop(Networking.LocalPlayer);
                objectSync.Respawn();
            }
        }

        public override void OnPickupUseDown()
        {
            Networking.IsOwner(gameObject);
            isOn = !isOn;
        }

        public void HideButton()
        {
            isOn = false;
        }

        private void Update() => _object.SetActive(isOn);
    }
}
