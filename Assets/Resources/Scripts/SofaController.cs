
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class SofaController : UdonSharpBehaviour
{
    public bool collidersOn = true;
    public bool chairsOn = true;
    public GameObject[] colliders;
    public GameObject[] chairs;

    public override void PostLateUpdate()
    {
        foreach (var item in colliders) item.SetActive(collidersOn);
        foreach (var item in chairs) item.SetActive(chairsOn);
    }

    public void ToggleColliders() => collidersOn = !collidersOn;
    public void ToggleChirs() => chairsOn = !chairsOn;
}
