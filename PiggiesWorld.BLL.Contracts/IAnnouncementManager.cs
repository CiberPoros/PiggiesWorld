using System.Collections.Generic;
using System.IO;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IAnnouncementManager : ISubmitEntityManager
    {
        IEnumerable<(Announcement announcement, string uploaderName)> GetAnnouncementsWithUploaders(int count, bool submitedOnly);
        void AddAnnouncement(Stream previewPhotoStream, Announcement announcement);
        void DeleteAnnouncementById(int photoID);
        Announcement GetAnnouncementById(int id);
    }
}
