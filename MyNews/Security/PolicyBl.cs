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

		public int create(Role role) {
			return dao.create(role);
		}

		public bool delete(int id) {
			return dao.delete(id);
		}

		public bool exists(string name) {
			return dao.exists(name);
		}

		public List<Role> getAllPermits(User user) {
			List<Role> roles = dao.getRole(user);

			foreach (Role role in roles) {
				getAllPermits(role);
			}
			return roles;
		}

		public List<Policy> getAllPermits(Role role) {
			role.policies = get(role).Distinct().ToList();
			role.policies = role.policies.Distinct().ToList();

			return role.policies;
		}

		List<Policy> get(Role role) {
			dao.getRole(role);

			foreach (Policy policy in role.policies.ToList()) {
				if (dao.isRole(policy)) {
					role.policies.AddRange(get(new Role { id = policy.id }));
				}
			}

			return role.policies;
		}

		public List<Policy> getPolicies() {
			return dao.getPolicies();
		}

		//public List<Policy> getPoliciesForUpdate(Role role) {
		//	List<Policy> result = new List<Policy>();
		//	List<Policy> rolePolicies = getAllPermits(role);

		//	foreach (Policy policy in dao.getPolicies()) {
		//		if (policy esta en las del role no agregar) { 
		//		}
		//	}
		//}

		public List<Role> getRoles(string text = null) {
			return dao.getRoles(text);
		}

		public Role getRole(Role role) {
			return dao.getRole(role);
		}

		public Role update(Role role) {
			return dao.update(role);
		}

		public bool hasPermission(User user, string policy) {
			if (user == null) {
				return false;
			}

			foreach (Role role in user.roles) {
				if (role.policies.Any(p => p.name == policy)) {
					return true;
				}
			}
			return false;
		}
	}
}
