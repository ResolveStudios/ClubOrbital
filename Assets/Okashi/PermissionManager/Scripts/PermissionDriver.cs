
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

namespace Okashi.Permissions
{
    public class PermissionDriver : UdonSharpBehaviour
    {
        public PermissionManager pmgr;
        public ulong[] allowedPermissions;
       
        public bool hasPermissions(VRCPlayerApi player)
        {
            if(pmgr != null)
                return pmgr.HasPermissionIDAny(player, allowedPermissions);
            return false;
        }

        public bool ContainsPermission(ulong permid)
        {
            for (int i = 0; i < allowedPermissions.Length; i++)
            {
                if (allowedPermissions[i] == permid) return true;
            }
            return false;
        }
    }
}