
using AutoMapper;
using IM.Core.Entities;
using IM.Core.Models;
using IM.Core.Services;
using Microsoft.AspNetCore.Mvc;


namespace IM.web1.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class MemberController : BaseController
    {
        private readonly IMemberService _memberService;
        private readonly ISkillService _skillService;
        private readonly ICityService _cityService;
        private readonly ICountryService _countryService;
        private readonly IMapper _mapper;



        public MemberController(IMemberService memberService, ISkillService skillService,ICityService cityService,ICountryService countryService, IMapper mapper)
        {

            _memberService = memberService;
            _skillService = skillService;
            _cityService = cityService;
            _countryService = countryService;
            _mapper = mapper;

        }



        [HttpPost]
        [Route("SaveMember")]
        public IActionResult SaveMember(MemberInputModel memberIn)
        {

            var mappedData = _mapper.Map<Member>(memberIn);

            //_memberService.Save(mappedData);
            //List<MemberSkill> skills = new List<MemberSkill>();

            //foreach (var item in memberIn.MemberSkills)
            //{
            //    var skill = new MemberSkill
            //    {
            //        SkillId = item.SkillId
            //    };
            //    skills.Add(skill);
            //}

            //var member = new Member
            //{
            //    Name = memberIn.Name,
            //    CountryId = memberIn.CountryId,
            //    CityId = memberIn.CityId,
            //    DateOfBirth = memberIn.DateOfBirth,
            //    CreatedDate = DateTime.Now,
            //    MemberSkills = skills
            //};

            _memberService.SaveWithSkills(mappedData);
            return Ok();
        }
        [HttpPost]
        [Route("UpdateMember")]
        public IActionResult UpdateMember(MemberInputModel memberIn)
        {

            var mappedData = _mapper.Map<Member>(memberIn);

            _memberService.Update(mappedData);
            return Ok();
        }
        [HttpDelete]
        [Route("DeleteMember")]
        public IActionResult DeleteMember(long id)
        {
            _memberService.DeleteById(id);

            return Ok();
        }



        [HttpGet]
        [Route("FindById")]
        public IActionResult FindById(long id)
        {

            var member = _memberService.FindById(id);

            var mappedData = _mapper.Map<MemberViewModel>(member);
            return Ok(mappedData);
            return Ok();

        }




        [HttpGet]
        [Route("GetMembers")]
        public IActionResult GetMembers()
        {
            var members = _memberService.Get();

            var mappedDate= _mapper.Map<List<MemberViewModel>>(members);
            return Ok(mappedDate);

        }


        [HttpGet]
        [Route("GetCities")]
        public IActionResult GetCities()
        {
            var cities = _cityService.Get();

            return Ok(cities);

        }

        [HttpGet]
        [Route("GetCountries")]
        public IActionResult GetCountries()
        {
            var countries = _countryService.Get();

            return Ok(countries);

        }

        [HttpGet]
        [Route("GetSkills")]
        public IActionResult GetSkills()
        {
            var skills = _skillService.Get();

            return Ok(skills);

        }

        public override void Dispose()
        {

            _memberService?.Dispose();
            _skillService?.Dispose();
            _countryService?.Dispose();
            _cityService?.Dispose();
        }
    }

}