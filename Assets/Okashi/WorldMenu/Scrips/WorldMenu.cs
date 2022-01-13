
using UdonSharp;
using UnityEngine;
using UnityEngine.UI;
using VRC.SDKBase;
using VRC.Udon;

public class WorldMenu : UdonSharpBehaviour
{
    public GameObject GlobalPostProcessing;
    public Button GlobalPostProcessingButton;
    [Header("Lobby")]
    public Button l_ChairColliderButton;
    public Collider[] l_ChairColliders;
    private bool _on;

    public override void PostLateUpdate()
    {
        GetComponent<Animator>().SetFloat("alpha", Mathf.Lerp(GetComponent<Animator>().GetFloat("alpha"), _on ? 1 : 0, Time.deltaTime));
        if(GlobalPostProcessingButton)
        {
            GlobalPostProcessingButton.targetGraphic.color =
                !GlobalPostProcessing ? Color.grey : GlobalPostProcessing.activeSelf ? Color.green : Color.grey;
        }
        if (l_ChairColliderButton)
        {
            l_ChairColliderButton.targetGraphic.color =
                l_ChairColliders.Length <= 0 ? Color.grey : l_ChairColliders[0].enabled ? Color.green : Color.grey;
        }

        if (Input.GetKeyDown(KeyCode.O) || Input.GetButtonDown("Fire2")) ToggleMenu();
        
    }

    public void ToggleMenu()
    {
        _on = !_on;
        if(Networking.LocalPlayer.IsUserInVR())
        {

        }
        else
        {
            var menu = GameObject.Find("WorldCanvas");
            if (_on)
            {
                var rt = GetComponent<RectTransform>();
                rt.anchorMin = Vector2.one * 0.5f;
                rt.anchorMax = Vector2.one * 0.5f;
                rt.localPosition = Vector3.zero;
                rt.localRotation = Quaternion.identity;
                rt.localScale = Vector3.one;

            }
            else
            {
                var rt = GetComponent<RectTransform>();
                rt.localScale = Vector3.one * 0.002f;
            }
        }
     
    }

    public void ToggleGPP() => GlobalPostProcessing.SetActive(!GlobalPostProcessing.activeSelf);
    public void ToggleLCC()
    {
        var on = l_ChairColliders[0].enabled;
        foreach (var col in l_ChairColliders)
            col.enabled = !on;
    }
}
