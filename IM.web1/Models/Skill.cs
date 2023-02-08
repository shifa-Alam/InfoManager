using System;
using System.Collections.Generic;

namespace IM.web1.Models
{
    public partial class Skill
    {
        public Skill()
        {
            MemberSkills = new HashSet<MemberSkill>();
        }

        public long Id { get; set; }
        public string Name { get; set; } = null!;
        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<MemberSkill> MemberSkills { get; set; }
    }
}
