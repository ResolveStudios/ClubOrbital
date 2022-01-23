using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteAlways]
public class MeeterStick : MonoBehaviour
{
    [Range(1, 12)]
    public float feet;
    [Range(1, 12)]
    public float inches;
    [SerializeField] private float meeters = 1f;

    private void Update()
    {
        meeters = (feet + (inches / 12)) / 3.28f;
        var stick = transform.GetChild(0);
        stick.localScale = new Vector3(0.1f, meeters, 0.1f);
        stick.localPosition = Vector3.up * (meeters / 2);
    }
}
