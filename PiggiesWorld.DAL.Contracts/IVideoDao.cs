using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IVideoDao : ISubmitEntityDao
    {
        void AddVideo(Video video);
        IEnumerable<(Video video, string uploaderName)> GetVideoWithUploaders(int count, bool submitedOnly);
        void DeleteVideoById(int id);
    }
}
