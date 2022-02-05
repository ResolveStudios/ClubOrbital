
using UdonSharp;
using VRC.SDKBase;
using VRC.Udon;

public class InteractButton : UdonSharpBehaviour
{
    public UdonBehaviour udonBehaviour;
    public string method;
    public override void Interact()
    {
        Networking.SetOwner(Networking.LocalPlayer, udonBehaviour.gameObject);
        udonBehaviour.SendCustomEvent(method);
    }
}
