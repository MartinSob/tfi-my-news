using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

		public List<Role> get(User user) {
			try {
				SqlCommand query = new SqlCommand("SELECT p.* FROM policies p JOIN user_roles ur ON ur.policy_id = p.id WHERE ur.user_id = @user", conn);
				query.Parameters.AddWithValue("@user", user.id);

				List<Role> roles = new List<Role>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						roles.Add(new Role {
							id = int.Parse(data["id"].ToString()),
							name = data["name"].ToString()
						});
					}
				}

				conn.Close();

				return roles;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public Role get(Role role) {
			try {
				SqlCommand query = new SqlCommand("SELECT p.* FROM roles r JOIN policies p ON p.id = r.policy_id WHERE r.role_id = @role", conn);
				query.Parameters.AddWithValue("@role", role.id);

				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						role.policies.Add(new Policy { 
							id = int.Parse(data["id"].ToString()), 
							name = data["name"].ToString()
						});
					}
				}

				conn.Close();

				return role;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public bool isRole(Policy policy) {
			try {
				SqlCommand query = new SqlCommand("SELECT r.policy_id FROM roles r WHERE r.role_id = @policy", conn);
				query.Parameters.AddWithValue("@policy", policy.id);

				bool result = false;
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					result = true;
				}

				conn.Close();

				return result;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return false;
			}
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
