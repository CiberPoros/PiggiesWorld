using System.Collections.Generic;
using PiggiesWorld.Common.Entities.Contracts;

namespace PiggiesWorld.Common.Entities
{
    public class Role : IEntityWithId
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public ICollection<User> Users { get; }

        public override bool Equals(object obj) => obj is Role role && ID == role.ID;
        public override int GetHashCode() => 1213502048 + ID.GetHashCode();
    }
}
