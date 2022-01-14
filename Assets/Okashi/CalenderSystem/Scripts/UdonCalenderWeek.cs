using UdonSharp;
using UnityEngine;

public class UdonCalenderWeek : UdonSharpBehaviour
{
    public UdonCalenderDay[] days;
    public UdonCalenderDay GetDay(int d) => days.Length > 0 ?  days[d] : null;
    public int GetDayCount() => days != null ? days.Length : 0;
}