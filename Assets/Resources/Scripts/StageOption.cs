
using UdonSharp;
using UnityEngine;
using UnityEngine.UI;
using VRC.SDKBase;
using VRC.Udon;

public class StageOption : UdonSharpBehaviour
{
    [UdonSynced] public bool isPoleOn = true;
    public Toggle poleToggle;
    public GameObject pole;

    [UdonSynced] public bool isGlassOn = false;
    public Toggle glassToggle;
    public GameObject glass;

    private void Start()
    {
        poleToggle.isOn = isPoleOn;
        if(pole) pole.SetActive(isPoleOn);

        glassToggle.isOn = isGlassOn;
        if(glass) glass.SetActive(isGlassOn);
    }

    public void TogglePole()
    {
        if (!pole) return;
        Networking.SetOwner(Networking.LocalPlayer, gameObject);
        isPoleOn = !isPoleOn;
        if (pole) pole.SetActive(isPoleOn);
    }

    public void ToggleGlass()
    {
        if (!glass) return;
        Networking.SetOwner(Networking.LocalPlayer, gameObject);
        isGlassOn = !isGlassOn;
        if(glass) glass.SetActive(isGlassOn);
    }
}
