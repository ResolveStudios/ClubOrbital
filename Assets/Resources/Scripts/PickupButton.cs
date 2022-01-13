
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class PickupButton : UdonSharpBehaviour
{
    public VRC_Pickup pickup;
    public GameObject _object;
    [UdonSynced] public bool isOn;

    public override void OnPickupUseDown()
    {
        Networking.IsOwner(gameObject);
        isOn = !isOn;
    }

    private void Update()
    {
        _object.SetActive(isOn);
    }
}
