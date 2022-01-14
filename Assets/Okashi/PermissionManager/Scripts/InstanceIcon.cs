
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace Okashi.Permissions
{
    public class InstanceIcon : UdonSharpBehaviour
    {
        public GameObject Background;
        public GameObject Icon;
        public GameObject Not;

        [UdonSynced] public int index;

        public override void PostLateUpdate()
        {
            Background.SetActive(index > 0);
            Icon.SetActive(index > 0);
            Not.SetActive(index == 2);
        }
    }
}