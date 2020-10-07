using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IPhotoManager
    {
        IEnumerable<(Photo photo, string uploaderName)> GetPhotoWithUploaders(int count);
        void AddPhoto(Stream inputStream, string fileName, string description, User uploader);
        void DeletePhotoById(int photoID);
    }
}
