using System.Collections.Generic;

namespace BusinessEntity
{
	public class Role : Policy
	{
		public List<Policy> policies = new List<Policy>();
	}
}
