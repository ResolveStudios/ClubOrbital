using System.Collections.Generic;

namespace Okashi.Permission.Editors
{
    internal class PermissionUtils
    {
        public static void RoleArrayToList(Role_Serializable[] source, ref List<Role_Serializable> destination)
        {
            foreach (var item in source)
            {
                destination.Add(new Role_Serializable()
                {
                    permID = item.permID,
                    permName = item.permName,
                    permColor = item.permColor,
                    members = item.members,
                });
            }
        }
        public static void RoleListToArray(List<Role_Serializable> source, ref Role_Serializable[] destination)
        {
            destination = new Role_Serializable[source.Count];
            for (int i = 0; i < source.Count; i++)
            {
                destination[i] = new Role_Serializable()
                {
                    permID = source[i].permID,
                    permName = source[i].permName,
                    permColor = source[i].permColor,
                    members = source[i].members,
                };
            }
        }
    }
}