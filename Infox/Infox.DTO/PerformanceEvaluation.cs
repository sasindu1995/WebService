using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infox.DTO
{
    public class PerformanceEvaluation
    {
    }
    [Serializable]
    public class QuestionDetails
    {
        public int QuestionId { get; set; }
        public string QuestionName { get; set; }
        public int QuestionSetId { get; set; }
        public string QuestionSetName { get; set; }
        public string QuestionSetDescription { get; set; }
    }
}
