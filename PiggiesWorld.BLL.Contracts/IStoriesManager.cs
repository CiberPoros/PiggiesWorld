using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.BLL.Contracts
{
    public interface IStoriesManager : ISubmitEntityManager
    {
        void AddStory(Stream previewPhotoStream, Stream photo1Stream, Stream photo2Stream, Story story);
        IEnumerable<(Story story, string uploaderName)> GetStoriesWithUploaders(int count, bool submitedOnly);
        Story GetStoryById(int id);
        void DeleteStoryById(int id);
    }
}
