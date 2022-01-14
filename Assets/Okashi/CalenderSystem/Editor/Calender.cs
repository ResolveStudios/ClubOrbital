using System;

[Serializable]
public class Calender
{
    public int selectedweek = -1;
    public int selectedday = -1;
    public DateTime currDate = DateTime.Now;
    public CalenderWeek[] weeks = new CalenderWeek[]
    {
        new CalenderWeek(),
        new CalenderWeek(),
        new CalenderWeek(),
        new CalenderWeek(),
        new CalenderWeek(),
        new CalenderWeek(),
    };
    public bool hasEvents()
    {
        int eventcount = 0;
        for (int w = 0; w < weeks.Length; w++)
        {
            for (int d = 0; d < weeks[w].days.Length; d++)
            {
                eventcount += weeks[w].days[d].events.Length;
            }
        }

        if (eventcount > 0) return true;
        return false;
    }

}
