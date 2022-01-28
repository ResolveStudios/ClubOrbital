using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ObjectPlacer : MonoBehaviour
{
    [SerializeField] private float radius = 1f;
    [SerializeField] private bool faceIn;

    [SerializeField] private float _time, _maxTime = 3f;

    private void OnValidate()
    {
        DoLayout();
    }

    private void Update()
    {
        _time += 1 * Time.deltaTime;
        if(_time >= _maxTime)
        {
            _time = 0;
            DoLayout();
        }
    }
    private void DoLayout()
    {
        var count = transform.childCount;
        for (int i = 0; i < count; i++)
        {
            float angle = i * Mathf.PI * 2f / count;
            Vector3 newPos = new Vector3(Mathf.Cos(angle) * radius, 0, Mathf.Sin(angle) * radius);
            transform.GetChild(i).localPosition = newPos;
            transform.GetChild(i).localRotation = Quaternion.identity;
            var forward = !faceIn ? transform.GetChild(i).position - transform.position :
                transform.position - transform.GetChild(i).position;
            var lookat = Quaternion.LookRotation(forward, Vector3.up);
            transform.GetChild(i).rotation = new Quaternion(0, lookat.y, 0, lookat.w);

        }
    }
}
