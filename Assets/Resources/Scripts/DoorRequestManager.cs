
using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Enums;
using VRC.Udon.Common.Interfaces;

public class DoorRequestManager : UdonSharpBehaviour
{
    public GameObject entry;
    public TextMeshPro label;
    public Door door;
    public GameObject doorTrigger;

    public GameObject accept, reject, okay;
    public GameObject source;
    [UdonSynced] public string want_playername;

    public void Show()
    {
        Debug.Log("Show Called!");
        label.text = $"Incomming Request From\n{want_playername}";
        source.SetActive(true);
        entry.SetActive(true);
        doorTrigger.SetActive(false);

        accept.SetActive(true);
        reject.SetActive(true);
        okay.SetActive(false);

        SendCustomEventDelayedSeconds("Close", 15, EventTiming.LateUpdate);
    }
    public void ShowWithMessage(string message)
    {
        Debug.Log("ShowWithMessage Called!");
        label.text = message;
        entry.SetActive(true);
        doorTrigger.SetActive(false);

        accept.SetActive(false);
        reject.SetActive(false);
        okay.SetActive(false);
        SendCustomEventDelayedSeconds("Close", 15, EventTiming.LateUpdate);
    }


    public void Close()
    {
        Debug.Log("Close Called!");
        entry.SetActive(false);
        label.text = string.Empty;
        doorTrigger.SetActive(true);
        door.tpLocation.requestManager.doorTrigger.SetActive(true);

        accept.SetActive(false);
        reject.SetActive(false);
        okay.SetActive(false);
        source.SetActive(false);
    }

    public void Accept() 
    {
        Debug.Log("Accept Called!");
        door.tpLocation.requestManager.SendCustomNetworkEvent(NetworkEventTarget.All, "ShowOkayButton");
        door.requestManager.SendCustomNetworkEvent(NetworkEventTarget.All, "Close");
    }
    public void Okay() 
    {
        Debug.Log("Okay Called!");
        Networking.LocalPlayer.TeleportTo(door.tpLocation.dropOffPoint.position, Quaternion.identity);
        door.tpLocation.requestManager.SendCustomNetworkEvent(NetworkEventTarget.All, "Close");
        Close();
    }

    public void ShowOkayButton()
    {
        Debug.Log("ShowOkayButton Called!");
        okay.SetActive(true);
    }
    public void Reject()
    {
        Debug.Log("Reject Called!");
        door.requestManager.SendCustomNetworkEvent(NetworkEventTarget.All, "Close");
    }

}
