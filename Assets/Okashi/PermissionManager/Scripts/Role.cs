using UdonSharp;
using UnityEngine;

namespace Okashi.Permissions
{
    public class Role : UdonSharpBehaviour
    {
        public int priority;
        public bool isRoot;
        public ulong permid;
        public string permName;
        public Color permColor;
        public Sprite permIcon;
        public string[] members;

        public string PrettyName()
        {
            return char.ToUpper(permName[0]) + permName.Substring(1);
        }
    }
}