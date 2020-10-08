using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PiggiesWorld.Common.Entities
{
    public class Photo
    {
        public int ID { get; set; }
        public string Path { get; set; }
        public User Uploader { get; set; }
        public string Description { get; set; }
        public int VotesCount { get; set; }
        public float Rating { get; set; }
        public DateTime UploadDate { get; set; }
        public bool IsSubmited { get; set; }
    }
}
