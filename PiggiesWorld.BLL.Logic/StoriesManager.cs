﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using PiggiesWorld.BLL.Contracts;
using PiggiesWorld.Common.Entities;
using PiggiesWorld.Common.Exceptions;
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
            try
            {
                var previewPhotoName = _imageDao.SaveImage(previewPhotoStream, story.PreviewPhotoName);
                var photoName1 = story.PhotoName1 == null ? null : _imageDao.SaveImage(photo1Stream, story.PhotoName1);
                var photoName2 = story.PhotoName2 == null ? null : _imageDao.SaveImage(photo2Stream, story.PhotoName2);

                story.PreviewPhotoName = Path.GetFileName(previewPhotoName);
                story.PhotoName1 = photoName1 == null ? null : Path.GetFileName(photoName1);
                story.PhotoName2 = photoName2 == null ? null : Path.GetFileName(photoName2);

                _storiesDao.AddStory(story);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
            catch (IOException e)
            {
                throw new DALException(DALType.HARD_DRIVE, e.Message, e);
            }
        }

        public void DeleteStoryById(int id)
        {
            try
            {
                _storiesDao.DeleteStoryById(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public IEnumerable<(Story story, string uploaderName)> GetStoriesWithUploaders(int count, bool submitedOnly)
        {
            try
            {
                return _storiesDao.GetStoriesWithUploaders(count, submitedOnly);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public Story GetStoryById(int id)
        {
            try
            {
                return _storiesDao.GetStoryById(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public int GetCount(bool submitedOnly)
        {
            try
            {
                return _storiesDao.GetCount(submitedOnly);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }

        public void Submit(int id)
        {
            try
            {
                _storiesDao.Submit(id);
            }
            catch (SqlException e)
            {
                throw new DALException(DALType.SQL, e.Message, e);
            }
        }
    }
}
