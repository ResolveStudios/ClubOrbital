using System;
using TMPro;
using UdonSharp;
using UnityEngine;

public class UdonCalender : UdonSharpBehaviour
{
    public int selectedweek = -1;
    public int selectedday = -1;
    public DateTime currDate = DateTime.Now;
    public float time;
    public TextMeshProUGUI title;
    public UdonCalenderWeek[] weeks;

    public bool hasEvents()
    {
        int eventcount = 0;
        for (int w = 0; w < GetWeekCount(); w++)
        {
            for (int d = 0; d < weeks[w].GetDayCount(); d++)
            {
                eventcount += weeks[w].GetDay(d).GetEventCount();
            }
        }

        if (eventcount > 0) return true;
        return false;
    }

    public void Start()
    {
        CalenderStartUp();
        UpdateEventList();
        for (int w = 0; w < GetWeekCount(); w++)
        {
            for (int d = 0; d < GetWeek(w).GetDayCount(); d++)
            {
                if (weeks[w].GetDay(d).GetDay() == DateTime.Now.Day)
                {
                    selectedweek = w;
                    selectedday = d;
                    return;
                }
            }
        }
        
    }

    public override void PostLateUpdate()
    {
        if (title)
            title.text = $"{currDate.ToString("dddd, MMMM dd yyyy")}\n" +
                $"<size=15>{currDate.ToString("hh:mm tt K")}</size>";

        currDate = DateTime.Now;
        time += Time.deltaTime;
        if (time >= 5)
        {
            time = 0f;
            CalenderStartUp();
            UpdateEventList();
            for (int w = 0; w < GetWeekCount(); w++)
            {
                for (int d = 0; d < GetWeek(w).GetDayCount(); d++)
                {
                    if (weeks[w].GetDay(d).GetDay() == DateTime.Now.Day)
                    {
                        selectedweek = w;
                        selectedday = d;
                        return;
                    }
                }
            }
        }
    }


    public void CalenderStartUp()
    {
        int startDay = GetMonthStartDay(currDate.Year, currDate.Month);
        int endDay = GetTotalNumberOfDays(currDate.Year, currDate.Month);

        for (int w = 0; w < GetWeekCount(); w++)
        {
            for (int d = 0; d < GetWeek(w).GetDayCount(); d++)
            {
                int currDay = (w * 7) + d;
                if (currDay < startDay || currDay - startDay >= endDay)
                {
                    //weeks[w].GetDay(d).SetDay(currDay - (startDay - 1));
                    weeks[w].GetDay(d).week = w;
                    weeks[w].GetDay(d).month = currDate.Month;
                    weeks[w].GetDay(d).year = currDate.Year;
                    weeks[w].GetDay(d).SetColor(new Color(0.2f, 0.2f, 0.2f, 1f));
                    weeks[w].GetDay(d).isDisabled();
                }
                else
                {
                    //weeks[w].GetDay(d).SetDay(currDay - startDay);
                    weeks[w].GetDay(d).week = w;
                    weeks[w].GetDay(d).month = currDate.Month;
                    weeks[w].GetDay(d).year = currDate.Year;
                    weeks[w].GetDay(d).SetColor(new Color(0.5f, 0.5f, 0.5f, 1f));
                    weeks[w].GetDay(d).isDisabled();
                }
            }
        }

        if (DateTime.Now.Year == currDate.Year && DateTime.Now.Month == currDate.Month)
        {
            for (int w = 0; w < GetWeekCount(); w++)
            {
                for (int d = 0; d < GetWeek(w).GetDayCount(); d++)
                {
                    if (weeks[w].GetDay(d).GetDay() == DateTime.Now.Day)
                        weeks[w].GetDay(d).SetColor(new Color(0.5f, 1, 0.5f, 1f));
                }
            }
        }
    }
    private void UpdateEventList()
    {
        for (int w = 0; w < GetWeekCount(); w++)
        {
            for (int d = 0; d < GetWeek(w).GetDayCount(); d++)
            {
                for (int e = 0; e < GetWeek(w).GetDay(d).GetEventCount(); e++)
                {
                    weeks[w].GetDay(d).GetEvent(e).UpdateMe();
                }
            }
        }
    }

    public int GetMonthStartDay(int year, int month)
    {
        DateTime temp = new DateTime(year, month, 1);
        return (int)temp.DayOfWeek;
    }
    public int GetTotalNumberOfDays(int year, int month)
    {
        return DateTime.DaysInMonth(year, month);
    }
   
    public UdonCalenderWeek GetWeek(int w) => weeks.Length > 0 ? weeks[w] : null;
    public int GetWeekCount() => weeks != null ? weeks.Length : 0;


}
