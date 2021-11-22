using System.Collections.Generic;

namespace BusinessEntity
{
	public class User
	{
		public int id { get; set; }
		public string name { get; set; }
		public string lastname { get; set; }
		public List<Role> roles = new List<Role>();
		public string mail { get; set; }
		public string username { get; set; }
		public string password { get; set; }
		public Language language { get; set; }
		public bool active { get; set; }
		public int failedAttempts { get; set; }
	}
}
