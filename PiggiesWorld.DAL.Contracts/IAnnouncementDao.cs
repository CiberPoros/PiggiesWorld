using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IAnnouncementDao : ISubmitEntityDao
    {
        void AddAnnouncement(Announcement announcement, int userID);
        IEnumerable<(Announcement announcement, string uploaderName)> GetAnnouncementsWithUploaders(int count, bool submitedOnly);
        Announcement GetAnnouncementById(int id);
        void DeleteAnnouncementById(int id);
    }
}
