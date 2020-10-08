using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IUsersManager
    {
        User GetUserById(int id);

        User GetUserByLogin(string login);

        IEnumerable<User> GetUsersWithRoles(int count);

        IEnumerable<Role> GetUsersRolesByUserID(int userID);

        IEnumerable<Role> GetUsersRolesByLogin(string login);
    }
}
