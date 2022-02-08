
using Okashi.Permissions;
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Components;
using VRC.SDKBase;
using VRC.Udon;

public class AccessGranted : UdonSharpBehaviour
{
    public PermissionDriver driver;
    public VRCObjectSync sync;
    [Space]
    public GameObject toggleObject;
    [UdonSynced] public bool show = false;
    public override void OnPickup()
    {
        if (!driver.hasPermissions(Networking.LocalPlayer))
            sync.Respawn();
    }
    public override void OnPickupUseDown()
    {
        if (driver.hasPermissions(Networking.LocalPlayer))
        {
            Networking.SetOwner(Networking.LocalPlayer, gameObject);
            show = !show;
        }
        toggleObject.SetActive(show);
    }

    public void Hide()
    {
        Networking.SetOwner(Networking.LocalPlayer, gameObject);
        toggleObject.SetActive(false);
    }
}
