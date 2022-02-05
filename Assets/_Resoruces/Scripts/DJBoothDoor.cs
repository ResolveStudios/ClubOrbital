using Okashi.Permissions;
using System.Collections;
using System.Collections.Generic;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

public class DJBoothDoor : UdonSharpBehaviour
{
    public bool opened;
    [Space]
    public Transform leftDoor;
    public Transform rightDoor;
    public Transform doorSign;
    [Space]
    public bool unlocked;
    public PermissionDriver driver;

    private Vector3 signscal;
    private void Start()
    {
        if (doorSign != null)
            signscal = doorSign.localScale;
    }

    void Update()
    {
        if (doorSign != null)
            doorSign.localScale = Vector3.Lerp(doorSign.localScale, !opened ? signscal : Vector3.zero, (opened ? 8 : 3) * Time.deltaTime);
        if (leftDoor != null)
            leftDoor.localScale = Vector3.Lerp(leftDoor.localScale, !opened ? Vector3.one : new Vector3(1, 0, 1), (opened ? 3 : 8) * Time.deltaTime);
        if (rightDoor != null)
            rightDoor.localScale = Vector3.Lerp(rightDoor.localScale, !opened ? Vector3.one : new Vector3(1, 0, 1), (opened ? 3 : 8) * Time.deltaTime);
    }

    public override void OnPlayerTriggerEnter(VRCPlayerApi player)
    {
        if(player == Networking.LocalPlayer && (driver.hasPermissions(player) || unlocked))
        {
            opened = true;
        }
    }
    public override void OnPlayerTriggerExit(VRCPlayerApi player)
    {
        if (player == Networking.LocalPlayer && (driver.hasPermissions(player) || unlocked))
        {
            opened = false;
        }
    }
}
