using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PiggiesWorld.Common.Entities
{
    public class Announcement
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string PreviewPhotoName { get; set; }
        public string Description { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime UploadDate { get; set; }
        public int UserID { get; set; }
        public bool IsSubmited { get; set; }
    }
}
