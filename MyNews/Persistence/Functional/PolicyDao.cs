using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Functional
{
	public class PolicyDao : ConnectionDao
	{
		public bool assignRole(User user, Policy policy) {
			// TODO
			
			return true;
		}

		public bool assignBasicRole(User user) {
			// TODO

			return true;
		}

		public bool delete(int id) {
			// TODO

			return true;
		}

		public bool exists(string names) {
			// TODO

			return true;
		}

		public int create(Policy policy) {
			// TODO

			return 1;
		}

		public int update(Policy policy) {
			// TODO

			return 1;
		}

		public List<Policy> get(User user) {
			// TODO

			return new List<Policy>();
		}

		public List<Policy> get() {
			// TODO

			return new List<Policy>();
		}

		public void cleanRoles(User user) {
			// TODO
		}
	}
}
