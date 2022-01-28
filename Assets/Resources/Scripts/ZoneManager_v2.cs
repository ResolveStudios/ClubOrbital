
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

[ExecuteInEditMode]
public class ZoneManager_v2 : UdonSharpBehaviour
{    
    public GameObject[] subObjects;
    public override void OnPlayerTriggerStay(VRCPlayerApi player) => ShowArea(player);
    public override void OnPlayerTriggerExit(VRCPlayerApi player) => HideArea(player);
    public bool debug = false;

    
    private void ShowArea(VRCPlayerApi player)
    {
        if (player == Networking.LocalPlayer) _show();
    }
    private void HideArea(VRCPlayerApi player)
    {
        if (player == Networking.LocalPlayer) _hide();
    }

    public void _show()
    {
        debug = true;
        if (transform.childCount > 0)
            transform.GetChild(0).gameObject.SetActive(true);
        foreach (var item in subObjects) item.SetActive(true);
    }
    public void _hide()
    {
        debug = false;
        if (transform.childCount > 0)
            transform.GetChild(0).gameObject.SetActive(false);
        foreach (var item in subObjects) item.SetActive(false);
    }

}
