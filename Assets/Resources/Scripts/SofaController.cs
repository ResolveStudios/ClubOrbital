
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class SofaController : UdonSharpBehaviour
{
    public bool collidersOn = true;
    public bool chairsOn = true;
    public MeshCollider[] colliders;
    public GameObject[] chairs;
    public void ToggleColliders()
    {
        collidersOn = !collidersOn;
        foreach (var item in colliders)
            item.enabled = collidersOn;
    }
    public void ToggleChirs()
    {
        chairsOn = !chairsOn;
        foreach (var item in chairs)
            item.SetActive(chairsOn);
    }
}
