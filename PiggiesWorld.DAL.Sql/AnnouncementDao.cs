using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;
using PiggiesWorld.DAL.Sql.Abstract;

namespace PiggiesWorld.DAL.Sql
{
    public class AnnouncementDao : EntityDao, IAnnouncementDao
    {
        public void AddAnnouncement(Announcement announcement, int uploaderID)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Add_Announcement";

                command.Parameters.Add(new SqlParameter("title", announcement.Title));
                command.Parameters.Add(new SqlParameter("photo", announcement.PreviewPhotoName));
                command.Parameters.Add(new SqlParameter("description", announcement.Description));
                command.Parameters.Add(new SqlParameter("phone", announcement.PhoneNumber));
                command.Parameters.Add(new SqlParameter("upload_date", announcement.UploadDate));
                command.Parameters.Add(new SqlParameter("user_id", uploaderID));

                connection.Open();

                command.ExecuteScalar();
            }
        }

        public void DeleteAnnouncementById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Delete_Announcement";

                command.Parameters.Add(new SqlParameter("announcement_id", id));

                connection.Open();

                command.ExecuteScalar();
            }
        }

        public Announcement GetAnnouncementById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT * FROM user_announcement" +
                    $" WHERE user_announcement.id = {id}";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                if (reader.Read())
                {
                    return new Announcement()
                    {
                        ID = (int)reader["id"],
                        Title = (string)reader["title"],
                        PreviewPhotoName = (string)reader["photo"],
                        PhoneNumber = (string)reader["phone"],
                        Description = (string)reader["description"],
                        UploadDate = (DateTime)reader["upload_date"],
                        UserID = (int)reader["user_id"],
                        IsSubmited = (bool)reader["flag_submited"]
                    };
                }

                return null;
            }
        }

        public IEnumerable<(Announcement announcement, string uploaderName)> GetAnnouncementsWithUploaders(int count, bool submitedOnly)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT TOP {count} user_announcement.*, [user].login as user_name" +
                    " FROM user_announcement" +
                    " LEFT JOIN [user]" +
                    " ON [user].id = user_announcement.user_id";

                if (submitedOnly)
                    query += " WHERE user_announcement.flag_submited = 1";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var announcement = new Announcement
                    {
                        ID = (int)reader["id"],
                        Title = (string)reader["title"],
                        PreviewPhotoName = (string)reader["photo"],
                        Description = (string)reader["description"],
                        PhoneNumber = (string)reader["phone"],
                        UploadDate = (DateTime)reader["upload_date"],
                        IsSubmited = (bool)reader["flag_submited"]
                    };

                    var uploaderName = (string)reader["user_name"];

                    yield return (announcement, uploaderName);
                }
            }
        }

        public int GetCount(bool submitedOnly)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT COUNT(user_announcement.id) FROM user_announcement";

                if (submitedOnly)
                    query += " WHERE user_announcement.flag_submited = 1";

                var command = new SqlCommand(query, connection);

                connection.Open();
                return (int)command.ExecuteScalar();
            }
        }

        public void Submit(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Submit_Announcement";

                command.Parameters.Add(new SqlParameter("announcement_id", id));

                connection.Open();

                command.ExecuteScalar();
            }
        }
    }
}
