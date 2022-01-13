
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;

public class DubbleInteract : UdonSharpBehaviour
{
    const int m_Event = 0;
    const int m_Toggle = 1;
    [Tooltip("Available modes 0 = Events, 1 = Toggles ")]
    [Range(0, 1)]
        public int mode;
    public float InteractCount = 0;
    [Space]
    [Space]
    private bool useGloble;
    private bool takeOwnership;
    [Space]
    public UdonBehaviour behaviour;
    public string method;
    [Space]
    public GameObject[] objects;
    [Space]
    [Space]
    private float time;
    private float timeSpeed = 4f;
    private float maxTime = 1;

    private void Update()
    {
        if (time > 0)
        {
            time -= timeSpeed * Time.deltaTime;
            time = Mathf.Clamp(time, 0f, maxTime);
        }
        if (time <= 0 && InteractCount > 0)
            InteractCount = 0f;
    }

    public override void Interact()
    {
        if (time <= 0)
            time = maxTime;
        InteractCount++;
        InteractCount = Mathf.Clamp(InteractCount, 0f, 2f);
        if (InteractCount >= 2f)
        {
            switch (mode)
            {
                case m_Event:
                    if (!behaviour || string.IsNullOrEmpty(method)) break;
                    DoInteract(); 
                    break;
                case m_Toggle: 
                    DoToggleInteract(); 
                    break;
            }
        }
    }

    private void DoInteract()
    {
        if (takeOwnership) Networking.SetOwner(Networking.LocalPlayer, behaviour.gameObject);
        if (useGloble) behaviour.SendCustomNetworkEvent(NetworkEventTarget.All, method);
        else if (!useGloble) behaviour.SendCustomEvent(method);
    }

    public void DoToggleInteract()
    {
        foreach (var _object in objects)
        {
            _object.SetActive(!_object.activeSelf);
        }
    }

}
