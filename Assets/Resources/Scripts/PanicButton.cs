
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRCAudioLink;

public class PanicButton : UdonSharpBehaviour
{
    public AudioLink audioLink;
    public GameObject postProcessing;
    public void Panic()
    {
        if(audioLink) audioLink.audioSource.mute = true;
        if(postProcessing) postProcessing.SetActive(false);
    }
}
