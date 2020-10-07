using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IStoriesDao
    {
        void AddStory(Story story);

        IEnumerable<(Story story, string uploaderName)> GetStoriesWithUploaders(int count);

        Story GetStoryById(int id);

        void DeleteStoryById(int id);
    }
}
