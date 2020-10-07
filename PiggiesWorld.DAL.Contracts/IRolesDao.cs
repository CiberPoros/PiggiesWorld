using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IRolesDao
    {
        IEnumerable<Role> GetRolesByUserId(int userID);
    }
}
