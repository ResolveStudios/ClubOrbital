
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace Okashi.Permissions
{
    public class HeadTraker : UdonSharpBehaviour
    {
        public float yOffset = 5f;
        private void LateUpdate()
        {
            transform.position = Networking.LocalPlayer.GetBonePosition(HumanBodyBones.Head) + (Vector3.up * yOffset);
        }
    }
}