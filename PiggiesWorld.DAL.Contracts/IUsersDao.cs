using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IUsersDao
    {
        User GetUserById(int id);
        User GetUserByLogin(string login);
        bool DeleteUserById(int id);
        IEnumerable<User> GetUsersWithRoles(int count);
        bool RegisterUser(User user, string passwordHash);
        string GetPasswordHashById(int userId);
    } 
}
