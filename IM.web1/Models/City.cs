using System;
using System.Collections.Generic;

namespace IM.web1.Models
{
    public partial class City
    {
        public City()
        {
            Members = new HashSet<Member>();
        }

        public long Id { get; set; }
        public string Name { get; set; } = null!;
        public long CountryId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? Active { get; set; }

        public virtual Country Country { get; set; } = null!;
        public virtual ICollection<Member> Members { get; set; }
    }
}
