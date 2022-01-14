
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class ImageCaracel : UdonSharpBehaviour
{
    public int imageIndex = 0;
    public float maxTime = 20;
    [SerializeField] private float _time;

    public Sprite[] images;
    private ImageCaracelEntry[] entries;
    [SerializeField] private Transform pivot;
    private float spd = 1f;

    private void Start()
    {
        entries = GetComponentsInChildren<ImageCaracelEntry>();
        for (int i = 0; i < entries.Length; i++)
        {
            entries[i].SetSprite(images[i]);
            entries[i].SetTopLabel("Club Orbital");
            entries[i].SetBottomLabel("Official Dancer");
        }
    }

    public override void PostLateUpdate()
    {
        _time += 1 * Time.deltaTime;
        if(_time >= maxTime)
        {
            _time = 0f;
            imageIndex++;
            spd = 1f;
            if(imageIndex >= entries.Length)
            {
                imageIndex = 0;
            }
        }
        MovePanel();
    }

    private void MovePanel()
    {
        if(!pivot) pivot = transform.Find("Pivot");
        var y = (1920 + 50) * imageIndex; 
        if (pivot)
        {
            spd += 10 * Time.deltaTime;
            if (spd > 20) spd = 20;
            pivot.localPosition = Vector3.Lerp(pivot.localPosition, new Vector2(0, y), spd * Time.deltaTime);
        }
    }
}
