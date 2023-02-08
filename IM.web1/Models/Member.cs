using System;
using System.Collections.Generic;

namespace IM.web1.Models
{
    public partial class Member
    {
        public Member()
        {
            MemberSkills = new HashSet<MemberSkill>();
        }

        public long Id { get; set; }
        public string Name { get; set; } = null!;
        public long CountryId { get; set; }
        public string Resume { get; set; } = null!;
        public DateTime DateOfBirth { get; set; }
        public long CityId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? Active { get; set; }

        public virtual City City { get; set; } = null!;
        public virtual Country Country { get; set; } = null!;
        public virtual ICollection<MemberSkill> MemberSkills { get; set; }
    }
}
