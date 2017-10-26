using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using AutoMapper;
using Rosly.Dtos;
using Rosly.Models;

namespace Rosly.App_Start
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            Mapper.CreateMap<Schedule, ScheduleDto>();
            Mapper.CreateMap<ScheduleDto, Schedule>();
            Mapper.CreateMap<Enrollment, EnrollmentDto>();
            Mapper.CreateMap<EnrollmentDto, Enrollment>();
        }
    }
}