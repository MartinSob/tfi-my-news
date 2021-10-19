using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntity
{
	public class Employee : User
	{
		public int employeeId;
		public DateTime startDay;
		public DateTime? endDay;
		public string document;
		public DateTime birthday;
	}
}
