
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class PoolTableToggle : UdonSharpBehaviour
{
    public Animator anim;
    [UdonSynced] public bool on;

    public void Update()
    {
        if (!anim) anim = (Animator)GetComponent(typeof(Animator));

        var value = anim.GetFloat("Show");
        value = Mathf.Lerp(value, on ? 1 : 0, Time.deltaTime);
        anim.SetFloat("Show", value);
    }

    public void Toggle() => on = !on;
}
