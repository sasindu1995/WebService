using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infox.DTO
{
    public class ImproperCalendarEvent
    {
        public int id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public string start { get; set; }
        public string end { get; set; }
        public bool allDay { get; set; }
        public string eventColor { get; set; }
        public string color { get; set; }
        public string textColor { get; set; }
        public string backgroundColor { get; set; }

        
    }

}
