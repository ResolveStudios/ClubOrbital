
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class MultiMirrorToggle : UdonSharpBehaviour
{
    public int mode;

    public GameObject HQMirror;
    public GameObject LQMirror;

    public void Switch()
    {
        mode++;
        if (mode > 2) mode = 0;
        switch(mode)
        {
            case 0:
                HQMirror.SetActive(false);
                LQMirror.SetActive(false);
                break;
            case 1:
                HQMirror.SetActive(false);
                LQMirror.SetActive(true);
                break;
            case 2:
                HQMirror.SetActive(true);
                LQMirror.SetActive(false);
                break;
        }
    }

    public override void PostLateUpdate()
    {
        if (mode > 0)
        {
            var dis = Vector3.Distance(Networking.LocalPlayer.GetPosition(), transform.position);
            if (dis > 12)
            {
                mode = 0;
                HQMirror.SetActive(false);
                LQMirror.SetActive(false);
            }
        }
    }
}
