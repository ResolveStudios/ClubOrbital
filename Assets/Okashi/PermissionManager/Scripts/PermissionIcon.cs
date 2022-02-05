
using System;
using UdonSharp;
using UnityEngine;
using UnityEngine.Animations;
using VRC.SDKBase;
using VRC.Udon;
namespace Okashi.Permissions
{
    public class PermissionIcon : UdonSharpBehaviour
    {
        public int priority;
        public SpriteRenderer icon;
        public string discordname;
        public string displayname;
        public bool isRoot;
        [HideInInspector] public VRCPlayerApi player;
        public bool isAssigned;
        private bool _isAssigned;
        public GameObject[] childObjects;
        public Color iconColor;
        public LookAtConstraint lac;
        public GameObject crown;

        private string ColorName = "_EmissionColor1";
        public ulong permid;

        public InstanceIcon[] instanceIcons;


        private void Start()
        {
            icon.material.SetColor(ColorName, iconColor);
            if (player != null)
                lac.weight = player.displayName == displayname ? 0 : 1;
        }

        public override void PostLateUpdate()
        {
            if (player != null)
            {
                transform.position = player.GetBonePosition(HumanBodyBones.Head);
                if (player == Networking.LocalPlayer)
                    transform.rotation = Quaternion.Euler(0, player.GetBoneRotation(HumanBodyBones.Head).eulerAngles.y, 0);
                else
                {
                    var larot = Quaternion.LookRotation(Networking.LocalPlayer.GetPosition(), Vector3.up);
                    transform.rotation = Quaternion.Euler(0, larot.eulerAngles.y, 0);
                }
            }
        }

        public void DisableIcon()
        {
            foreach (var item in childObjects)
                item.SetActive(false);
        }
        public void EnableIcon()
        {
            foreach (var item in childObjects)
                item.SetActive(true);
            crown.SetActive(isRoot);
        }
    }
}