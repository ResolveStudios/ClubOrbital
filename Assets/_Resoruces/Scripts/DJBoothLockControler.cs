
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class DJBoothLockControler : UdonSharpBehaviour
{
    public AmplifiedBox djamplifier;
    public GameObject unlockedObject;
    public GameObject lockedObject;

    public override void PostLateUpdate()
    {
        if (djamplifier != null)
        {
            var show = djamplifier.IsPlayerAmplified(Networking.LocalPlayer);
            unlockedObject.SetActive(show);
            lockedObject.SetActive(!show);
        }
    }
}
