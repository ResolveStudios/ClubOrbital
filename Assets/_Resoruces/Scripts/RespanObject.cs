
using UdonSharp;
using VRC.SDK3.Components;
using VRC.SDKBase;

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
