using System;
using System.Collections.Generic;

namespace IM.web1.Models
{
    public partial class MemberSkill
    {
        public long Id { get; set; }
        public long MemberId { get; set; }
        public long SkillId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool IsSelect { get; set; }
        public bool? Active { get; set; }

        public virtual Member Member { get; set; } = null!;
        public virtual Skill Skill { get; set; } = null!;
    }
}
