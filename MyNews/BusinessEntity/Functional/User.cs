using System.Collections.Generic;

namespace BusinessEntity
{
	public class User
	{
		public int id;
		public string name;
		public string lastname;
		public List<Role> roles = new List<Role>();
		public string mail;
		public string username;
		public string password;
		public Language language;
		public bool active;
		public int failedAttempts;
	}
}
