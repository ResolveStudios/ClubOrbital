
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class TPPlayer : UdonSharpBehaviour
{
    public Transform destination;

    public override void OnPlayerTriggerEnter(VRCPlayerApi player)
    {
        if (destination)
            player.TeleportTo(destination.position, Quaternion.identity);
    }
}
