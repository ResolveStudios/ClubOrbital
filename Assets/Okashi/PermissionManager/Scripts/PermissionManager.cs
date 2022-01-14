using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

namespace Okashi.Permissions
{
    public class PermissionManager : UdonSharpBehaviour
    {
        public Icon icontmplate;
        public Role roletemplate;
        [HideInInspector] public Transform iconcontainer;
        [HideInInspector] public Transform rolecontainer;
        [Space]
        public Role[] roles;
        public Icon[] icons;

        private Icon[] _icons;
        private int _priority;
        private Icon _icon = null;

        public Role GetPlayerPermission(VRCPlayerApi player)
        {
            foreach (var role in roles)
            {
                foreach (var member in role.members)
                {
                    if (member.Split('|')[1] == player.displayName)
                        return role;
                }
            }
            return null;
        }
        public Role[] GetPlayerPermissions(VRCPlayerApi player)
        {
            var roles = new Role[0];
            foreach (var role in roles)
            {
                foreach (var member in role.members)
                {
                    if (member.Split('|')[1] == player.displayName)
                    {
                        roles = ResizeRoleArray(roles, roles.Length + 1);
                        roles[roles.Length - 1] = role;
                    }
                }
            }
            return roles;
        }

        public InstanceIcon FindPlayerIcon(VRCPlayerApi player, string iconName)
        {
            foreach (var item in icons)
            {
                if (string.Equals(item.player.displayName, player.displayName, StringComparison.OrdinalIgnoreCase))
                {
                    foreach (var icon in item.instanceIcons)
                    {
                        if (icon.name == iconName)
                            return icon;
                    }
                }
            }
            return null;
        }

        public Role GetPermissionByID(int permID)
        {
            foreach (var role in roles)
            {
                if (role.permid == permID) return role;
            }
            return null;
        }

        public bool HasPermissionID(VRCPlayerApi player, int permid) => GetPlayerPermission(player).permid <= permid;
        public bool HasPermissionPerm(VRCPlayerApi player, Role perm) => HasPermissionID(player, perm.permid);

        public bool HasPermissionIDAny(VRCPlayerApi player, int[] permids)
        {
            foreach (var id in permids)
                if (GetPlayerPermission(player).permid == id)
                    return true;
            return false;
        }
        public bool HasPermissionAny(VRCPlayerApi player, Role[] permissions)
        {
            foreach (var permID in permissions)
                if (GetPlayerPermission(player) == permID)
                    return true;
            return false;
        }


        public string GetPermissionName(int permID)
        {
            foreach (var role in roles)
            {
                if (role.permid == permID)
                    return char.ToUpper(role.name[0]) + role.name.Substring(1);
            }
            return string.Empty;
        }
        public Color GetPermissionColor(int permID)
        {
            foreach (var role in roles)
            {
                if (role.permid == permID)
                    return role.permColor;
            }
            return Color.white;
        }

        public void DisableRoleIconID(int permID)
        {
            for (int i = 0; i < icons.Length; i++)
            {
                if (icons[i].permid == permID)
                    icons[i].DisableIcon();
            }
        }
        public void DisableRoleIcon(Role perm) => DisableRoleIconID(perm.permid);

        public void EnableRoleIconID(int permID)
        {
            for (int i = 0; i < icons.Length; i++)
            {
                if (icons[i].permid == permID)
                    icons[i].EnableIcon();
            }
        }
        public void EnableRoleIcon(Role perm) => EnableRoleIconID(perm.permid);

        public override void OnPlayerJoined(VRCPlayerApi player)
        {
            Debug.Log($"[PERM]: {player.displayName} has join the lobby");
            Debug.Log($"[PERM]: Finding all icons with {player.displayName} displayname...");
            _icons = new Icon[0];
            _priority = int.MinValue;
            _icon = null;
            foreach (var icon in icons)
            {
                if (icon.player == null && string.Equals(icon.displayname, player.displayName, StringComparison.OrdinalIgnoreCase))
                {
                    _icons = ResizeIconArray(_icons, _icons.Length + 1);
                    _icons[_icons.Length - 1] = icon;
                }
            }
            if (_icons.Length > 0)
            {
                Debug.Log($"[PERM]: Found {_icons.Length} icons.");
                Debug.Log($"[PERM]: Finding the icon with the highest priority...");
                foreach (var icon in _icons)
                {
                    if (icon.priority > _priority)
                    {
                        _priority = icon.priority;
                        _icon = icon;
                    }
                }
                Debug.Log($"[PERM]: Finding the icon with the highest priority...");
                if (_icon)
                {
                    Debug.Log($"[PERM]: Icon found");
#if UNITY_EDITOR && !UDON
                UnityEditor.Selection.activeObject = _icon;
                UnityEditor.SceneView.FrameLastActiveSceneView();
#endif
                    _icon.player = player;
                    if (_icon.icon.sprite != null)
                    {
                        foreach (var _item in _icon.childObjects)
                            _item.SetActive(true);
                        _icon.crown.SetActive(_icon.isRoot);
                    }
                    Debug.Log($"[PERM]: Done, Setting up in-world icon.");
                }
            }
        }
        public override void OnPlayerLeft(VRCPlayerApi player)
        {
            foreach (var item in icons)
            {
                if (string.Equals(item.displayname, player.displayName, StringComparison.OrdinalIgnoreCase))
                {
                    item.player = null;
                    foreach (var _item in item.childObjects)
                    {
                        _item.SetActive(false);
                    }
                    break;
                }
            }
        }

        public Icon[] ResizeIconArray(Icon[] oldArray, int newSize)
        {
            int oldSize = oldArray.Length;
            Icon[] temp = new Icon[newSize];
            Array.Copy(oldArray, temp, oldSize);

            return temp;
        }
        public Role[] ResizeRoleArray(Role[] oldArray, int newSize)
        {
            int oldSize = oldArray.Length;
            Role[] temp = new Role[newSize];
            Array.Copy(oldArray, temp, oldSize);

            return temp;
        }
    }
}