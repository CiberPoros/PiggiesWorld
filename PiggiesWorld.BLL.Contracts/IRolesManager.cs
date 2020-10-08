using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IRolesManager
    {
        IEnumerable<Role> GetAllRoles();
        void UpdateRolesForUser(IEnumerable<Role> roles, int userId);
    }
}
