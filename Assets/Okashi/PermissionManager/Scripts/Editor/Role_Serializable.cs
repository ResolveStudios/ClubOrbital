using Okashi.SQL;
using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Okashi.Permissions.Editors
{
    [Serializable]
    public class Role_Serializable
    {
        public int priority;
        public bool isRoot;
        public ulong permID;
        public string permName;
        public string permColor;
        public string permIcon;

        public string PrettyName()
        {
            return char.ToUpper(permName[0]) + permName.Substring(1);
        }

        public static implicit operator PermissionRole(Role_Serializable source)
        {
            var role = new PermissionRole();
            role.priority = source.priority;
            role.isRoot = source.isRoot;
            role.permid = source.permID;
            role.permName = source.permName;
            ColorUtility.TryParseHtmlString(source.permColor, out Color _color);
            role.permColor = _color;
            return role;
        }
    }
}