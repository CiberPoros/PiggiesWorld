using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.Common.Exceptions;
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

        public bool DeleteUserById(int id)
        {
            try
            {
                return _usersDao.DeleteUserById(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public User GetUserById(int id)
        {
            try
            {
                return _usersDao.GetUserById(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public User GetUserByLogin(string login)
        {
            try
            {
                return _usersDao.GetUserByLogin(login);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public IEnumerable<Role> GetUsersRolesByLogin(string login)
        {
            try
            {
                var user = _usersDao.GetUserByLogin(login);
                return _rolesDao.GetRolesByUserId(user.ID);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public IEnumerable<Role> GetUsersRolesByUserID(int userID)
        {
            try
            {
                return _rolesDao.GetRolesByUserId(userID);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public IEnumerable<User> GetUsersWithRoles(int count)
        {
            try
            {
                return _usersDao.GetUsersWithRoles(count);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }
    }
}
