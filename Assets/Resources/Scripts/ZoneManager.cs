
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

[ExecuteInEditMode]
public class ZoneManager : UdonSharpBehaviour
{
    public float UnloadDistance = 100f;

    private void Update()
    {
        var dis = Vector3.Distance(transform.position, Networking.LocalPlayer.GetPosition());
        transform.GetChild(0).gameObject.SetActive(dis < UnloadDistance + 5);

        OnDrawDebug();
    }

    private void OnDrawDebug()
    {
        Debug.DrawLine(transform.position, transform.forward * UnloadDistance, new Color(0, 0, 1));
        Debug.DrawLine(transform.position, -transform.forward * UnloadDistance, new Color(0.2f, 0.2f, 1));
    }
}
