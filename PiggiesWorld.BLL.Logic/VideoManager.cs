using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.Common.Exceptions;
using PiggiesWorld.DAL.Contracts;

namespace PiggiesWorld.BLL.Logic
{
    public class VideoManager : IVideoManager
    {
        private readonly IVideoDao _videoDao;

        public VideoManager(IVideoDao videoDao)
        {
            _videoDao = videoDao ?? throw new ArgumentNullException(nameof(videoDao));
        }

        public void AddVideo(Video video)
        {
            try
            {
                _videoDao.AddVideo(video);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public void DeleteVideoById(int id)
        {
            try
            {
                _videoDao.DeleteVideoById(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public IEnumerable<(Video video, string uploaderName)> GetVideoWithUploaders(int count, bool submitedOnly)
        {
            try
            {
                return _videoDao.GetVideoWithUploaders(count, submitedOnly);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public int GetCount(bool submitedOnly)
        {
            try
            {
                return _videoDao.GetCount(submitedOnly);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public void Submit(int id)
        {
            try
            {
                _videoDao.Submit(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }
    }
}
