
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class TPPlayerTo : UdonSharpBehaviour
{
    public Transform destination;
    public override void Interact()
    {
        Networking.LocalPlayer.TeleportTo(destination.position, destination.rotation);
    }
}
