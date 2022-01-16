
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class ZoneManager : UdonSharpBehaviour
{
    public float UnloadDistance = 100f;

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.blue;
        Gizmos.DrawWireSphere(transform.position, UnloadDistance);
    }

    private void Update()
    {
        var dis = Vector3.Distance(transform.position, Networking.LocalPlayer.GetPosition());
        transform.GetChild(0).gameObject.SetActive(dis < UnloadDistance);
    }
}
