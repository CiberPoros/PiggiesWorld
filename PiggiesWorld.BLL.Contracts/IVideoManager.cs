using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IVideoManager : ISubmitEntityManager
    {
        IEnumerable<(Video video, string uploaderName)> GetVideoWithUploaders(int count, bool submitedOnly);
        void AddVideo(Video video);
        void DeleteVideoById(int id);
    }
}
