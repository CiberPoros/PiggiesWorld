using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IUsersManager
    {
        User GetUserById(int id);

        User GetUserByLogin(string login);

        IEnumerable<Role> GetUsersRolesByUserID(int userID);

        IEnumerable<Role> GetUsersRolesByLogin(string login);
    }
}
