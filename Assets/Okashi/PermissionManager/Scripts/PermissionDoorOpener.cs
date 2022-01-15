
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class PermissionDoorOpener : UdonSharpBehaviour
{
    public bool open;
    private bool opended;
    public float curOpen;
    public float maxOpen = 0.952f;
    public Transform doorLeft, doorRight;

    private float speed = 1;

    public override void PostLateUpdate()
    {
        speed = Mathf.Clamp(speed, 1f, 20f);
        if(open && curOpen != maxOpen)
        {
            speed += Time.deltaTime;
            curOpen = Mathf.Lerp(curOpen, maxOpen, speed * Time.deltaTime);
        }
        else if (!open && curOpen != 0)
        {
            speed += Time.deltaTime;
            curOpen = Mathf.Lerp(curOpen, 0f, speed * Time.deltaTime);
        }
        else
        {
            speed = 1f;
        }

        if (doorLeft) doorLeft.localPosition = Vector3.right * curOpen;
        if (doorRight) doorRight.localPosition = Vector3.right * -curOpen;
    }
}
