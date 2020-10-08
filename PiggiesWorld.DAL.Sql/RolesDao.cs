using System.Collections.Generic;
using System.Data.SqlClient;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;
using PiggiesWorld.DAL.Sql.Abstract;

namespace PiggiesWorld.DAL.Sql
{
    public class RolesDao : EntityDao, IRolesDao
    {
        public IEnumerable<Role> GetAllRoles()
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    "SELECT * FROM role";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    yield return new Role()
                    {
                        ID = (int)reader["id"],
                        Title = (string)reader["title"]
                    };
                }
            }
        }

        public IEnumerable<Role> GetRolesByUserId(int userID)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {

                var query = "SELECT * FROM [role]" +
                    $" INNER JOIN (SELECT * FROM user_role_association WHERE user_role_association.user_id = {userID}) AS ura" +
                    $" ON [role].id = ura.role_id";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    yield return new Role()
                    {
                        ID = (int)reader["id"],
                        Title = (string)reader["title"]
                    };
                }
            }
        }

        public void UpdateRolesForUser(IEnumerable<Role> roles, int userID)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Delete_User_Role_Association_By_User_ID";

                command.Parameters.Add(new SqlParameter("user_id", userID));

                connection.Open();

                command.ExecuteScalar();

                foreach (var role in roles)
                {
                    command = connection.CreateCommand();
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = "dbo.gsp_Add_User_Role_Association";

                    command.Parameters.Add(new SqlParameter("user_id", userID));
                    command.Parameters.Add(new SqlParameter("role_id", role.ID));

                    command.ExecuteScalar();
                }
            }
        }
    }
}
