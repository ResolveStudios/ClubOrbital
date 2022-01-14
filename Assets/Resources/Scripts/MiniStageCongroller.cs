
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class MiniStageCongroller : UdonSharpBehaviour
{
    [UdonSynced] public bool showPole;
    [UdonSynced] public bool showBase;
    [Space]
    public Animator anim;

    private void Update()
    {
        anim.SetFloat("Pole", Mathf.Lerp(anim.GetFloat("Pole"), showPole ? 1 : 0, Time.deltaTime));
        anim.SetFloat("Base", Mathf.Lerp(anim.GetFloat("Base"), showBase ? 1 : 0, Time.deltaTime));
    }

    public void ToggleBase()
    {
        Networking.SetOwner(Networking.LocalPlayer, gameObject);
        showBase = !showBase;
        if(!showBase) showPole = false;
    }
    public void TogglePole()
    {
        Networking.SetOwner(Networking.LocalPlayer, gameObject);
        showPole = !showBase ? false : !showPole;
    }
}
