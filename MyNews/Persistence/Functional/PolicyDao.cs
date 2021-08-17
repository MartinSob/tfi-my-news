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
		bool assignRole(User user, Policy policy) {
			// TODO
			
			return true;
		}

		bool assignBasicRole(User user) {
			// TODO

			return true;
		}

		bool delete(int id) {
			// TODO

			return true;
		}

		bool exists(string username, string mail) {
			// TODO

			return true;
		}

		int create(Policy policy) {
			// TODO

			return 1;
		}

		int update(Policy policy) {
			// TODO

			return 1;
		}

		List<Policy> get(User user) {
			// TODO

			return new List<Policy>();
		}

		List<Policy> get() {
			// TODO

			return new List<Policy>();
		}

		void cleanRoles(User user) {
			// TODO
		}
	}
}
