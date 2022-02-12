using System;
using System.Threading.Tasks;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

namespace Okashi.Permissions
{
    public class PermissionManager : UdonSharpBehaviour
    {
        public PermissionMember icontmplate;
        public PermissionRole roletemplate;
        [HideInInspector] public Transform iconcontainer;
        [HideInInspector] public Transform rolecontainer;
        public PermissionDriver staffDriver;
        [Space]
        public PermissionRole[] roles;
        public PermissionMember[] members;


        public ulong EveryoneRole { get { var role = roles[roles.Length -1]; Debug.Log($"EveryoneRole: {role.PrettyName()}"); return role.permid; } }

        public int OnlineMembers;
        public int TotalMembers;

        public PermissionRole GetPlayerPermission(VRCPlayerApi player)
        {
            foreach (var role in roles)
            {
                foreach (var member in members)
                {
                    if (member.displayName == player.displayName)
                        return role;
                }
            }
            return null;
        }

        public InstanceIcon FindPlayerIcon(VRCPlayerApi player, string iconName)
        {
            foreach (var item in members)
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

        public PermissionRole GetPermissionByID(ulong permID)
        {
            foreach (var role in roles)
            {
                if (role.permid == permID) return role;
            }
            return null;
        }

        public bool HasPermissionID(VRCPlayerApi player, ulong permid) => GetPlayerPermission(player).permid <= permid;
        public bool HasPermissionPerm(VRCPlayerApi player, PermissionRole perm) => HasPermissionID(player, perm.permid);

        public bool HasPermissionIDAny(VRCPlayerApi player, ulong[] permids)
        {
            foreach (var permID in permids)
            {
                var role = GetPlayerPermission(player);
                if ((role != null && role.permid == permID) || permID == EveryoneRole)
                    return true;
            }
            return false;
        }
        public bool HasPermissionAny(VRCPlayerApi player, PermissionRole[] permissions)
        {
            foreach (var permRole in permissions)
            {
                var role = GetPlayerPermission(player);
                if ((role != null && role == permRole) || permRole.permid == EveryoneRole) return true;
            }
            return false;
        }

        public string GetPermissionName(ulong permID)
        {
            foreach (var role in roles)
            {
                if (role.permid == permID)
                    return char.ToUpper(role.name[0]) + role.name.Substring(1);
            }
            return string.Empty;
        }
        public Color GetPermissionColor(ulong permID)
        {
            foreach (var role in roles)
            {
                if (role.permid == permID)
                    return role.permColor;
            }
            return Color.white;
        }

        public void DisableRoleIconID(ulong permID)
        {
            for (int i = 0; i < members.Length; i++)
            {
                if (members[i].permid == permID)
                    members[i].DisableIcon();
            }
        }
        public void DisableRoleIcon(PermissionRole perm) => DisableRoleIconID(perm.permid);

        public void EnableRoleIconID(ulong permID)
        {
            for (int i = 0; i < members.Length; i++)
            {
                if (members[i].permid == permID)
                    members[i].EnableIcon();
            }
        }
        public void EnableRoleIcon(PermissionRole perm) => EnableRoleIconID(perm.permid);

        public override void OnPlayerJoined(VRCPlayerApi player)
        {
            Debug.Log($"[PERM]: {player.displayName} has join the lobby");
            Debug.Log($"[PERM]: Finding and enabling  {player.displayName}'s icon...");

            foreach (var member in members)
            {
                if (member.player == null && string.Equals(member.displayName, player.displayName, StringComparison.OrdinalIgnoreCase))
                {
                    Debug.Log($"[PERM]: Found {player.displayName}'s icon.");
                    if (staffDriver && staffDriver.allowedPermissions.Length > 0 && !staffDriver.ContainsPermission(member.permid)) return;
                    Debug.Log($"[PERM]: Icon found");
                    member.player = player;
                    member.EnableIcon();
                    Debug.Log($"[PERM]: Done, Setting up in-world icon.");
                    return;
                }
            }
           
        }
        public override void OnPlayerLeft(VRCPlayerApi player)
        {
            foreach (var member in members)
            {
                if (string.Equals(member.displayName, player.displayName, StringComparison.OrdinalIgnoreCase))
                {
                    member.player = null;
                    member.DisableIcon();
                    break;
                }
            }
        }

        public PermissionMember[] ResizeIconArray(PermissionMember[] oldArray, int newSize)
        {
            int oldSize = oldArray.Length;
            PermissionMember[] temp = new PermissionMember[newSize];
            Array.Copy(oldArray, temp, oldSize);

            return temp;
        }
    }
}