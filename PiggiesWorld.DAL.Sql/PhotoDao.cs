using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;
using PiggiesWorld.DAL.Sql.Abstract;

namespace PiggiesWorld.DAL.Sql
{
    public class PhotoDao : EntityDao, IPhotoDao
    {
        public void AddPhoto(Photo photo, int uploaderID)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Add_Photo";

                command.Parameters.Add(new SqlParameter("path", photo.Path));
                command.Parameters.Add(new SqlParameter("description", photo.Description));
                command.Parameters.Add(new SqlParameter("upload_date", photo.UploadDate));
                command.Parameters.Add(new SqlParameter("user_id", uploaderID));

                connection.Open();

                command.ExecuteScalar();
            }
        }

        public void DeletePhotoById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Delete_Photo";

                command.Parameters.Add(new SqlParameter("photo_id", id));

                connection.Open();

                command.ExecuteScalar();
            }
        }

        public int GetCount(bool submitedOnly)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT COUNT(user_photo.id) FROM user_photo";

                if (submitedOnly)
                    query += " WHERE user_photo.flag_submited = 1";

                var command = new SqlCommand(query, connection);

                connection.Open();
                return (int)command.ExecuteScalar();
            }
        }

        public IEnumerable<(Photo photo, string uploaderName)> GetPhotoWithUploaders(int count, bool submitedOnly)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT TOP {count} user_photo.*, [user].login as user_name" +
                    " FROM user_photo" +
                    " LEFT JOIN [user]" +
                    " ON [user].id = user_photo.user_id";

                if (submitedOnly)
                    query += " WHERE user_photo.flag_submited = 1";

                query += " ORDER BY user_photo.upload_date DESC";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var photo = new Photo
                    {
                        ID = (int)reader["id"],
                        Description = (string)reader["description"],
                        Path = (string)reader["path"],
                        Rating = (float)reader["rating"],
                        VotesCount = (int)reader["votes_count"],                
                        UploadDate = (DateTime)reader["upload_date"],
                        IsSubmited = (bool)reader["flag_submited"]
                    };

                    var uploaderName = (string)reader["user_name"];

                    yield return (photo, uploaderName);
                }
            }
        }

        public void Submit(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Submit_Photo";

                command.Parameters.Add(new SqlParameter("photo_id", id));

                connection.Open();

                command.ExecuteScalar();
            }
        }
    }
}
