using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using UnityEngine.UI;

public class UdonCalenderEvent : UdonSharpBehaviour
{
    public Color color;
    public string memo = string.Empty;
    public string desc = string.Empty;
    public DateTime eventStart = DateTime.Now;
    public DateTime eventEnd = DateTime.Now;
    public Image background;
    public TextMeshProUGUI lable;
    public Slider slider;

    public void SetColor(Color color) => this.color = color;
    public Color GetColor() => color;
    public void SetMemo(string value )
    {
        if (!lable) lable = (TextMeshProUGUI)GetComponentInChildren(typeof(TextMeshProUGUI), true);
        memo = value;
    }
    public void SetDesc(string value)
    {
        if (!lable) lable = (TextMeshProUGUI)GetComponentInChildren(typeof(TextMeshProUGUI), true);
        desc = value;
    }

    public void UpdateMe()
    {
        if (!background) background = (Image)GetComponentInChildren(typeof(Image), true);
        if (!lable) lable = (TextMeshProUGUI)GetComponentInChildren(typeof(TextMeshProUGUI), true);
        if (!slider) slider = (Slider)GetComponentInChildren(typeof(Slider), true);

        lable.text = $"<size=3>{eventStart.ToString("MM/dd/yyyy @ hh:mm tt K")} CST</size>\n" +
            $"<align=center>{memo}</align>";
        background.color = color;


        if (DateTime.Now.Ticks <= eventStart.Ticks)
        {
            var value = eventStart - eventEnd;
            slider.maxValue = 60 * 60;
            slider.value = (float)value.TotalSeconds;
        }
        else slider.value = 0;
    }
}