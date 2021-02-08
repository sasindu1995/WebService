using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infox.DTO
{
    public class ComDayTypes
    {

        public string DayType { get; set; }
        public string DayTypeCode { get; set; }
        public int DayTypeId { get; set; }
        public string color { get; set; }
        public string textColor { get; set; }
        public bool IsDefault { get; set; }
    }

    public class DayTypesCalender
    {
        public DateTime CalenderDate { get; set; }
        public int CompanyId { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public int Day { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public int DayTypeId { get; set; }
        public bool Posted { get; set; }
        public string CreatedUser { get; set; }
        public string Subject { get; set; }
    }

    public class ShiftSetupTypes
    {

        public string ShiftSetupId { get; set; }
        public string ShiftSetupName { get; set; }
        public string DayTypeCode { get; set; }
        public string DayTypeId { get; set; }

        //public string color { get; set; }
        //public string textColor { get; set; }
        //public bool IsDefault { get; set; }

    }
}
