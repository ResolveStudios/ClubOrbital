
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class HostUI : UdonSharpBehaviour
{
    public GameObject hButtonOff;
    public GameObject hButtonBooth;
    public GameObject hButtonOn;

    [UdonSynced, Range(0, 2)] public int boothMode = 0;

    public override void PostLateUpdate()
    {
        SetColorHButton(hButtonOff, 0, Color.red, new Color(1f, 0.5f, 0.5f));
        SetColorHButton(hButtonOn, 1, Color.blue, new Color(0.5f, 0.5f, 1f));
        SetColorHButton(hButtonBooth, 2, Color.green, new Color(0.5f, 1f, 0.5f));
    }

    private void SetColorHButton(GameObject button, int mode, Color on, Color off)
    {
        Transform _graphics = null;
        MeshRenderer _renderer = null;
        if (hButtonOff) _graphics = button.transform.Find("Mesh/Mesh (1)");
        if(_graphics) _renderer = _graphics.GetComponent<MeshRenderer>();
        if(_renderer) _renderer.material.SetColor("_Color", boothMode == mode ? on : off);
    }

    public void BoothOff()
    {
        Networking.SetOwner(Networking.LocalPlayer, gameObject);
        boothMode = 0;
    }
    public void BoothLocal()
    {
        Networking.SetOwner(Networking.LocalPlayer, gameObject);
        boothMode = 1;
    }
    public void BoothStage()
    {
        Networking.SetOwner(Networking.LocalPlayer, gameObject);
        boothMode = 2;
    }

    public void SetPlayerVoiceHear(VRCPlayerApi player)
    {
        player.SetVoiceDistanceFar(500);
        player.SetVoiceDistanceNear(250);
        player.SetVoiceGain(-10);
    }
    public void SetPlayerVoiceNormal(VRCPlayerApi player)
    {
        player.SetVoiceDistanceFar(25);
        player.SetVoiceDistanceNear(0);
        player.SetVoiceGain(10);
    }


    public override void OnPlayerTriggerExit(VRCPlayerApi player)
    {
        SetPlayerVoiceNormal(player);

    }
    public override void OnPlayerTriggerStay(VRCPlayerApi player)
    {
        if(boothMode == 2)
        {
            SetPlayerVoiceHear(player);
        }
        if (boothMode == 1)
        {
            if (player == Networking.GetOwner(gameObject))
                SetPlayerVoiceHear(player);
        }
    }
}