
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class PlayerTriggerEnter : UdonSharpBehaviour
{

    public GameObject toggleObject;
    public override void OnPlayerTriggerEnter(VRCPlayerApi player)
    {
        if(Networking.LocalPlayer == player && toggleObject != null)
            toggleObject.SetActive(true);
    }
    public override void OnPlayerTriggerExit(VRCPlayerApi player)
    {
        if(Networking.LocalPlayer == player && toggleObject != null)
            toggleObject.SetActive(false);
    }
}
