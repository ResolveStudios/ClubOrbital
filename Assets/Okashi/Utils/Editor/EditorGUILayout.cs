using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Okashi.Utils
{
    using System.Globalization;
    using UnityEditor;
    using UnityEngine;
    using EditorLayout = UnityEditor.EditorGUILayout;
    public static class EditorGUILayout
    {
        private static int selectedmonth = DateTime.Now.Month;
        private static int selectedday = DateTime.Now.Day;
        private static int selectedyear = DateTime.Now.Year;
        private static int selectedhour = DateTime.Now.Hour;
        private static int selectedminutes = DateTime.Now.Minute;
        private static int selectedTime = DateTime.Now.Hour < 12 ? 0 : 1;
        private static List<int> dayNumbers = new List<int>();
        private static List<int> monthNumbers = new List<int>();
        private static List<int> yearNumbers = new List<int>();
        private static string[] tt = new string[] { "AM", "PM" };
        private static int _year = DateTime.Now.Year;
        private static int _month = DateTime.Now.Month;
        
        private static List<int> hourNumbers = new List<int>();
        private static List<int> minutesNumber = new List<int>();

        public static DateTime DateTimePicker(string lable, DateTime dateTime) => DateTimePicker(new GUIContent(lable), dateTime);
        public static DateTime DateTimePicker(GUIContent lable, DateTime dateTime)
        {
            selectedday = dateTime.Day;
            selectedmonth = dateTime.Month;
            selectedyear = dateTime.Year;
            selectedhour = ConvertTo12(dateTime.Hour);
            selectedminutes = dateTime.Minute;

            if (monthNumbers.Count <= 0)
            {
                for (int i = 1; i < 13; i++)
                    monthNumbers.Add(i);
            }
            if(yearNumbers.Count <= 0)
            {
                for (int i = DateTime.Now.Year; i < DateTime.Now.Year + 12; i++)
                    yearNumbers.Add(i);
            }
            if(dayNumbers.Count <= 0)
            {
                for (int i = 1; i < DateTime.DaysInMonth(selectedyear, selectedmonth) + 1; i++)
                    dayNumbers.Add(i);
            }
            if(selectedyear != _year || selectedmonth != _month)
            {
                dayNumbers.Clear();
                for (int i = 1; i < DateTime.DaysInMonth(selectedyear, selectedmonth) + 1; i++)
                    dayNumbers.Add(i);
                _year = selectedyear;
                _month = selectedmonth;
            }

            

            if (hourNumbers.Count <= 0)
            {
                for (int i = 1; i < 13; i++)
                    hourNumbers.Add(i);
            }
            if (minutesNumber.Count <= 0)
            {
                for (int i = 0; i < 60; i++)
                    minutesNumber.Add(i);
            }


            GUILayout.Box(lable, GUILayout.ExpandWidth(true));
            EditorLayout.BeginHorizontal();
            EditorLayout.BeginVertical();
            EditorLayout.BeginHorizontal();
            EditorLayout.LabelField("Date", GUILayout.Width(30));
            selectedmonth = EditorLayout.IntPopup(selectedmonth, monthNumbers.Select(x => GetMonthName(x)).ToArray(), monthNumbers.ToArray());
            selectedday = EditorLayout.IntPopup(selectedday, dayNumbers.ToList().Select(x => x.ToString()).ToArray(), dayNumbers.ToArray());
            selectedyear = EditorLayout.IntPopup(selectedyear, yearNumbers.Select(x => x.ToString()).ToArray(), yearNumbers.ToArray());
            EditorLayout.EndHorizontal();
            EditorLayout.BeginHorizontal();
            EditorLayout.LabelField("Time", GUILayout.Width(30));
            selectedhour = EditorLayout.IntPopup(selectedhour, hourNumbers.ToList().Select(x => x.ToString()).ToArray(), hourNumbers.ToArray());
            selectedminutes = EditorLayout.IntPopup(selectedminutes, minutesNumber.ToList().Select(x => x.ToString()).ToArray(), minutesNumber.ToArray());
            selectedTime = EditorLayout.Popup(selectedTime, tt, GUILayout.Width(50));
            EditorLayout.EndHorizontal();
            EditorLayout.EndVertical();
            if (GUILayout.Button("Now", GUILayout.ExpandWidth(false)))
            {
                selectedmonth = DateTime.Now.Month;
                selectedday = DateTime.Now.Day;
                selectedyear = DateTime.Now.Year;
                selectedhour = DateTime.Now.Hour;
                selectedminutes = DateTime.Now.Minute;
            }
            EditorLayout.EndHorizontal();

            var time = new DateTime(selectedyear, selectedmonth, selectedday, ConvertTo24(selectedhour, selectedTime), selectedminutes, 0);
            EditorLayout.LabelField(time.ToString());
            return time;
        }


        private static int ConvertTo12(int hour)
        {
            var dummy = new DateTime();
            dummy =  new DateTime(dummy.Year, dummy.Month, dummy.Year, hour, 0, 0);
            return int.Parse(dummy.ToString("hh"));
        }
        private static int ConvertTo24(int hour, int state)
        {
            var value = $"{(hour < 10 ? "0" + hour : hour.ToString())}:00 {(state == 0 ? "AM" : "PM")}";
            var dummy = DateTime.Parse(value);
            return int.Parse(dummy.ToString("HH"));
        }

        private static string GetMonthName(int value)
        {
            if (value == 1) return "Jan";
            if (value == 2) return "Feb";
            if (value == 3) return "Mar";
            if (value == 4) return "Apr";
            if (value == 5) return "May";
            if (value == 6) return "Jun";
            if (value == 7) return "Jul";
            if (value == 8) return "Aug";
            if (value == 9) return "Sep";
            if (value == 10) return "Oct";
            if (value == 11) return "Nov";
            if (value == 12) return "Dec";
            return value.ToString();
        }
    }
}
