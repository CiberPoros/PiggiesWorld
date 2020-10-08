using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.Common.Exceptions;
using PiggiesWorld.DAL.Contracts;

namespace PiggiesWorld.BLL.Logic
{
    public class RolesManager : IRolesManager
    {
        private readonly IRolesDao _rolesDao;

        public RolesManager(IRolesDao rolesDao)
        {
            _rolesDao = rolesDao ?? throw new ArgumentNullException(nameof(rolesDao));
        }

        public IEnumerable<Role> GetAllRoles()
        {
            try
            {
                return _rolesDao.GetAllRoles();
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public void UpdateRolesForUser(IEnumerable<Role> roles, int userId)
        {
            try
            {
                _rolesDao.UpdateRolesForUser(roles, userId);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }
    }
}
