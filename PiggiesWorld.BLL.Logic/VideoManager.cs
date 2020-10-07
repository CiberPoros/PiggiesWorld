using System;
using System.Collections.Generic;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;

namespace PiggiesWorld.BLL.Logic
{
    public class VideoManager : IVideoManager
    {
        private readonly IVideoDao _videoDao;

        public VideoManager(IVideoDao videoDao)
        {
            _videoDao = videoDao ?? throw new ArgumentNullException(nameof(videoDao));
        }

        public void AddVideo(Video video) => _videoDao.AddVideo(video);
        public IEnumerable<(Video video, string uploaderName)> GetVideoWithUploaders(int count) => _videoDao.GetVideoWithUploaders(count);
    }
}
