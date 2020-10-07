using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IVideoManager
    {
        IEnumerable<(Video video, string uploaderName)> GetVideoWithUploaders(int count);
        void AddVideo(Video video);
    }
}
