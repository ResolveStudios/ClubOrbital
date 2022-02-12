using Okashi.Permissions;
using ReimajoBoothAssets;
using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon.Common.Interfaces;

public class Amplifier : UdonSharpBehaviour
{
    public float gain = 30;
    public float near = 500;
    public float far = 1000;
    [UdonSynced] public string player;
    [UdonSynced] public bool amplified;

    public Amplifier[] amplifiers;

    [SerializeField] private TextMeshPro textMesh;
    [SerializeField] private PermissionDriver driver;
    [SerializeField] private Animator indicatorBand;

    
    public override void OnPickupUseDown()
    {
        if(string.IsNullOrEmpty(player))
        {
            Networking.SetOwner(Networking.LocalPlayer, gameObject);
            player = Networking.LocalPlayer.displayName;
        }
        else
        {
            if(player == Networking.LocalPlayer.displayName || driver.hasPermissions(Networking.LocalPlayer))
            {
                Networking.SetOwner(Networking.LocalPlayer, gameObject);
                amplified = false;
                player = string.Empty;
            }
        }
    }
    public void Execute()
    {
        if(Networking.IsOwner(Networking.LocalPlayer, gameObject))
        {
            amplified = !amplified;
        }
        else
        {
            if(driver.hasPermissions(Networking.LocalPlayer))
            {
                Networking.SetOwner(Networking.LocalPlayer, gameObject);
                amplified = false;
            }
        } 

        if(amplified && string.IsNullOrEmpty(player))
        {
            amplified = false;
        }


    }
    
    public override void PostLateUpdate()
    {
        var players = new VRCPlayerApi[80];
        players = VRCPlayerApi.GetPlayers(players);

        foreach (var p in players)
        {
            var amp = GetAmp(p);
            if (amp == null) Deamp(p);

            if (p.displayName == player && amplified) Amp(p);
        }

        if (indicatorBand)
            indicatorBand.SetBool("on", amplified);
    }

    private Amplifier GetAmp(VRCPlayerApi p)
    {
        foreach (var amp in amplifiers)
            if (amp.player == p.displayName) return amp;
        return null;
    }


    private void Deamp(VRCPlayerApi p)
    {
        p.SetVoiceGain(15);
        p.SetVoiceDistanceNear(5);
        p.SetVoiceDistanceFar(50);
    }
    private void Amp(VRCPlayerApi p)
    {
        p.SetVoiceGain(gain);
        p.SetVoiceDistanceNear(near);
        p.SetVoiceDistanceFar(far);
    }
}
