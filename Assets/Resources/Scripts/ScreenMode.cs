
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class ScreenMode : UdonSharpBehaviour
{
    [UdonSynced] public bool isDemo = true;

    public GameObject[] DemoScreens;
    public GameObject[] VideoScreens;



    void Start()
    {
        foreach (var dscreen in DemoScreens) dscreen.SetActive(isDemo);
        foreach (var vscreen in VideoScreens) vscreen.SetActive(!isDemo);
    }

    public void Toggle()
    {
        Networking.SetOwner(Networking.LocalPlayer, gameObject);

        isDemo = !isDemo;

        foreach (var dscreen in DemoScreens) dscreen.SetActive(isDemo);
        foreach (var vscreen in VideoScreens) vscreen.SetActive(!isDemo);
    }
}
