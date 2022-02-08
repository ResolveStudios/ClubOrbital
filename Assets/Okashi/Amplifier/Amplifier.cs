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
    private string playerSave;
    [SerializeField] private TextMeshPro textMesh;
    [SerializeField] private PermissionDriver driver;
    [SerializeField] private Animator indicatorBand;

    private VRCPlayerApi GetPlayer(string name) 
    {
        var  _players = new VRCPlayerApi[80];
        _players = VRCPlayerApi.GetPlayers(_players);
        foreach (var _player in _players)
        {
            if (_player == null) return null;
            if (_player.displayName == player || _player.displayName == name)
                return _player;
        }
        return null;
    }

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
                playerSave = player;
                player = string.Empty;
                SendCustomNetworkEvent(NetworkEventTarget.All, "ResetVoice");
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


    public void ResetVoice()
    {
        var _player = GetPlayer(playerSave);
        if (_player != null)
        {
            _player.SetVoiceGain(15);
            _player.SetVoiceDistanceNear(5);
            _player.SetVoiceDistanceFar(50);
        }
        playerSave = String.Empty;
    }


    public override void OnDeserialization()
    {
        if (textMesh) textMesh.text = player;
        var _player = GetPlayer(null);
        if (amplified)
        {
            if (player != null)
            {
                _player.SetVoiceGain(gain);
                _player.SetVoiceDistanceNear(near);
                _player.SetVoiceDistanceFar(far);
            }
        }
        else
        {
            if (_player != null)
            {
                _player.SetVoiceGain(15);
                _player.SetVoiceDistanceNear(5);
                _player.SetVoiceDistanceFar(50);
            }
        }

        if (indicatorBand)
            indicatorBand.SetBool("on", !string.IsNullOrEmpty(player) && amplified);


    }
}
