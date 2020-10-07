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

        public IEnumerable<(Video video, string uploaderName)> GetVideoWithUploaders(int count)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT TOP {count} user_video.*, [user].login as user_name" +
                    " FROM user_video" +
                    " LEFT JOIN [user]" +
                    " ON [user].id = user_video.user_id";

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
                        UploadDate = (DateTime)reader["upload_date"]
                    };

                    var uploaderName = (string)reader["user_name"];

                    yield return (video, uploaderName);
                }
            }
        }
    }
}
