using System;
using UnityEngine;

[Serializable]
public class CalenderDay
{
    public int day;
    public int week;
    public int month;
    public int year;
    public float x, y, w = 64, h = 64;
    public float r = 1, g = 1, b = 1, a = 1;
    public CalenderEvent[] events = new CalenderEvent[0];


    public bool isDisabled() => new Color(r, g, b, a) == Color.grey;
    public Color color() => new Color(r, g, b, a);
    public Rect rect() => new Rect(x, y, w, h);
}