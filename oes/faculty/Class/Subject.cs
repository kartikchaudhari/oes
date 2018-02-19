using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace oes.faculty.Class
{
    public class Subject
    {
        public int SubjectId { get; set; }
        public string SubjectName { get; set; }
        public int DeptId { get; set; }
        public int SemId { get; set; }
    }
}