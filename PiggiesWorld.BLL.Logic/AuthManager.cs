using System;
using System.Security.Cryptography;
using System.Text;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;

namespace PiggiesWorld.BLL.Logic
{
    public class AuthManager : IAuthManager
    {
        private readonly IUsersDao _usersDao;

        public AuthManager(IUsersDao usersDao)
        {
            _usersDao = usersDao ?? throw new ArgumentNullException(nameof(usersDao));
        }

        public bool IsCorrectPassword(string login, string password)
        {
            var user = _usersDao.GetUserByLogin(login);
            if (user is null)
                return false;

            string pswdHash = _usersDao.GetPasswordHashById(user.ID);

            return ComputeHash(password) == pswdHash;
        }

        public bool RegisterUser(User user, string password) => _usersDao.RegisterUser(user, ComputeHash(password));

        private static string ComputeHash(string password)
        {
            using (var sha256 = new SHA256Managed())
            {
                return BitConverter.ToString(sha256.ComputeHash(Encoding.UTF8.GetBytes(password))).Replace("-", "");
            } 
        }
    }
}
