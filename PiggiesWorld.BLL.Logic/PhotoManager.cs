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
    public class PhotoManager : IPhotoManager
    {
        private readonly IPhotoDao _photoDao;
        private readonly IImageDao _imageDao;

        public PhotoManager(IPhotoDao photoDao, IImageDao imageDao)
        {
            _photoDao = photoDao ?? throw new ArgumentNullException(nameof(photoDao));
            _imageDao = imageDao ?? throw new ArgumentNullException(nameof(imageDao));
        }

        public void AddPhoto(Stream inputStream, string fileName, string description, User uploader)
        {
            try
            {
                var imageName = _imageDao.SaveImage(inputStream, fileName);
                _photoDao.AddPhoto(new Photo { Description = description, Path = Path.GetFileName(imageName), 
                    Uploader = uploader, UploadDate = DateTime.Now }, uploader.ID);
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

        public void DeletePhotoById(int photoID)
        {
            try
            {
                _photoDao.DeletePhotoById(photoID);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public IEnumerable<(Photo photo, string uploaderName)> GetPhotoWithUploaders(int count, bool submitedOnly)
        {
            try
            {
                return _photoDao.GetPhotoWithUploaders(count, submitedOnly);
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
                _photoDao.Submit(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }
    }
}
