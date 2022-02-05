
using Okashi.Permissions;
using Okashi.UI;
using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class AmplifiedBox : UdonSharpBehaviour
{
    public GameObject controlPanel;
    public PermissionDriver driver;
    [Space]
    public float near = 500;
    public float far = 1000;
    public float gain = 50;
    [Space]
    [UdonSynced] public string _slot1;
    [UdonSynced] public string _slot2;
    [UdonSynced] public string _slot3;
    [UdonSynced] public string _slot4;
    [UdonSynced] public string _slot5;
    [UdonSynced] public string _slot6;
    [UdonSynced] public string _slot7;
    [UdonSynced] public string _slot8;
    [UdonSynced] public string _slot9;
    [UdonSynced] public string _slot10;
    [UdonSynced] public string _slot11;
    [UdonSynced] public string _slot12;
    [Space]
    public GameObject slotButton1;
    public GameObject slotButton2;
    public GameObject slotButton3;
    public GameObject slotButton4;
    public GameObject slotButton5;
    public GameObject slotButton6;
    public GameObject slotButton7;
    public GameObject slotButton8;
    public GameObject slotButton9;
    public GameObject slotButton10;
    public GameObject slotButton11;
    public GameObject slotButton12;

    public AdvancedSlider voiceNear;
    public AdvancedSlider voiceFar;
    public AdvancedSlider voiceGain;


    public override void PostLateUpdate()
    {
        if(IsPlayerAmplified(Networking.LocalPlayer))
            DrawAmplifiedLines(Networking.LocalPlayer);

        slotButton1.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot1) ? _slot1 : "Become Amplified";
        slotButton2.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot2) ? _slot2 : "Become Amplified";
        slotButton3.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot3) ? _slot3 : "Become Amplified";
        slotButton4.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot4) ? _slot4 : "Become Amplified";
        slotButton5.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot5) ? _slot5 : "Become Amplified";
        slotButton6.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot6) ? _slot6 : "Become Amplified";
        slotButton7.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot7) ? _slot7 : "Become Amplified";
        slotButton8.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot8) ? _slot8 : "Become Amplified";
        slotButton9.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot9) ? _slot9 : "Become Amplified";
        slotButton10.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot10) ? _slot10 : "Become Amplified";
        slotButton11.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot11) ? _slot11 : "Become Amplified";
        slotButton12.transform.Find("Text (TMP)").GetComponent<TextMeshPro>().text = !string.IsNullOrEmpty(_slot12) ? _slot12 : "Become Amplified";


        if(voiceNear) near = voiceNear.GetValue();
        if(voiceFar ) far = voiceFar.GetValue();
        if(voiceGain) gain = voiceGain.GetValue();
    }

    private void DrawAmplifiedLines(VRCPlayerApi player)
    {
        var node = transform.Find("VoiceDebug");
        if (node)
        {
            node.position = player.GetPosition() + (Vector3.up * 1.5f);
            Debug.DrawLine(node.position, node.position + node.forward * near, Color.green);
            Debug.DrawLine(node.position + (Vector3.up * 0.02f), node.position + (Vector3.up * 0.02f) + node.forward * far, Color.blue);
            Debug.DrawLine(node.position + (Vector3.up * 0.04f), node.position + (Vector3.up * 0.04f) + node.forward * gain, Color.yellow);
        }
    }

    private void AmplifiyPlayer(VRCPlayerApi player)
    {
        player.SetVoiceDistanceNear(near);
        player.SetVoiceDistanceFar(far);
        player.SetVoiceGain(gain);
    }
    private void DeamplifyPlayer(VRCPlayerApi player)
    {
        player.SetVoiceDistanceNear(10);
        player.SetVoiceDistanceFar(25);
        player.SetVoiceGain(15);
    }

    public override void OnPlayerTriggerStay(VRCPlayerApi player)
    {
        Debug.Log($"{player.displayName} is in booth");
        if (player == Networking.LocalPlayer)
            if(controlPanel) controlPanel.SetActive(true);
        if (IsPlayerAmplified(player)) AmplifiyPlayer(player);
        else if (!IsPlayerAmplified(player)) DeamplifyPlayer(player);
    }
    public override void OnPlayerTriggerExit(VRCPlayerApi player)
    {
        Debug.Log($"{player.displayName} left the booth");
        DeamplifyPlayer(player);
        if (player == Networking.LocalPlayer)
        {
            if (controlPanel)
            {
                controlPanel.SetActive(false);
            }
        }
    }

    public bool IsPlayerAmplified(VRCPlayerApi player)
    {
        if (_slot1 == player.displayName) return true;
        else if (_slot2 == player.displayName) return true;
        else if (_slot3 == player.displayName) return true;
        else if (_slot4 == player.displayName) return true;
        else if (_slot5 == player.displayName) return true;
        else if (_slot6 == player.displayName) return true;
        else if (_slot7 == player.displayName) return true;
        else if (_slot8 == player.displayName) return true;
        else if (_slot9 == player.displayName) return true;
        else if (_slot10 == player.displayName) return true;
        else if (_slot11 == player.displayName) return true;
        else if (_slot12 == player.displayName) return true;
        return false;
    }
    private string AssignSlot(string slot)
    {
        if (!string.IsNullOrEmpty(slot) && slot == Networking.LocalPlayer.displayName)
        {
            Networking.SetOwner(Networking.LocalPlayer, gameObject);
            DeamplifyPlayer(Networking.LocalPlayer);
            return string.Empty;
        }
        else if (!string.IsNullOrEmpty(slot) && (driver != null && driver.hasPermissions(Networking.LocalPlayer)))
        {
            Networking.SetOwner(Networking.LocalPlayer, gameObject);
            DeamplifyPlayer(Networking.LocalPlayer);
            return string.Empty;
        }
        else if (!string.IsNullOrEmpty(slot)) return slot;

        if(string.IsNullOrEmpty(slot))
        {
            Networking.SetOwner(Networking.LocalPlayer, gameObject);
            return Networking.LocalPlayer.displayName;
        }

        return slot;
    }
    private string ClearSlot(string slot)
    {
        if (slot == Networking.LocalPlayer.displayName) return string.Empty;
        return slot;
    }

    public void slot1() 
    {
        _slot1 = AssignSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = ClearSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = ClearSlot(_slot8); 
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot2()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = AssignSlot(_slot2);
        _slot3 = ClearSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = ClearSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot3()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = AssignSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7); 
        _slot8 = ClearSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot4()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot1);
        _slot3 = ClearSlot(_slot2);
        _slot4 = AssignSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = ClearSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot5()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = ClearSlot(_slot4);
        _slot4 = ClearSlot(_slot5);
        _slot5 = AssignSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = ClearSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot6()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = ClearSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = AssignSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = ClearSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot7()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = ClearSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = AssignSlot(_slot7);
        _slot8 = ClearSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot8()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = ClearSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = AssignSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot9()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = ClearSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = ClearSlot(_slot8);
        _slot9 = AssignSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot10()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = ClearSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = ClearSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = AssignSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot11()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = ClearSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = ClearSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = AssignSlot(_slot11);
        _slot12 = ClearSlot(_slot12);
    }
    public void slot12()
    {
        _slot1 = ClearSlot(_slot1);
        _slot2 = ClearSlot(_slot2);
        _slot3 = ClearSlot(_slot3);
        _slot4 = ClearSlot(_slot4);
        _slot5 = ClearSlot(_slot5);
        _slot6 = ClearSlot(_slot6);
        _slot7 = ClearSlot(_slot7);
        _slot8 = ClearSlot(_slot8);
        _slot9 = ClearSlot(_slot9);
        _slot10 = ClearSlot(_slot10);
        _slot11 = ClearSlot(_slot11);
        _slot12 = AssignSlot(_slot12);
    }
}
