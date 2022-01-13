
using Okashi.Permissions;
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;

public class DancerServiceManager : UdonSharpBehaviour
{
    public PermissionManager manager;
    public DancerServiceManager_Button touchButon;
    public int touchIndex;

    private void Start()
    {
        UpdateButton(touchButon);
    }


    public void TouchToggle()
    {
        var icon = manager.FindPlayerIcon(Networking.LocalPlayer, "TouchIcon");
        if (icon == null) return;
        touchIndex++;
        if (touchIndex > 2) touchIndex = 0;
        Networking.SetOwner(Networking.LocalPlayer, icon.gameObject);
        icon.index = touchIndex;
        UpdateButton(touchButon);
    }

    private void UpdateButton(DancerServiceManager_Button button)
    {
        if (button)
        {
            button.UpdateColor(touchIndex);
            button.UpdateIcon(touchIndex);
        }
    }
}
