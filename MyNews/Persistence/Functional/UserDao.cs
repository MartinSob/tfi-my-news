using BusinessEntity;
using System;
using System.Data.SqlClient;

namespace Persistence.Functional
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
				new DvDao().updateDv();

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
			var columns = new string[] { "username", "password", "name", "lastname", "mail" };
			var values = new string[] { user.username, user.password, user.name, user.lastname, user.mail };
			update("users", columns, values, new string[] { "id" }, new string[] { user.id.ToString() });

			return user;
		}

		public User login(User user) {
			try {
				SqlCommand query = new SqlCommand("SELECT * FROM users WHERE username = @username AND password = @password AND active = 1", conn);
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
				querySet.Parameters.AddWithValue("@id", user.username);

				executeQuery(querySet);

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
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
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
