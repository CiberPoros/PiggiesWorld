﻿using System.Collections.Generic;
using System.IO;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IPhotoManager : ISubmitEntityManager, ICountOfElementsManager
    {
        IEnumerable<(Photo photo, string uploaderName)> GetPhotoWithUploaders(int count, bool submitedOnly);
        void AddPhoto(Stream inputStream, string fileName, string description, User uploader);
        void DeletePhotoById(int photoID);
    }
}
