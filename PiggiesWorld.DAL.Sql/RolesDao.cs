using System.Collections.Generic;
using System.Data.SqlClient;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;
using PiggiesWorld.DAL.Sql.Abstract;

namespace PiggiesWorld.DAL.Sql
{
    public class RolesDao : EntityDao, IRolesDao
    {
        public IEnumerable<Role> GetRolesByUserId(int userID)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    "SELECT role.* FROM role" +
                    " INNER JOIN user_role_association" +
                    $" ON user_role_association.user_id = {userID}";

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
    }
}
