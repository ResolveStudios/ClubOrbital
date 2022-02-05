
using UdonSharp;
using UnityEngine;
using VRC.SDK3.Components;
using VRC.SDKBase;
using VRC.Udon;

public class RespanObject : UdonSharpBehaviour
{
    public VRCObjectSync objectSync;
    public override void Interact()
    {
        if (objectSync != null)
        {
            Networking.SetOwner(Networking.LocalPlayer, objectSync.gameObject);
            objectSync.Respawn();
        }
    }
}
