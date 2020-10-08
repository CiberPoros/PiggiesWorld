using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.Common.Exceptions;
using PiggiesWorld.DAL.Contracts;

namespace PiggiesWorld.BLL.Logic
{
    public class AnnouncementManager : IAnnouncementManager
    {
        private readonly IImageDao _imageDao;
        private readonly IAnnouncementDao _announcementDao;

        public AnnouncementManager(IImageDao imageDao, IAnnouncementDao announcementDao)
        {
            _imageDao = imageDao ?? throw new ArgumentNullException(nameof(imageDao));
            _announcementDao = announcementDao ?? throw new ArgumentNullException(nameof(announcementDao));
        }

        public void AddAnnouncement(Stream previewPhotoStream, Announcement announcement)
        {
            try
            {
                var previewPhotoName = _imageDao.SaveImage(previewPhotoStream, announcement.PreviewPhotoName);
                announcement.PreviewPhotoName = Path.GetFileName(previewPhotoName);

                _announcementDao.AddAnnouncement(announcement, announcement.UserID);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
            catch (IOException e)
            {
                throw new DALException(DALType.HARD_DRIVE, e.Message, e);
            }
        }

        public void DeleteAnnouncementById(int id)
        {
            try
            {
                _announcementDao.DeleteAnnouncementById(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public Announcement GetAnnouncementById(int id)
        {
            try
            {
                return _announcementDao.GetAnnouncementById(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public IEnumerable<(Announcement announcement, string uploaderName)> GetAnnouncementsWithUploaders(int count, bool submitedOnly)
        {
            try
            {
                return _announcementDao.GetAnnouncementsWithUploaders(count, submitedOnly);
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
                _announcementDao.Submit(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }
    }
}
