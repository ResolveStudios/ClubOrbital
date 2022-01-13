
using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class UdonCalenderEventDetail : UdonSharpBehaviour
{
    public DateTime startDate;
    public DateTime endDate;
    public string memo;
    public string desc;
    public Color color;
    [Space]
    public TextMeshPro timeDisplay;
    public TextMeshPro memoDispaly;
    public TextMeshPro descDisplay;

    void Start()
    {
        
    }
}
