
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class ImageCaracel : UdonSharpBehaviour
{
    [Range(1, 9)] public int imageIndex = 1;

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
            if(imageIndex > 9)
            {
                imageIndex = 1;
            }
        }
        MovePanel();
    }

    private void MovePanel()
    {
        if(!pivot) pivot = transform.Find("Pivot");
        var x = 0;
        var y = 0;

        if(imageIndex == 1) { x = 1080; y = -1920; }
        else if (imageIndex == 2) { x = 0; y = -1920; }
        else if (imageIndex == 3) { x = -1080; y = -1920; }
        else if (imageIndex == 4) { x = 1080; y = 0; }
        else if (imageIndex == 5) { x = 0; y = 0; }
        else if (imageIndex == 6) { x = -1080; y = 0; }
        else if (imageIndex == 7) { x = 1080; y = 1920; }
        else if (imageIndex == 7) { x = 0; y = 1920; }
        else if (imageIndex == 9) { x = -1080; y = 1920; }

        if (pivot)
        {
            spd += 10 * Time.deltaTime;
            if (spd > 20) spd = 20;
            pivot.localPosition = Vector3.Lerp(pivot.localPosition, new Vector2(x, y), spd * Time.deltaTime);
        }
    }
}
