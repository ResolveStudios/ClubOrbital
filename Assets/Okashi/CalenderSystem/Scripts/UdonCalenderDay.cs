using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using UnityEngine.UI;

public class UdonCalenderDay : UdonSharpBehaviour
{
    [Space]
    public int week;
    public int month;
    public int year;

    public Image background;
    public TextMeshProUGUI dateLable;
    public GameObject dateNumber;
    public UdonCalender calender;
    public UdonCalenderEvent[] events;

    public bool isDisabled()
    {
        if (!dateNumber) dateNumber = transform.GetChild(0).gameObject;
        if (!background) background = (Image)GetComponent(typeof(Image));
        var value = background.color == new Color(0.2f, 0.2f, 0.2f, 1f);
        dateNumber.SetActive(!value);
        return value;
    }

    public Color Getcolor()
    {
        if (!background) background = (Image)GetComponent(typeof(Image));
        return background.color;
    }
    public void SetColor(Color value)
    {
        if (!background) background = (Image)GetComponent(typeof(Image));
        background.color = value;
    }
    public int GetDay()
    {
        if (!dateNumber) dateNumber = transform.GetChild(0).gameObject;
        if (!dateLable) dateLable = (TextMeshProUGUI)dateNumber.GetComponentInChildren(typeof(TextMeshProUGUI));
        return int.Parse(dateLable.text);
    }
    public void SetDay(int value)
    {
        if (!dateNumber) dateNumber = transform.GetChild(0).gameObject;
        if (!dateLable) dateLable = (TextMeshProUGUI)dateNumber.GetComponentInChildren(typeof(TextMeshProUGUI));
        dateLable.text = value.ToString();
    }

    public void Select()
    {
     
    }

    public UdonCalenderEvent GetEvent(int e) => events.Length > 0 ? events[e] : null;
    public int GetEventCount() => events != null ? events.Length : 0;

}