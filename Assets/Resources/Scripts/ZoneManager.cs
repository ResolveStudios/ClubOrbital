
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

[ExecuteInEditMode]
public class ZoneManager : UdonSharpBehaviour
{
    public float UnloadDistance = 100f;
    public bool debug;
    public bool _debug;

    private void Update()
    {
        var dis = Vector3.Distance(transform.position, Networking.LocalPlayer.GetPosition());
        transform.GetChild(0).gameObject.SetActive(dis < UnloadDistance + 5);

        OnDrawDebug();
    }

    public void _show() => transform.GetChild(0).gameObject.SetActive(true);
    public void _hide() => transform.GetChild(0).gameObject.SetActive(false);

    private void OnDrawDebug()
    {
        Debug.DrawLine(transform.position, transform.forward * UnloadDistance, new Color(0, 0, 1));
        Debug.DrawLine(transform.position, -transform.forward * UnloadDistance, new Color(0.2f, 0.2f, 1));
    }
}
