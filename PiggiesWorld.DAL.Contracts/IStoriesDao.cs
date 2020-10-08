using System.Collections.Generic;
using PiggiesWorld.Common.Entities;

namespace PiggiesWorld.DAL.Contracts
{
    public interface IStoriesDao : ISubmitEntityDao, ICountOfElementDao
    {
        void AddStory(Story story);

        IEnumerable<(Story story, string uploaderName)> GetStoriesWithUploaders(int count, bool submitedOnly);

        Story GetStoryById(int id);

        void DeleteStoryById(int id);
    }
}
