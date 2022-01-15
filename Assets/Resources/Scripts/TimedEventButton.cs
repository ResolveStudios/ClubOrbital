
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;

public class TimedEventButton : UdonSharpBehaviour
{
    public bool useGlobal;
    public UdonSharpBehaviour behaviour;
    public string function;

    public float DelayTime = 10;
    public float _time;

    public TextMeshPro[] textMeshPros;

    private void Start()
    {
        _time = DelayTime;
    }
    public override void PostLateUpdate()
    {
        if(_time > 0)
        {
            foreach (var item in textMeshPros)
                item.text = $"{_time.ToString("n0")}s";
            _time -= 1 * Time.deltaTime;

            if (_time <= 0)
            {
                foreach (var item in textMeshPros)
                    item.text = "Warp!";
            }
        }
    }




    public override void Interact()
    {
        if (_time > 0) return;
        if (useGlobal)
        {
            Networking.SetOwner(Networking.LocalPlayer, behaviour.gameObject);
            behaviour.SendCustomNetworkEvent(NetworkEventTarget.Owner, function);
        }
        else
        {
            behaviour.SendCustomEvent(function);
        }
    }
}
