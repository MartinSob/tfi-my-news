﻿using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence
{
	public class PolicyDao : ConnectionDao
	{
		public bool assignRole(User user, Role role) {
			role.id = insert("user_roles", new string[] { "user_id", "policy_id" }, new string[] { user.id.ToString(), role.id.ToString() });
			return true;
		}

		public bool assignBasicRole(User user) {
			return assignRole(user, new Role { id = 14 });
		}

		public bool delete(int id) {
			if (id == 14) {
				return false;
			}

			SqlCommand query = new SqlCommand($"DELETE FROM user_roles WHERE policy_id = {id}", conn);
			if (!executeQuery(query))
				return false;

			if (!deleteRoleRelations(id))
				return false;

			return logicDeleteById("policies", id);
		}

		public bool deleteRoleRelations(int id) {
			SqlCommand query = new SqlCommand($"DELETE FROM roles WHERE role_id = {id} OR policy_id = {id} ", conn);
			return executeQuery(query);
		}

		public int create(Role role) {
			role.id = insert("policies", new string[] { "name" }, new string[] { role.name });

			foreach (Policy policy in role.policies) {
				insert("roles", new string[] { "policy_id", "role_id" }, new string[] { policy.id.ToString(), role.id.ToString() });
			}

			return role.id;
		}

		public Role update(Role role) {
			SqlCommand query = new SqlCommand($"UPDATE policies SET name = '{role.name}' WHERE id = {role.id}", conn);
			executeQuery(query);

			deleteRoleRelations(role.id);

			foreach (Policy policy in role.policies) {
				insert("roles", new string[] { "policy_id", "role_id" }, new string[] { policy.id.ToString(), role.id.ToString() });
			}

			return role;
		}

		public List<Policy> getPolicies(string text = null) {
			try {
				string q = "SELECT DISTINCT p.* FROM policies p WHERE p.deleted = 0 ";

				if (text != null) {
					q += " AND p.name LIKE CONCAT('%', @policyName, '%') ";
				}

				SqlCommand query = new SqlCommand(q, conn);

				if (text != null) {
					query.Parameters.AddWithValue("@policyName", text);
				}

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

		public List<Role> getRole(User user) {
			try {
				SqlCommand query = new SqlCommand("SELECT p.* FROM policies p JOIN user_roles ur ON ur.policy_id = p.id WHERE p.deleted = 0 AND ur.user_id = @user", conn);
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
				SqlCommand queryGet = new SqlCommand($"SELECT * FROM policies p WHERE p.deleted = 0 AND p.id = ${role.id}", conn);

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
				string q = "SELECT DISTINCT p.* FROM roles r JOIN policies p ON p.id = r.role_id WHERE p.deleted = 0 ";

				if (text != null) {
					q += " AND p.name LIKE CONCAT('%', @roleName, '%') ";
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

		public bool cleanRoles(User user) {
			SqlCommand query = new SqlCommand($"DELETE FROM user_roles WHERE user_id = {user.id}", conn);
			return executeQuery(query);
		}
	}
}
