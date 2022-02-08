
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class DJBoothLockControler : UdonSharpBehaviour
{
    public Amplifier[] djmics;
    public GameObject unlockedObject;
    public GameObject lockedObject;

    public override void PostLateUpdate()
    {
        // search each djmic to see if player is one 
        foreach (var mic in djmics)
        {
            var show = mic.player == Networking.LocalPlayer.displayName;
            unlockedObject.SetActive(show);
            lockedObject.SetActive(!show);
            break;
        }
    }
}
