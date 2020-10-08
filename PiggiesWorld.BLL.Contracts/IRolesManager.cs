using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IRolesManager
    {
        IEnumerable<Role> GetAllRoles();
        void UpdateRolesForUser(IEnumerable<Role> roles, int userId);
    }
}
