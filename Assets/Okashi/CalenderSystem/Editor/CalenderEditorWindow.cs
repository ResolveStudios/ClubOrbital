using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Unity.Plastic.Newtonsoft.Json;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

public class CalenderEditorWindow : EditorWindow
{
    private static CalenderEditorWindow _window;
    public static float cellSize = 65;
    private Calender calender = new Calender();
    private string[] daynames = new[]
    {
        "Sunday",
        "Monday",
        "Tusday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"
    };
    private List<CalenderEvent> _events = new List<CalenderEvent>();
    private ReorderableList eventList;
    private bool addneweventwindow;
    private Rect eventwindowrect;
    private CalenderEvent tempevent;
    private Vector2 verticalScroll;
    private float xsize;
    private Vector2 vs;

    [MenuItem("Okashi/Calender Manager")]
    public static void ShowCal()
    {
        _window = GetWindow<CalenderEditorWindow>();
        _window.titleContent = new GUIContent("Calender");
        _window.Show();
        _window.calender.currDate = DateTime.Now;
    }

    public void OnEnable()
    {
        CalenderInitialize();
    }

    public void OnGUI()
    {

        BeginWindows();

        if (xsize != position.size.x)
            ResizeWindow();

        var bfs = GUI.skin.button.fontSize;
        GUI.skin.button.fontSize = 20;
        GUI.skin.button.alignment = TextAnchor.MiddleCenter;
        EditorGUILayout.BeginHorizontal();
        if (GUILayout.Button("<", GUILayout.ExpandWidth(false))) { SwitchMonth(-1); }
        if (GUILayout.Button($"{calender.currDate.ToString("dddd, MMMM dd yyyy")}"))
        {
            CalenderSave();

            calender.currDate = DateTime.Now; CalenderUpdate(calender.currDate.Year, calender.currDate.Month);
            
            CalenderUpdate(calender.currDate.Year, calender.currDate.Month);
            CalenderLoad(calender.currDate.Month, calender.currDate.Year);
            UpdateEventList();
        }
        if (GUILayout.Button(">", GUILayout.ExpandWidth(false))) { SwitchMonth(1); }
        EditorGUILayout.EndHorizontal();
        GUI.skin.button.fontSize = bfs;

        GUILayout.Box("", GUILayout.Height(5), GUILayout.ExpandWidth(true));
        GUILayout.BeginHorizontal();
        for (int i = 0; i < 7; i++)
        {
            GUI.skin.label.fontSize = 10;
            GUI.skin.label.alignment = TextAnchor.MiddleCenter;
            GUILayout.Label(daynames[i], GUILayout.Width(cellSize));
            if (i > 0 && i < 6)
                GUILayout.Space(4);
        }
        GUILayout.EndHorizontal();
        GUILayout.Box("", GUILayout.Height(5), GUILayout.ExpandWidth(true));

        // Vertical Layout
        if (position.width <= 550)
        {
            verticalScroll = EditorGUILayout.BeginScrollView(verticalScroll);
            CalenderDrawUI(UpdateEventList);
            DrawEventList(new Rect(10, 420, 480, 600));
            EditorGUILayout.EndScrollView();
        }
        // Horizontal Layout
        else
        {
            EditorGUILayout.BeginHorizontal();
            CalenderDrawUI(UpdateEventList);
            DrawEventList(new Rect(500, 0 * (100 + 5) + 64, 270, position.height));
            EditorGUILayout.EndHorizontal();
        }



        GUI.color = Color.white;

        if(addneweventwindow)
        {
            eventwindowrect = GUILayout.Window(85474545, eventwindowrect, (id) =>
            {
                GUI.color = Color.red;
                if (GUI.Button(new Rect(5, 5, 20, 20), "X")) 
                {
                    addneweventwindow = false;
                    tempevent = null;
                }
                GUI.color = Color.white;
                EditorGUILayout.Space(5);
                tempevent.memo = EditorGUILayout.TextField(new GUIContent("Memo"), tempevent.memo);
                tempevent.SetColor(EditorGUILayout.ColorField("Event Color", tempevent.GetColor()));

                tempevent.eventStart = Okashi.Utils.EditorGUILayout.DateTimePicker("Start Date/Time", tempevent.eventStart);
                tempevent.eventEnd = Okashi.Utils.EditorGUILayout.DateTimePicker("End Date/Time", tempevent.eventEnd);
                EditorGUILayout.PrefixLabel("Description");
                tempevent.desc = EditorGUILayout.TextArea(tempevent.desc);

                bool canadd = true;
                new Action(() =>
                {
                    for (int w = 0; w < calender.weeks.Length; w++)
                    {
                        for (int d = 0; d < calender.weeks[w].days.Length; d++)
                        {
                            for (int e = 0; e < calender.weeks[w].days[d].events.Length; e++)
                            {
                                var ed = calender.weeks[w].days[d].events[e].eventStart;
                                if (ed.Month == tempevent.eventStart.Month && ed.Day == tempevent.eventStart.Day && ed.Year == tempevent.eventStart.Year)
                                {
                                    if (ed.Hour == tempevent.eventStart.Hour && ed.Minute == tempevent.eventStart.Minute)
                                    {
                                        canadd = false;
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }).Invoke();

                EditorGUI.BeginDisabledGroup(!canadd);
                if(GUILayout.Button("Add Event"))
                {
                    addneweventwindow = false;
                    CalenderAddEvent(tempevent);
                    tempevent = null;
                    CalenderSave();
                }
                EditorGUI.EndDisabledGroup();
                GUI.DragWindow();
            }, "Event Window");
            GUI.BringWindowToFront(85474545);
        }
        EndWindows();
        Repaint();
    }

    private void ResizeWindow()
    {
        if (!_window) ShowCal();
        _window.minSize = new Vector2(500, 486);
        _window.maxSize = new Vector2(775, 635);

        if (position.width > 550 && position.height > 486)
            _window.maxSize = new Vector2(_window.maxSize.x, 486);
        else if (position.width < 550 && position.height < 635)
            _window.minSize = new Vector2(_window.minSize.x, 635);
    }

    private void DrawEventList(Rect rect = default)
    {
        GUI.color = Color.white;
        if(rect != default)
        {
            GUILayout.BeginArea(rect);
            EditorGUILayout.BeginVertical();
            EditorGUI.BeginDisabledGroup(addneweventwindow);
            if (GUILayout.Button($"Add New Event"))
            {
                eventwindowrect = new Rect((position.width / 2) - 250, (position.height / 2) - 100, 500, 200);
                tempevent = new CalenderEvent();
                addneweventwindow = true;
            }
            EditorGUI.EndDisabledGroup();
            GUI.skin.box.fontSize = 10;
            vs = _window.position.width < 550 ? EditorGUILayout.BeginScrollView(vs, GUILayout.Height(120)) : EditorGUILayout.BeginScrollView(vs);
            if (eventList != null)
                eventList.DoLayoutList();
            EditorGUILayout.EndScrollView();
            EditorGUILayout.EndVertical();
            GUILayout.EndArea();
        }
        else
        {
            EditorGUI.BeginDisabledGroup(addneweventwindow);
            if (GUILayout.Button($"Add New Event"))
            {
                eventwindowrect = new Rect((position.width / 2) - 250, (position.height / 2) - 100, 500, 200);
                tempevent = new CalenderEvent();
                addneweventwindow = true;
            }
            EditorGUI.EndDisabledGroup();
            GUI.skin.box.fontSize = 10;
            vs = EditorGUILayout.BeginScrollView(vs, GUILayout.Height(80));
            if (eventList != null)
                eventList.DoLayoutList();
            EditorGUILayout.EndScrollView();
        }
    }

    private void UpdateEventList()
    {
        _events = new List<CalenderEvent>();
        if (calender.selectedweek > 0)
        {
            foreach (var d in calender.weeks[calender.selectedweek].days)
            {
                foreach (var e in d.events)
                {
                    _events.Add(e);
                }
            }
        }
        eventList = new ReorderableList(_events, typeof(CalenderEvent), true, true, false, false);
        eventList.drawElementCallback += OnDrawEventList;
        eventList.drawHeaderCallback += OnDrawHeader;
        eventList.elementHeightCallback += (a) => 70;
    }

    private void OnDrawHeader(Rect rect)
    {
        GUI.Label(rect, new GUIContent(calender.selectedweek < 0 ? "Events" :
            $"Events {calender.weeks[calender.selectedweek].days.First(x => !x.isDisabled()).day} - " +
            $"{calender.weeks[calender.selectedweek].days.Last(x => !x.isDisabled()).day}"));
    }

    private void OnDrawEventList(Rect r, int index, bool isActive, bool isFocused)
    {
        _events = new List<CalenderEvent>();
        for (int d = 0; d < calender.weeks[calender.selectedweek].days.Length; d++)
        {
            for (int e = 0; e < calender.weeks[calender.selectedweek].days[d].events.Length; e++)
            {
                _events.Add(calender.weeks[calender.selectedweek].days[d].events[e]);
            }
        }
        if (_events.Count > 0)
        {
            if (_events.Count <= 0) return;
            if (_events[index] != null || index < _events.Count - 1)
            {
                GUI.Label(new Rect(r.x, r.y, r.width, 40), 
                    $"{(_events[index].eventStart.ToString("MM/dd/yyyy hh:mm tt"))}\n" +
                    $"{(_events[index].eventEnd.ToString("MM/dd/yyyy hh:mm tt"))}");
                GUI.skin.label.fontStyle = FontStyle.Bold;
                GUI.Label(new Rect(r.x, r.y + 30, r.width, 20), _events[index].memo);
                GUI.skin.label.fontStyle = FontStyle.Normal;
                GUI.skin.label.alignment = TextAnchor.UpperLeft;
                GUI.skin.label.wordWrap = true;
                GUI.Label(new Rect(r.x, r.y + 48, r.width, 40), _events[index].desc);
                GUI.skin.label.wordWrap = false;

                GUI.color = Color.red;
                if (GUI.Button(new Rect(r.width + 15, r.y, 7,  r.height), ""))
                {
                    for (int w = 0; w < calender.weeks.Length; w++)
                    {
                        for (int d = 0; d < calender.weeks[w].days.Length; d++)
                        {
                            for (int e = 0; e < calender.weeks[w].days[d].events.Length; e++)
                            {
                                if (_events[index].eventStart.Year == calender.weeks[w].days[d].events[e].eventStart.Year &&
                                    _events[index].eventStart.Month == calender.weeks[w].days[d].events[e].eventStart.Month &&
                                    _events[index].eventStart.Day == calender.weeks[w].days[d].events[e].eventStart.Day &&
                                    _events[index].eventStart.Hour == calender.weeks[w].days[d].events[e].eventStart.Hour &&
                                    _events[index].eventStart.Minute == calender.weeks[w].days[d].events[e].eventStart.Minute)
                                {
                                    if (calender.weeks[w].days[d].events.Length <= 0) return;
                                    calender.weeks[w].days[d].events =
                                        ResizeEventArray(calender.weeks[w].days[d].events, calender.weeks[w].days[d].events.Length - 1, true);
                                    UpdateEventList();
                                    CalenderSave();
                                    return;
                                }
                            }
                        }
                    }
                }
            }
            GUI.color = Color.white;
        }
    }

    private void SwitchMonth(int direction)
    {
        CalenderSave();
        
        if (direction < 0) calender.currDate = calender.currDate.AddMonths(-1);
        else calender.currDate = calender.currDate.AddMonths(1);
        CalenderUpdate(calender.currDate.Year, calender.currDate.Month);
        CalenderLoad(calender.currDate.Month, calender.currDate.Year);
        UpdateEventList();
    }

    

    public void CalenderInitialize()
    {

        if(calender == null) calender =new Calender();
        CalenderUpdate(calender.currDate.Year, calender.currDate.Month);
        CalenderLoad();
        UpdateEventList();
        for (int w = 0; w < calender.weeks.Length; w++)
        {
            for (int d = 0; d < calender.weeks[w].days.Length; d++)
            {
                if (calender.weeks[w].days[d].day == DateTime.Now.Day)
                {
                    calender.selectedweek = w;
                    calender.selectedday = d;
                    return;
                }
            }
        }

    }
    public void CalenderUpdate(int year, int month)
    {
        DateTime temp = new DateTime(year, month, 1);
        calender.currDate = temp;
        int startDay = GetMonthStartDay(year, month);
        int endDay = GetTotalNumberOfDays(year, month);

        var _days = new List<CalenderDay>();
        for (int w = 0; w < 6; w++)
        {
            for (int i = 0; i < 7; i++)
            {
                CalenderDay newDay;
                int currDay = (w * 7) + i;
                if (currDay < startDay || currDay - startDay >= endDay)
                {
                    newDay = new CalenderDay();
                    UpdateDay(ref newDay, currDay - startDay, year, month, w);
                    UpdateColor(ref newDay, Color.grey);
                }
                else
                {
                    newDay = new CalenderDay();
                    UpdateDay(ref newDay, currDay - startDay, year, month, w);
                    UpdateColor(ref newDay, Color.white);
                }
                _days.Add(newDay);
            }
            calender.weeks[w].days = _days.ToArray();
            _days = new List<CalenderDay>();
        }

        ///This just checks if today is on our calendar. If so, we highlight it in green
        _days = new List<CalenderDay>();
        foreach (var _week in calender.weeks)
            foreach (var _day in _week.days)
                _days.Add(_day);
        if (DateTime.Now.Year == year && DateTime.Now.Month == month)
        {
            var day = _days[(DateTime.Now.Day - 1) + startDay];
            UpdateColor(ref day, Color.green);
            _days[(DateTime.Now.Day - 1) + startDay] = day;
        }
    }
    public void CalenderAddEventExtended(DateTime startDate, DateTime endDate, string memeo = default, string description = default, Color color = default)
    {
        var startDay = GetMonthStartDay(startDate.Year, startDate.Month);
        var days = calender.weeks.ToList().Select(x => x.days).ToList();
        for (int w = 0; w < calender.weeks.Length; w++)
        {
            for (int d = 0; d < calender.weeks[w].days.Length; d++)
            {
                if (calender.weeks[w].days[d].day == startDate.Day)
                {
                    UpdateEvent(ref calender.weeks[w].days[d], color == default ? Color.blue : color, startDate, endDate, memeo, description);
                    return;
                }
            }
        }
    }
    public void CalenderAddEvent(CalenderEvent _event) => 
        CalenderAddEventExtended(_event.eventStart, _event.eventEnd, _event.memo, _event.desc, _event.GetColor());
    public void CalenderDrawUI(Action action)
    {
        for (int w = 0; w < calender.weeks.Length; w++)
        {
            EditorGUILayout.BeginHorizontal();
            for (int d = 0; d < calender.weeks[w].days.Length; d++)
            {
                calender.weeks[w].days[d].w = calender.weeks[w].days[d].h = cellSize;

                calender.weeks[w].days[d].x = (d * (calender.weeks[w].days[d].rect().width + 5)) + 10;
                calender.weeks[w].days[d].y = (calender.weeks.ToList().IndexOf(calender.weeks[w]) * (calender.weeks[w].days[d].rect().height + 5)) + 64;
                GUI.color = calender.weeks[w].days[d].color();

                var _w = w;
                var _d = d;
                var _rect = GUI.Window(calender.weeks[w].days[d].GetHashCode(), calender.weeks[w].days[d].rect(), (_index) =>
                {
                    if (calender == null) return;
                    if (calender.weeks == null) return;
                    if (_w > 6) return;
                    if (_d > 7) return;
                    if (calender.weeks[_w].days == null) return;

                    var f = GUI.skin.window.focused;
                    GUI.color = Color.white;
                    var _date = calender.weeks[_w].days[_d].day;
                    var maxdays = GetTotalNumberOfDays(calender.currDate.Year, calender.currDate.Month);

                    if (_date > 0 && _date <= maxdays)
                    {
                        GUI.Box(new Rect(3, 2, 20, 16), calender.weeks[_w].days[_d].day.ToString());
                        if (calender.weeks[_w].days[_d].events.Length > 0)
                        {
                            GUI.color = new Color32(0, 122, 204, 255);
                            GUILayout.BeginArea(new Rect(0, 20, 65, 40), GUI.skin.box);
                            GUI.skin.box.alignment = TextAnchor.UpperCenter;
                            GUI.skin.box.fontSize = 10;
                            GUI.skin.box.wordWrap = true;
                            GUI.color = Color.white;
                            GUILayout.Box($"{calender.weeks[_w].days[_d].events.Length}\nevent(s)",
                            GUILayout.ExpandWidth(true));
                            GUILayout.EndArea();
                        }
                    }

                    if ((Event.current.button == 0) && (Event.current.type == EventType.MouseUp))
                    {
                        if (calender.selectedweek != calender.weeks[_w].days[_d].week && !calender.weeks[_w].days[_d].isDisabled())
                        {
                            calender.selectedweek = _w;
                            calender.selectedday = _d;
                        }
                    }
                }, string.Empty);
                calender.weeks[w].days[d].x = _rect.x; calender.weeks[w].days[d].y = _rect.y;
                calender.weeks[w].days[d].w = _rect.width;  calender.weeks[w].days[d].h = _rect.height;
            }
            EditorGUILayout.EndHorizontal();
            action?.Invoke();
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
    public void UpdateEvent(ref CalenderDay date,  Color color, DateTime startDate, DateTime endDate, string memo = default, string descripton = default)
    {
        var eventIndex = -1;
        for (int i = 0; i < date.events.Length; i++)
        {
            if (date.events[i].eventStart.Year == date.year &&
               date.events[i].eventStart.Month == date.month &&
               date.events[i].eventStart.Day == date.day &&
               date.events[i].eventStart.Hour == startDate.Hour &&
               date.events[i].eventStart.Minute == startDate.Minute)
            { 
                eventIndex = i;
                break;
            }
        }


        if (eventIndex > 0)
        {
            date.events[eventIndex].SetColor(color);
            date.events[eventIndex].memo = memo;
            date.events[eventIndex].eventStart = startDate;
            date.events[eventIndex].eventEnd = endDate;
        }
        else
        {
            date.events = ResizeEventArray(date.events, date.events.Length + 1);
            date.events[date.events.Length - 1] =
            new CalenderEvent(startDate, endDate, memo, descripton, color);
        }
    }
    public void UpdateDay(ref CalenderDay _day, int day, int year, int month, int week)
    {
        _day.month = month;
        _day.day = day + 1;
        _day.year = year;
        _day.week = week > 0 ? week : _day.week;
    }
    public void UpdateColor(ref CalenderDay _day, Color _color)
    {
        _day.r = _color.r;
        _day.g = _color.g;
        _day.b = _color.b; 
        _day.a = _color.a;
    }
    public CalenderEvent[] ResizeEventArray(CalenderEvent[] oldArray, int newSize, bool subtracting  = false)
    {
        int oldSize = oldArray.Length;
        CalenderEvent[] temp = new CalenderEvent[newSize];
        if (temp.Length > 0)
            Array.Copy(oldArray, temp, subtracting ? newSize : oldSize);
        return temp;
    }

    private void CalenderSave()
    {
        var file = Path.Combine(new FileInfo(Application.dataPath).Directory.FullName, $"Calender_{calender.currDate.Month}_{calender.currDate.Year}.cal");
        if (!calender.hasEvents())
        {
            if (File.Exists(file))
                File.Delete(file);
            return;
        }
        
        var json = JsonConvert.SerializeObject(calender, Formatting.Indented);
        File.WriteAllText(file, json);
    }
    private void CalenderLoad(int month = -1, int year = -1)
    {
        if (month < 0) month = DateTime.Now.Month;
        if (year < 0) year = DateTime.Now.Year;

        var file = Path.Combine(new FileInfo(Application.dataPath).Directory.FullName, $"Calender_{month}_{year}.cal");
        if (!File.Exists(file))
        {
            return;
        }
        var json = File.ReadAllText(file);
        calender = JsonConvert.DeserializeObject<Calender>(json);
    }
}