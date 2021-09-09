using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
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

		public List<Role> getRole(User user) {
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

		public Role getRole(Role role) {
			try {
				SqlCommand queryGet = new SqlCommand($"SELECT * FROM policies p WHERE p.id = ${role.id}", conn);

				conn.Open();
				SqlDataReader dataGet = queryGet.ExecuteReader();

				if (dataGet.HasRows) {
					while (dataGet.Read()) {
						role.name = dataGet["name"].ToString();
					}
				}

				conn.Close();

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

		public List<Role> getRoles(string text = null) {
			try {
				string q = "SELECT DISTINCT p.* FROM roles r JOIN policies p ON p.id = r.role_id ";

				if (text != null) {
					q += " WHERE p.name LIKE CONCAT('%', @roleName, '%') ";
				}

				SqlCommand query = new SqlCommand(q, conn);

				if (text != null) {
					query.Parameters.AddWithValue("@roleName", text);
				}

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

		public List<Policy> getRole() {
			try {
				string q = "SELECT * FROM policies p WHERE p.id NOT IN ( SELECT DISTINCT p.id FROM roles r JOIN policies p ON p.id = r.role_id )";
				SqlCommand query = new SqlCommand(q, conn);

				List<Policy> policies = new List<Policy>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						policies.Add(new Policy {
							id = int.Parse(data["id"].ToString()),
							name = data["name"].ToString()
						});
					}
				}

				conn.Close();

				return policies;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public void cleanRoles(User user) {
			// TODO
		}
	}
}
