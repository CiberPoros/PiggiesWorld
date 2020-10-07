using System;
using System.Linq;
using System.Web.Security;
using PiggiesWorld.BLL.Contracts;
using Ninject;

namespace PiggiesWorld.PL.Web.Models
{
    public class UsersRoleProvider : RoleProvider
    {
        private readonly IUsersManager _usersManager;

        public UsersRoleProvider()
        {
            _usersManager = DependencesResolver.Resolver.Get<IUsersManager>();
        }

        public override string[] GetRolesForUser(string username) => 
            _usersManager.GetUsersRolesByLogin(username)
                         .Select(role => role.Title)
                         .ToArray();

        public override bool IsUserInRole(string username, string roleName) => 
            _usersManager.GetUsersRolesByLogin(username)
                         .Any(role => role.Title == roleName);

        #region NOT_IMPLEMENTED
        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames) => throw new NotImplementedException();
        public override void CreateRole(string roleName) => throw new NotImplementedException();
        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole) => throw new NotImplementedException();
        public override string[] FindUsersInRole(string roleName, string usernameToMatch) => throw new NotImplementedException();
        public override string[] GetAllRoles() => throw new NotImplementedException();

        public override string[] GetUsersInRole(string roleName) => throw new NotImplementedException();

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames) => throw new NotImplementedException();
        public override bool RoleExists(string roleName) => throw new NotImplementedException();
        #endregion
    }
}