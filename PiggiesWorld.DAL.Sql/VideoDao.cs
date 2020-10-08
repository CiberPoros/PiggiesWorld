using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;
using PiggiesWorld.DAL.Sql.Abstract;

namespace PiggiesWorld.DAL.Sql
{
    public class VideoDao : EntityDao, IVideoDao
    {
        public void AddVideo(Video video)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Add_Video";

                command.Parameters.Add(new SqlParameter("url", video.Url));
                command.Parameters.Add(new SqlParameter("user_id", video.UserID));
                command.Parameters.Add(new SqlParameter("description", video.Description));
                command.Parameters.Add(new SqlParameter("upload_date", video.UploadDate));

                connection.Open();

                command.ExecuteScalar();
            }
        }

        public void DeleteVideoById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Delete_Video";

                command.Parameters.Add(new SqlParameter("video_id", id));

                connection.Open();

                command.ExecuteScalar();
            }
        }

        public int GetCount(bool submitedOnly)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT COUNT(user_video.id) FROM user_video";

                if (submitedOnly)
                    query += " WHERE user_video.flag_submited = 1";

                var command = new SqlCommand(query, connection);

                connection.Open();
                return (int)command.ExecuteScalar();
            }
        }

        public IEnumerable<(Video video, string uploaderName)> GetVideoWithUploaders(int count, bool submitedOnly)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT TOP {count} user_video.*, [user].login as user_name" +
                    " FROM user_video" +
                    " LEFT JOIN [user]" +
                    " ON [user].id = user_video.user_id";

                if (submitedOnly)
                    query += " WHERE user_video.flag_submited = 1";

                query += " ORDER BY user_video.upload_date DESC";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var video = new Video
                    {
                        ID = (int)reader["id"],
                        Url = (string)reader["url"],
                        Description = (string)reader["description"],
                        UploadDate = (DateTime)reader["upload_date"],
                        IsSubmited = (bool)reader["flag_submited"]
                    };

                    var uploaderName = (string)reader["user_name"];

                    yield return (video, uploaderName);
                }
            }
        }

        public void Submit(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Submit_Video";

                command.Parameters.Add(new SqlParameter("video_id", id));

                connection.Open();

                command.ExecuteScalar();
            }
        }
    }
}
