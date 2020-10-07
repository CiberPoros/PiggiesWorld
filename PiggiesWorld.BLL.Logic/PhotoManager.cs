using System;
using System.Collections.Generic;
using System.IO;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
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
            var imageName = _imageDao.SaveImage(inputStream, fileName);

            _photoDao.AddPhoto(new Photo { Description = description, Path = Path.GetFileName(imageName), Uploader = uploader, UploadDate = DateTime.Now }, uploader.ID);
        }

        public void DeletePhotoById(int photoID) => _photoDao.DeletePhotoById(photoID);
        public IEnumerable<(Photo photo, string uploaderName)> GetPhotoWithUploaders(int count) => _photoDao.GetPhotoWithUploaders(count);
    }
}
