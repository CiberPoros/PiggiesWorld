using System.Collections.Generic;
using PiggiesWorld.Common.Entities.Contracts;

namespace PiggiesWorld.Common.Entities
{
    public class Role : IEntityWithId
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public ICollection<User> Users { get; }
    }
}
