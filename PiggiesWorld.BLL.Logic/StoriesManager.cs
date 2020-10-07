using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.DAL.Contracts;

namespace PiggiesWorld.BLL.Logic
{
    public class StoriesManager : IStoriesManager
    {
        private readonly IStoriesDao _storiesDao;
        private readonly IImageDao _imageDao;

        public StoriesManager(IStoriesDao storiesDao, IImageDao imageDao)
        {
            _storiesDao = storiesDao ?? throw new ArgumentNullException(nameof(storiesDao));
            _imageDao = imageDao ?? throw new ArgumentNullException(nameof(imageDao));
        }

        public void AddStory(Stream previewPhotoStream, Stream photo1Stream, Stream photo2Stream, Story story)
        {
            var previewPhotoName = _imageDao.SaveImage(previewPhotoStream, story.PreviewPhotoName);
            var photoName1 = story.PhotoName1 == null ? null : _imageDao.SaveImage(photo1Stream, story.PhotoName1);
            var photoName2 = story.PhotoName2 == null ? null : _imageDao.SaveImage(photo2Stream, story.PhotoName2);

            story.PreviewPhotoName = Path.GetFileName(previewPhotoName);
            story.PhotoName1 = photoName1 == null ? null : Path.GetFileName(photoName1);
            story.PhotoName2 = photoName2 == null ? null : Path.GetFileName(photoName2);

            _storiesDao.AddStory(story);
        }

        public IEnumerable<(Story story, string uploaderName)> GetStoriesWithUploaders(int count) => _storiesDao.GetStoriesWithUploaders(count);
        public Story GetStoryById(int id) => _storiesDao.GetStoryById(id);
    }
}
