using System;

namespace PiggiesWorld.Common.Entities
{
    public class Video 
    {
        public int ID { get; set; }
        public string Url { get; set; }
        public int UserID { get; set; }
        public string Description { get; set; }
        public DateTime UploadDate { get; set; }
        public bool IsSubmited { get; set; }
    }
}
