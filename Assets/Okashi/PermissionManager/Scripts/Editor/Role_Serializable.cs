using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using Okashi.Permissions;

namespace Okashi.Permission.Editors
{
    [Serializable]
    public class SRoles
    {
        public List<Role_Serializable> roles = new List<Role_Serializable>();
    }

    [Serializable]
    public class Role_Serializable
    {
        public int priority;
        public bool isRoot;
        public int permID;
        public string permName;
        public string permColor;
        public string permIcon;
        public List<string> members = new List<string>();

        public string PrettyName()
        {
            return char.ToUpper(permName[0]) + permName.Substring(1);
        }

        public static implicit operator Role(Role_Serializable source)
        {
            var role = new Role();
            role.priority = source.priority;
            role.isRoot = source.isRoot;
            role.permid = source.permID;
            role.permName = source.permName;
            ColorUtility.TryParseHtmlString(source.permColor, out Color _color);
            role.permColor = _color;
            role.permIcon = (Sprite)AssetDatabase.LoadAssetAtPath(source.permIcon, typeof(Sprite));
            role.members = source.members.ToArray();

            return role;
        }
    }
}