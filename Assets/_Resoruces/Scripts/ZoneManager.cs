
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

[RequireComponent(typeof(BoxCollider))]
public class ZoneManager : UdonSharpBehaviour
{
    public GameObject[] subObjects;
    public GameObject Zone()
    {
        return transform.Find("zone").gameObject;
    }
    
    public void Show()
    {
        Zone().SetActive(true);
        if (subObjects.Length > 0)
            foreach (var item in subObjects) 
                item.SetActive(true);
    }
    public void Hide()
    {
        Zone().SetActive(false);
        if (subObjects.Length > 0)
            foreach (var item in subObjects)
                item.SetActive(false);
    }

    public override void OnPlayerTriggerEnter(VRCPlayerApi player)
    {
        if(Networking.LocalPlayer == player)  Show();
    }
    public override void OnPlayerTriggerExit(VRCPlayerApi player)
    {
        if (Networking.LocalPlayer == player) Hide();
    }
}
