using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IRolesDao
    {
        IEnumerable<Role> GetRolesByUserId(int userID);
        IEnumerable<Role> GetAllRoles();
        void UpdateRolesForUser(IEnumerable<Role> roles, int userID);
    }
}
