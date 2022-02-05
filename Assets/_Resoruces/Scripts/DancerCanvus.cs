
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class DancerCanvus : UdonSharpBehaviour
{
    [SerializeField] private int cardIndex;
    public float _time = 0f;
    public float _maxTime = 5f;


    public override void PostLateUpdate()
    {
        var pivot = transform.Find("Container/Pivot");
        _time += 1 * Time.deltaTime;
        if(_time >= _maxTime)
        {
            _time = 0f;
            cardIndex++;
            if(cardIndex > pivot.childCount - 1) cardIndex = 0;
        }

        if (pivot != null)
            pivot.localPosition = Vector3.Lerp(pivot.localPosition, new Vector3(cardIndex * -1080, 0, 0), _time * Time.deltaTime);
    }
}
