
using Okashi.Permissions;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Components;
using VRC.SDKBase;
using VRC.Udon;

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
        if(manager.HasPermissionIDAny(Networking.LocalPlayer, permissionsRequired))
        {

        }
        else
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

    private void Update()
    {
        _object.SetActive(isOn);
    }
}
