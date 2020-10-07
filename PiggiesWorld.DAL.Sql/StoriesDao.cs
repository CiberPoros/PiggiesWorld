using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;
using PiggiesWorld.DAL.Sql.Abstract;

namespace PiggiesWorld.DAL.Sql
{
    public class StoriesDao : EntityDao, IStoriesDao
    {
        public void AddStory(Story story)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Add_Story";

                command.Parameters.Add(new SqlParameter("title", story.Title));
                command.Parameters.Add(new SqlParameter("preview_photo", story.PreviewPhotoName));
                command.Parameters.Add(new SqlParameter("description", story.Description));
                command.Parameters.Add(new SqlParameter("body", story.Body));
                command.Parameters.Add(new SqlParameter("user_id", story.UserID));

                AddStringParameter("header1", story.Header1);
                AddStringParameter("photo1", story.PhotoName1);
                AddStringParameter("inf1", story.Information1);
                AddStringParameter("header2", story.Header2);
                AddStringParameter("photo2", story.PhotoName2);
                AddStringParameter("inf2", story.Information2);

                void AddStringParameter(string name, string parameter)
                {
                    if (!(parameter is null))
                        command.Parameters.Add(new SqlParameter(name, parameter));
                };

                connection.Open();

                command.ExecuteScalar();
            }
        }

        public void DeleteStoryById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Delete_Story";

                command.Parameters.Add(new SqlParameter("story_id", id));

                connection.Open();

                command.ExecuteScalar();
            }
        }

        public IEnumerable<(Story story, string uploaderName)> GetStoriesWithUploaders(int count, bool submitedOnly)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT TOP {count} user_story.*, [user].login as user_name" +
                    " FROM user_story" +
                    " LEFT JOIN [user]" +
                    " ON [user].id = user_story.user_id";

                if (submitedOnly)
                    query += " WHERE user_story.flag_submited = 1";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var story = new Story
                    {
                        ID = (int)reader["id"],
                        Title = (string)reader["title"],
                        PreviewPhotoName = (string)reader["preview_photo"],
                        Description = (string)reader["description"],
                        Body = (string)reader["body"],
                        UserID = (int)reader["user_id"],
                        Header1 = reader["header1"] == DBNull.Value ? null : (string)reader["header1"],
                        PhotoName1 = reader["photo1"] == DBNull.Value ? null : (string)reader["photo1"],
                        Information1 = reader["inf1"] == DBNull.Value ? null : (string)reader["inf1"],
                        Header2 = reader["header2"] == DBNull.Value ? null : (string)reader["header2"],
                        PhotoName2 = reader["photo2"] == DBNull.Value ? null : (string)reader["photo2"],
                        Information2 = reader["inf2"] == DBNull.Value ? null : (string)reader["inf2"],
                        IsSubmited = (bool)reader["flag_submited"]
                    };

                    var uploaderName = (string)reader["user_name"];

                    yield return (story, uploaderName);
                }
            }
        }

        public Story GetStoryById(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var query =
                    $"SELECT * FROM user_story" +
                    $" WHERE user_story.id = {id}";

                var command = new SqlCommand(query, connection);

                connection.Open();
                var reader = command.ExecuteReader();

                if (reader.Read())
                {
                    return new Story()
                    {
                        ID = (int)reader["id"],
                        Title = (string)reader["title"],
                        PreviewPhotoName = (string)reader["preview_photo"],
                        Description = (string)reader["description"],
                        Body = (string)reader["body"],
                        UserID = (int)reader["user_id"],
                        Header1 = reader["header1"] == DBNull.Value ? null : (string)reader["header1"],
                        PhotoName1 = reader["photo1"] == DBNull.Value ? null : (string)reader["photo1"],
                        Information1 = reader["inf1"] == DBNull.Value ? null : (string)reader["inf1"],
                        Header2 = reader["header2"] == DBNull.Value ? null : (string)reader["header2"],
                        PhotoName2 = reader["photo2"] == DBNull.Value ? null : (string)reader["photo2"],
                        Information2 = reader["inf2"] == DBNull.Value ? null : (string)reader["inf2"],
                        IsSubmited = (bool)reader["flag_submited"]
                    };
                }

                return null;
            }
        }

        public void Submit(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "dbo.gsp_Submit_Story";

                command.Parameters.Add(new SqlParameter("story_id", id));

                connection.Open();

                command.ExecuteScalar();
            }
        }
    }
}
