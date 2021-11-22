using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntity
{
	public class Employee : User
	{
		public int employeeId { get; set; }
		public DateTime startDay { get; set; }
		public DateTime? endDay { get; set; }
		public string document { get; set; }
		public DateTime birthday { get; set; }
	}
}
