using System;
using System.IO;
using UdonSharpEditor;
using Unity.Plastic.Newtonsoft.Json;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(UdonCalender))]
public class UdonCalenderEditor : Editor
{
    public override void OnInspectorGUI()
    {
        Repaint();
        var calender = (UdonCalender)target;
        // Draws the default convert to UdonBehaviour button, program asset field, sync settings, etc.
        if (UdonSharpGUI.DrawDefaultUdonSharpBehaviourHeader(target, false, false)) return;
        if (GUILayout.Button("Load Calender"))

        {
            if (PrefabUtility.IsPartOfPrefabInstance(calender.gameObject))
                PrefabUtility.UnpackPrefabInstance(calender.gameObject, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
            CalenderLoad();
        }
        base.OnInspectorGUI();
    }
    private void CalenderLoad(int month = -1, int year = -1)
    {
        var calender = (UdonCalender)target;
        if (month < 0) month = DateTime.Now.Month;
        if (year < 0) year = DateTime.Now.Year;

        var file = Path.Combine(new FileInfo(Application.dataPath).Directory.FullName, $"Calender_{month}_{year}.cal");
        if (!File.Exists(file))
        {
            calender.selectedweek = 0;
            calender.selectedday = 0;
            calender.currDate = DateTime.Now;

            int startDay = GetMonthStartDay(year, month);

            for (int w = 0; w < 6; w++)
            {
                for (int d = 0; d < 7; d++)
                {

                    int currDay = ((w * 7) + d) + 1;

                    calender.GetWeek(w).GetDay(d).SetDay(currDay - startDay);
                    calender.GetWeek(w).GetDay(d).week = w;
                    calender.GetWeek(w).GetDay(d).month = DateTime.Now.Month;
                    calender.GetWeek(w).GetDay(d).year = DateTime.Now.Year;
                    calender.GetWeek(w).GetDay(d).SetColor(new Color(0.5f, 0.5f, 0.5f, 1f));

                    for (int e = 0; e < calender.GetWeek(w).GetDay(d).GetEventCount(); e++)
                    {
                        var _event = calender.GetWeek(w).GetDay(d).GetEvent(e);
                        if (_event)
                            _event.gameObject.SetActive(false);
                    }
                }
            }

            return;
        }
        else
        {
            var json = File.ReadAllText(file);
            var cal = JsonConvert.DeserializeObject<Calender>(json);

            calender.selectedweek = cal.selectedweek;
            calender.selectedday = cal.selectedday;
            calender.currDate = cal.currDate;

            for (int w = 0; w < cal.weeks.Length; w++)
            {
                for (int d = 0; d < cal.weeks[w].days.Length; d++)
                {
                    calender.GetWeek(w).GetDay(d).SetDay(cal.weeks[w].days[d].day);
                    calender.GetWeek(w).GetDay(d).week = cal.weeks[w].days[d].week;
                    calender.GetWeek(w).GetDay(d).month = cal.weeks[w].days[d].month;
                    calender.GetWeek(w).GetDay(d).year = cal.weeks[w].days[d].year;
                    calender.GetWeek(w).GetDay(d).SetColor(cal.weeks[w].days[d].color());

                    for (int e = 0; e < calender.GetWeek(w).GetDay(d).GetEventCount(); e++)
                    {
                        var _event = calender.GetWeek(w).GetDay(d).GetEvent(e);
                        if (_event)
                            _event.gameObject.SetActive(false);
                    }

                    for (int e = 0; e < cal.weeks[w].days[d].events.Length; e++)
                    {
                        calender.GetWeek(w).GetDay(d).GetEvent(e).gameObject.SetActive(true);
                        calender.GetWeek(w).GetDay(d).GetEvent(e).eventStart = cal.weeks[w].days[d].events[e].eventStart;
                        calender.GetWeek(w).GetDay(d).GetEvent(e).eventEnd = cal.weeks[w].days[d].events[e].eventEnd;
                        calender.GetWeek(w).GetDay(d).GetEvent(e).SetMemo(cal.weeks[w].days[d].events[e].memo);
                        calender.GetWeek(w).GetDay(d).GetEvent(e).SetDesc(cal.weeks[w].days[d].events[e].desc);
                        calender.GetWeek(w).GetDay(d).GetEvent(e).SetColor(cal.weeks[w].days[d].events[e].GetColor());
                    }
                }
            }
        }
    }
    public int GetMonthStartDay(int year, int month)
    {
        DateTime temp = new DateTime(year, month, 1);
        return (int)temp.DayOfWeek;
    }
}