using System.Collections;
using System.Collections.Generic;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

namespace Autarca
{
    public class AnimateDoor : UdonSharpBehaviour
    {
        public string openTrigger = "open";
        public string closeTrigger = "close";

        private Animator _anim;

        private void Start()
        {
            _anim = GetComponent<Animator>();
        }

        public override void OnPlayerTriggerEnter(VRCPlayerApi player)
        {
            _anim.SetTrigger(openTrigger);
        }

        public override void OnPlayerTriggerExit(VRCPlayerApi player)
        {
            _anim.SetTrigger(closeTrigger);
        }
    }
}