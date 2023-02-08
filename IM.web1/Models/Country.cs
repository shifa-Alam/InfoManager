using System;
using System.Collections.Generic;

namespace IM.web1.Models
{
    public partial class Country
    {
        public Country()
        {
            Cities = new HashSet<City>();
            Members = new HashSet<Member>();
        }

        public long Id { get; set; }
        public string Name { get; set; } = null!;
        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<City> Cities { get; set; }
        public virtual ICollection<Member> Members { get; set; }
    }
}
