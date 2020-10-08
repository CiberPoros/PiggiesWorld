using System;
using System.Collections.Generic;

namespace PiggiesWorld.Common.Entities
{
    public class User 
    {
        public int ID { get; set; }
        public string LoginName { get; set; }
        public DateTime BirthDay { get; set; }

        public int Age =>
            DateTime.Now.Year - BirthDay.Year -
            ((BirthDay.Month > DateTime.Now.Month
            || (BirthDay.Month == DateTime.Now.Month
            && BirthDay.Day >= DateTime.Now.Day)) ? 1 : 0);

        public ICollection<Role> Roles { get; set; }
        public ICollection<Photo> UploadedPhotos { get; set; }
        public ICollection<Video> UploadedVideos { get; set; }
    }
}
