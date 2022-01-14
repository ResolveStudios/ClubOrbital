
using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using UnityEngine.UI;
using VRC.SDKBase;
using VRC.Udon;

public class DancerServiceManager_Button : UdonSharpBehaviour
{
    public DancerServiceManager manager;
    public string managerMethod;

    public Image background;
    public Image icon;
    public Image not;
    public TextMeshProUGUI label;
    
    public void UpdateColor(int index)
    {
        if (index == 0) background.color = Color.grey;
        else if (index == 1) background.color = Color.green;
        else if (index == 2) background.color = Color.gray;
    }
    public void UpdateIcon(int index)
    {
        not.gameObject.SetActive(index == 2);
    }

    public override void Interact()
    {
        manager.SendCustomEvent(managerMethod);
    }
}
