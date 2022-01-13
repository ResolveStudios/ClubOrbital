using System;
using UnityEngine;

[Serializable]
public class CalenderEvent
{
    public float r = 1, g = 1, b = 1, a = 1;
    public string memo = string.Empty;
    public string desc = string.Empty;
    public DateTime eventStart = DateTime.Now;
    public DateTime eventEnd = DateTime.Now;

    public CalenderEvent()
    {
    }

    public CalenderEvent(DateTime eventStart, DateTime eventEnd, string memo, string descripton, Color color)
    {
        r = color.r;
        g = color.g;
        b = color.b;
        a = color.a;
        this.memo = memo;
        this.desc = descripton;
        this.eventStart = eventStart;
        this.eventEnd = eventEnd;
    }

    public void SetColor(Color color) { r = color.r; g = color.g; b = color.b; a = color.a; }
    public Color GetColor() => new Color(r, g, b, a);
}