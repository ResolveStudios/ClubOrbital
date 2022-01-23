using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteAlways]
public class MeeterStick : MonoBehaviour
{
    [Range(0, 12)]
    public float feet;
    [Range(0, 12)]
    public float inches;
    [SerializeField] private float meeters = 1f;

    private void Update()
    {
        meeters = (feet + (inches / 12)) / 3.28f;
    }
    private void OnDrawGizmos()
    {
        Gizmos.color = new Color(0, 1, 0, 0.3f);
        Gizmos.DrawCube(transform.position, new Vector3(0.5f, 0, 0.5f));
        Gizmos.color = Color.yellow;
        Gizmos.DrawLine(transform.position,  transform.position + (Vector3.up * meeters));
        Gizmos.color = new Color(0, 0, 1, 0.3f);
        Gizmos.DrawCube(transform.position + (Vector3.up * meeters), new Vector3(0.5f, 0, 0.5f));
    }
}
