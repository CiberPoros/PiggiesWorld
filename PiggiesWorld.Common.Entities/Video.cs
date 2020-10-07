using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PiggiesWorld.Common.Entities.Contracts;

namespace PiggiesWorld.Common.Entities
{
    public class Video : IEntityWithId
    {
        public int ID { get; set; }
        public string Path { get; set; }
        public User Uploader { get; set; }
        public string Description { get; set; }
        public DateTime UploadDate { get; set; }
    }
}
