
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class KitsuneController : UdonSharpBehaviour
{
    public Transform EyeTracker, Endpoint;
    public Transform Target;
    private void OnDrawGizmos()
    {
        if (EyeTracker)
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawCube(EyeTracker.position, Vector3.one * 0.01f);
        }
        if (Endpoint)
        {
            Gizmos.color = Color.green;
            Gizmos.DrawSphere(Endpoint.position, 0.01f);
        }
        if (EyeTracker && Endpoint)
        {
            Gizmos.color = Color.magenta;
            Gizmos.DrawLine(EyeTracker.position, Endpoint.position);
        }
    }

    private void Update()
    {
        if (Target && EyeTracker)
        {
            EyeTracker.LookAt(Target);
            if (Mathf.Abs(EyeTracker.localRotation.x) <= 30)
                GetComponent<Animator>().SetFloat("EyesX", EyeTracker.localRotation.x);
            if (Mathf.Abs(EyeTracker.localRotation.y) <= 30)
                GetComponent<Animator>().SetFloat("EyesY", EyeTracker.localRotation.y);
        }
    }
}
