using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IPhotoDao : ISubmitEntityDao
    {
        IEnumerable<(Photo photo, string uploaderName)> GetPhotoWithUploaders(int count, bool submitedOnly);
        void DeletePhotoById(int id);
        void AddPhoto(Photo photo, int uploaderID);
    }
}
