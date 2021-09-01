using BusinessEntity;
using Persistence.Functional;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Security
{
	public class PolicyBl
	{
		PolicyDao dao = new PolicyDao();

		public bool assignBasicRole(User user) {
			return dao.assignBasicRole(user);
		}

		public bool assignRole(User user, Policy policy) {
			return dao.assignRole(user, policy);
		}

		public void cleanRoles(User user) {
			dao.cleanRoles(user);
		}

		public int create(Policy policy) {
			return dao.create(policy);
		}

		public bool delete(int id) {
			return dao.delete(id);
		}

		public bool exists(string name) {
			return dao.exists(name);
		}

		public List<Policy> get(User user) {
			Role role = dao.get(user);
			return get(role).Distinct().ToList();
		}

		public List<Policy> get(Role role) {
			foreach (Policy policy in role.policies.ToList()) {
				if (dao.isRole(policy)) {
					Role newRole = dao.get(new Role {
						id = policy.id
					});
					role.policies.AddRange(get(newRole));
				}
			}

			return role.policies;
		}

		//public List<Policy> getRoleTree(Role role) {
		//	// For each policie check if role
		//	foreach (Policy policy in role.policies) {
		//		if (dao.isRole(policy)) {
		//			// If yes: Get policies of role
		//			Role newRole = new Role { id = policy.id };
		//			role.policies.Add(newRole);
		//			get(newRole);
		//		} else {
		//			// If not: Add policy to list
		//			role.policies.Add(policy);
		//		}
		//	}

		//	return;
		//}

		public List<Policy> get() {
			return dao.get();
		}

		public int update(Policy policy) {
			return dao.update(policy);
		}

		public bool hasPermission(User user, string policy) {
			var userPolicies = get(user);
			return userPolicies.Any(p => p.name == policy); ;
		}
	}
}
