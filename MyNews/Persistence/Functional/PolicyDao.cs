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

		public Role get(User user) {
			try {
				SqlCommand query = new SqlCommand("SELECT r.policy_id, p.name, r.role_id FROM policies p JOIN user_roles up ON up.policy_id = p.id JOIN roles r ON r.role_id = p.id WHERE up.user_id = @user", conn);
				query.Parameters.AddWithValue("@user", user.id);

				Role role = new Role();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						role.id = int.Parse(data["role_id"].ToString());
						role.name = data["name"].ToString();
						role.policies.Add(new Policy { id = int.Parse(data["policy_id"].ToString()) });
					}
				}

				conn.Close();

				return role;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public Role get(Role role) {
			try {
				SqlCommand query = new SqlCommand("SELECT r.policy_id FROM roles r WHERE r.role_id = @role", conn);
				query.Parameters.AddWithValue("@role", role.id);

				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						role.policies.Add(new Policy { id = int.Parse(data["policy_id"].ToString()) });
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
