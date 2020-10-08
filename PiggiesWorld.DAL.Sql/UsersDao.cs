using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;
using PiggiesWorld.DAL.Sql.Abstract;

namespace PiggiesWorld.DAL.Sql
{
    public class UsersDao : EntityDao, IUsersDao
    {
        private readonly IRolesDao _rolesDao;

        public UsersDao(IRolesDao rolesDao)
        {
            _rolesDao = rolesDao ?? throw new ArgumentNullException(nameof(rolesDao));
        }

        public User GetUserById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    "SELECT * from user" +
                    $" WHERE user.id = {id}";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                if (reader.Read())
                {
                    return new User()
                    {
                        ID = (int)reader["id"],
                        LoginName = (string)reader["login"],
                        BirthDay = (DateTime)reader["birthday"]
                    };
                }

                throw new InvalidOperationException($"Cannot find user with ID = {id}");
            }
        }

        public User GetUserByLogin(string login)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    "SELECT * FROM [user]" +
                    $" WHERE [user].login = '{login}'";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                if (reader.Read())
                {
                    return new User()
                    {
                        ID = (int)reader["id"],
                        LoginName = (string)reader["login"],
                        BirthDay = (DateTime)reader["birthday"]
                    };
                }

                return null;
            }
        }

        public User GetUserByLoginWithRoles(string login)
        {
            var user = GetUserByLogin(login);

            if (user is null)
                return null;

            user.Roles = _rolesDao.GetRolesByUserId(user.ID).ToList();

            return user;
        }

        public string GetPasswordHashById(int userId)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    "SELECT user_password.password_hash as pswd FROM user_password" +
                    $" WHERE user_password.id = {userId}";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                return reader.Read() ? (string)reader["pswd"] : null;
            }
        }

        public bool RegisterUser(User user, string passwordHash)
        {
            if (!(GetUserByLogin(user.LoginName) is null))
                return false;

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Register";
                
                command.Parameters.Add(new SqlParameter("login", user.LoginName));
                command.Parameters.Add(new SqlParameter("birthday", user.BirthDay));
                command.Parameters.Add(new SqlParameter("password_hash", passwordHash));

                connection.Open();

                command.ExecuteScalar();

                return true;
            }
        }

        public IEnumerable<User> GetUsersWithRoles(int count)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT TOP {count} [user].*, role.title as role_title, role.id as role_id FROM [user]" +
                    $" LEFT JOIN user_role_association as ura" +
                    $" ON [user].id = ura.user_id" +
                    $" LEFT JOIN role" +
                    $" ON role.id = ura.role_id";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                Dictionary<int, User> userIdToUser = new Dictionary<int, User>();

                while (reader.Read())
                {
                    var user_id = (int)reader["id"];

                    Role role = reader["role_id"] == DBNull.Value ? null : new Role
                    {
                        ID = (int)reader["role_id"],
                        Title = (string)reader["role_title"]
                    };

                    if (userIdToUser.TryGetValue(user_id, out User currentUser))
                    {
                        if (!(role is null))
                            currentUser.Roles.Add(role);
                    }
                    else
                    {
                        User user = new User()
                        {
                            ID = (int)reader["id"],
                            LoginName = (string)reader["login"],
                            BirthDay = (DateTime)reader["birthday"],
                            Roles = new List<Role>()
                        };

                        userIdToUser.Add(user.ID, user);

                        if (!(role is null))
                            user.Roles.Add(role);
                    }
                }

                return userIdToUser.Values;
            }
        }
    }
}
