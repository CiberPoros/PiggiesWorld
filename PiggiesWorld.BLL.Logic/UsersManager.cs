using System;
using System.Collections.Generic;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;

namespace PiggiesWorld.BLL.Logic
{
    public class UsersManager : IUsersManager
    {   
        private readonly IUsersDao _usersDao;
        private readonly IRolesDao _rolesDao;

        public UsersManager(IUsersDao usersDao, IRolesDao rolesDao)
        {
            _usersDao = usersDao ?? throw new ArgumentNullException(nameof(usersDao));
            _rolesDao = rolesDao ?? throw new ArgumentNullException(nameof(rolesDao));
        }

        public User GetUserById(int id) => _usersDao.GetUserById(id);
        public User GetUserByLogin(string login) => _usersDao.GetUserByLogin(login);

        public IEnumerable<Role> GetUsersRolesByLogin(string login)
        {
            var user = _usersDao.GetUserByLogin(login);
            return _rolesDao.GetRolesByUserId(user.ID);
        }

        public IEnumerable<Role> GetUsersRolesByUserID(int userID) => _rolesDao.GetRolesByUserId(userID);

        public IEnumerable<User> GetUsersWithRoles(int count) => _usersDao.GetUsersWithRoles(count);
    }
}
