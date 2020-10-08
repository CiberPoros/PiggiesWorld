using System;
using System.Collections.Generic;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
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

        public IEnumerable<Role> GetAllRoles() => _rolesDao.GetAllRoles();
        public void UpdateRolesForUser(IEnumerable<Role> roles, int userId) => _rolesDao.UpdateRolesForUser(roles, userId);
    }
}
