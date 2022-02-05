
using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class DancerCanvusEntry : UdonSharpBehaviour
{
    public string topLabel = "Club Orbital";
    public string sideLabel = "Example";
    public string bottomLabel = "Example";
    public Sprite sprite = null;

    public override void PostLateUpdate()
    {
        var tl = transform.Find("TopLable");
        if (tl != null)
            tl.GetComponent<TextMeshPro>().text = topLabel;
        var vl = transform.Find("VerticleLabel");
        if (vl != null)
            vl.GetComponent<TextMeshPro>().text = sideLabel;
        var bl = transform.Find("BottomLable");
        if (bl != null)
            bl.GetComponent<TextMeshPro>().text = bottomLabel;

        var cs = transform.Find("CommingSoon");
        if(cs != null)
            cs.gameObject.SetActive(sprite == null);
    }

    public void SetInfo(string v1, string v2, Sprite v3)
    {
        sideLabel = v1;
        bottomLabel = v2;
        sprite = v3;
    }
}
