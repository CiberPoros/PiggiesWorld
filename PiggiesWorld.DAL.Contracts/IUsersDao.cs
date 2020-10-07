using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IUsersDao
    {
        User GetUserById(int id);
        User GetUserByLogin(string login);
        bool RegisterUser(User user, string passwordHash);
        string GetPasswordHashById(int userId);
    } 
}
