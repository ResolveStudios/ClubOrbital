using System.Collections;
using System.Collections.Generic;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

public class Elevating : UdonSharpBehaviour
{
    public Transform door;
    public float min, cur, max;
    public bool open;
    [SerializeField] private bool _open;
    [SerializeField] private float speed = 0;
    
    public override void PostLateUpdate()
    {
        cur = Mathf.Lerp(cur,  open ? max : min, speed * Time.deltaTime);
        if (open && cur >= max)
        {
            _open = open;
            speed = 0;
        }
        else if (!open && cur <= min)
        {
            _open = open;
            speed = 0;
        }
        if (open != _open) speed += 20 * Time.deltaTime;
        speed = Mathf.Clamp(speed, 0, 20);
        door.localPosition = new Vector3(door.localPosition.x, cur, door.localPosition.z);
    }
    public override void OnPlayerTriggerEnter(VRCPlayerApi player)
    {
        open = true;
    }
    public override void OnPlayerTriggerExit(VRCPlayerApi player)
    {
        open = false;
    }
}
