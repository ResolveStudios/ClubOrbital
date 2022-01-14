
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace Okashi.Permissions
{
    public class PermissionDoor : UdonSharpBehaviour
    {
        public PermissionDoor destinationDoor;
        public int channel = 1;
        [Space]
        public int displayrole;
        public Sprite roleicon;
        public string rolename;
        [Space]
        public bool isUnlocked = false;
        public int[] permissionsRequired;

        private Transform endpoint;

        public bool isOutOfService;
        private GameObject outOfService;

        private void Start()
        {
            var pmgo = GameObject.Find("PermissionManager");
            var pm = pmgo.GetComponent<PermissionManager>();

            endpoint = transform.Find("EndPoint");
            var spriteRenderer = transform.Find("RoleSprite").GetComponent<SpriteRenderer>();
            
            var role = pm.GetPermissionByID(displayrole);
            spriteRenderer.sprite = pmgo && pm ? role.permIcon : roleicon;

            outOfService = transform.Find("OutOfOrder").gameObject;
            outOfService.SetActive(isOutOfService);
            if (isOutOfService)
                GetComponent<BoxCollider>().enabled = false;
        }

        public override void Interact()
        {
            if (isOutOfService) return;
            var pmgo = GameObject.Find("PermissionManager");
            var pm = pmgo.GetComponent<PermissionManager>();

            if (!pm || permissionsRequired.Length <= 0 || isUnlocked)
            {
                Networking.LocalPlayer.TeleportTo(destinationDoor.GetEndpoint().position, destinationDoor.GetEndpoint().rotation, 
                    VRC_SceneDescriptor.SpawnOrientation.AlignRoomWithSpawnPoint);
            }
            else
            {
                if(pm.HasPermissionIDAny(Networking.LocalPlayer, permissionsRequired))
                {
                    Networking.LocalPlayer.TeleportTo(destinationDoor.GetEndpoint().position, destinationDoor.GetEndpoint().rotation, 
                        VRC_SceneDescriptor.SpawnOrientation.AlignRoomWithSpawnPoint);
                }
                else
                {

                }
            }
        }
        public void InteractOverride()
        {
            if (isOutOfService) return;
            Debug.Log($"Teleporting player to {destinationDoor.GetEndpoint().position}");
            Networking.LocalPlayer.TeleportTo(destinationDoor.GetEndpoint().position, destinationDoor.GetEndpoint().rotation, 
                VRC_SceneDescriptor.SpawnOrientation.AlignRoomWithSpawnPoint);
        }

        public Transform GetEndpoint() => endpoint;
    }
}