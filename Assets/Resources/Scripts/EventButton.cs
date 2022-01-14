
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class EventButton : UdonSharpBehaviour
{
    public bool useGlobal;
    public UdonSharpBehaviour behaviour;
    public string function;

    public override void Interact()
    {
        if (useGlobal)
        {
            Networking.SetOwner(Networking.LocalPlayer, behaviour.gameObject);
            behaviour.SendCustomEvent(function);
        }
        else
        {
            behaviour.SendCustomEvent(function);
        }
    }
}
