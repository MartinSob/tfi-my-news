using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Persistence
{
	public class UserDao : ConnectionDao
	{
		public bool delete(int id) {
			return logicDeleteById("users", id);
		}

		public bool exists(string username, string mail) {
			try {
				SqlCommand query = new SqlCommand("SELECT * FROM users WHERE username = @username OR mail = @mail AND active = 1", conn);
				query.Parameters.AddWithValue("@username", username);
				query.Parameters.AddWithValue("@mail", mail);

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
				return true;
			}
		}

		public List<User> get(string name = null) {
			try {
				string consultaSQL = "SELECT * FROM users u WHERE deleted = 0";
				if (name != null) {
					consultaSQL += $" AND (u.username LIKE '%{name}%' OR u.name LIKE '%{name}%' OR u.lastname LIKE '%{name}%')";
				}

				SqlCommand query = new SqlCommand(consultaSQL, conn);

				List<User> users = new List<User>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						users.Add(castDto(data));
					}
				}

				conn.Close();

				return users;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public User get(int id) {
			try {
				SqlCommand query = new SqlCommand("SELECT * FROM users u WHERE active = 1 AND id = @id", conn);
				query.Parameters.AddWithValue("@id", id);

				User user = null;
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						user = castDto(data);
					}
				}

				conn.Close();

				return user;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public int addFailedAttempt(string username) {
			try {
				SqlCommand query = new SqlCommand("SELECT * FROM users WHERE username = @username AND active = 1", conn);
				query.Parameters.AddWithValue("@username", username);

				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (!data.HasRows) {
					return 0;
				}

				data.Read();
				int userId = int.Parse(data["id"].ToString());
				int attempts = int.Parse(data["failed_attempts"].ToString()) + 1;
				conn.Close();

				update("users", new string[] { "failed_attempts" }, new string[] { attempts.ToString() }, new string[] { "id" }, new string[] { userId.ToString() });

				return attempts;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return 0;
			}
		}

		public User create(User user) {
			var columns = new string[] { "username", "password", "name", "lastname", "mail" };
			var values = new string[] { user.username, user.password, user.name, user.lastname, user.mail };
			user.id = insert("users", columns, values);

			return user;
		}

		public User update(User user) {
			var columns = new string[] { "name", "lastname", "mail" };
			var values = new string[] { user.name, user.lastname, user.mail };
			update("users", columns, values, new string[] { "id" }, new string[] { user.id.ToString() });

			return user;
		}

		public User login(User user) {
			try {
				SqlCommand query = new SqlCommand("SELECT * FROM users WHERE username = @username AND password = @password AND active = 1 AND deleted = 0", conn);
				query.Parameters.AddWithValue("@username", user.username);
				query.Parameters.AddWithValue("@password", user.password);

				User loggedUser = null;
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					data.Read();
					loggedUser = castDto(data);
				}

				conn.Close();

				return loggedUser;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public void block(User user) {
			try {
				SqlCommand querySet = new SqlCommand("UPDATE users SET active = 0 WHERE username = @username", conn);
				querySet.Parameters.AddWithValue("@username", user.username);

				executeQuery(querySet);
				new DvDao().updateDv();
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
			}
		}

		public void restartFailedAttempts(User user) {
			try {
				SqlCommand querySet = new SqlCommand("UPDATE users SET failed_attempts = 0 WHERE id = @id", conn);
				querySet.Parameters.AddWithValue("@id", user.id);

				executeQuery(querySet);
				new DvDao().updateDv();
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
			}
		}

		public void updatePassword(User user) {
			try {
				SqlCommand querySet = new SqlCommand("UPDATE users SET password = @password WHERE mail = @mail", conn);
				querySet.Parameters.AddWithValue("@mail", user.mail);
				querySet.Parameters.AddWithValue("@password", user.password);
				executeQuery(querySet);
				new DvDao().updateDv();
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
			}
		}

		public void updatePasswordById(User user) {
			try {
				SqlCommand querySet = new SqlCommand("UPDATE users SET password = @password WHERE id = @id", conn);
				querySet.Parameters.AddWithValue("@id", user.id);
				querySet.Parameters.AddWithValue("@password", user.password);
				executeQuery(querySet);
				new DvDao().updateDv();
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
			}
		}

		public User getRoles(User user) {
			try {
				SqlCommand query = new SqlCommand("SELECT p.* FROM user_roles ur JOIN policies p ON p.id = ur.policy_id WHERE user_id = @id", conn);
				query.Parameters.AddWithValue("@id", user.id);

				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						user.roles.Add(new Role {
							id = int.Parse(data["id"].ToString()),
							name = data["name"].ToString()
						});
					}
				}

				conn.Close();

				return user;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public User castDto(SqlDataReader data) {
			User result = new User();
			result.id = Convert.ToInt32(data["id"]);
			result.username = data["username"].ToString();
			result.mail = data["mail"].ToString();
			result.name = data["name"].ToString();
			result.lastname = data["lastname"].ToString();
			result.active = (bool)data["active"];
			result.failedAttempts = int.Parse(data["failed_attempts"].ToString());
			result.language = new Language { id = int.Parse(data["language_id"].ToString()) };

			return result;
		}
	}
}
