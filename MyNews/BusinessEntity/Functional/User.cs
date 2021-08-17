using System.Collections.Generic;

namespace BusinessEntity
{
	class User
	{
		public int id;
		public string name;
		public string lastname;
		public List<Policy> policies;
		public string mail;
		public string username;
		public string password;
		public Language language;
	}
}
