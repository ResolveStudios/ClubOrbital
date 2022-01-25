
using Okashi.Permissions;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class ElevatingDoor : UdonSharpBehaviour
{
    public PermissionManager manager;
    public GameObject door;
    public bool isOpen;
    public float localYMin = 0;
    public float localYMax = 0;
    private float cur = 0;
    private float t = 0;
    public ulong[] permids;

    public override void OnPlayerTriggerEnter(VRCPlayerApi player)
    {
        if (manager)
        {
            if (manager.HasPermissionIDAny(player, permids))
            {

            }
        }
        else
        {
            isOpen = true;
            t = 0;
        }
    }
    public override void OnPlayerTriggerExit(VRCPlayerApi player) { isOpen = false; t = 0; }


    
    public override void PostLateUpdate()
    {
        t += Time.deltaTime;
        cur = Mathf.Lerp(cur, isOpen ? localYMax : localYMin, t);
        if(door)
        {
            door.transform.localPosition = new Vector3(door.transform.localPosition.x, cur, door.transform.localPosition.z);
            if (isOpen && door.transform.localPosition.y >= localYMax) t = 0;
            else if (!isOpen && door.transform.localPosition.y >= localYMin) t = 0;
        }
    }
}
