using BusinessEntity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Persistence.Bussiness
{
	public class EmployeeDao : ConnectionDao
	{
		public bool delete(int id) {
			return logicDeleteById("employees", id);
		}

		public bool deleteByUser(int id) {
			return update("employees", new string[] { "deleted" }, new string[] { "1" }, new string[] { "user_id" }, new string[] { id.ToString() }) == 1;
		}

		public List<Employee> get(string name = null, bool showOld = false) {
			try {
				string consultaSQL = "SELECT e.id as employee_id, * FROM employees e JOIN users u ON u.id = e.user_id WHERE e.deleted = 0 AND u.deleted = 0 ";
				if (name != null) {
					consultaSQL += $" AND (u.username LIKE '%{name}%' OR u.name LIKE '%{name}%' OR u.lastname LIKE '%{name}%' OR e.id_number LIKE '%{name}%') ";
				}
				if (!showOld) {
					consultaSQL += $" AND ( e.end_day IS NULL OR e.end_day > GETDATE() ) ";
				}

				SqlCommand query = new SqlCommand(consultaSQL, conn);

				List<Employee> employees = new List<Employee>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						employees.Add(castDto(data));
					}
				}

				conn.Close();

				return employees;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public List<User> getUsersNotEmployed(string name) {
			try {
				string consultaSQL = "SELECT u.* FROM users u WHERE u.deleted = 0 AND u.id NOT IN (SELECT user_id FROM employees) ";
				consultaSQL += $" AND (u.username LIKE '%{name}%' OR u.name LIKE '%{name}%' OR u.lastname LIKE '%{name}%')";

				SqlCommand query = new SqlCommand(consultaSQL, conn);

				List<User> users = new List<User>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					UserDao userDao = new UserDao();
					while (data.Read()) {
						users.Add(userDao.castDto(data));
					}
				}

				conn.Close();

				return users;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public Employee update(Employee employee) {
			var colums = new string[] { "user_id", "start_day", "end_day", "id_number", "birthday" };
			var values = new string[] { employee.id.ToString(), employee.startDay.ToString(), employee.endDay != null ? employee.endDay.ToString() : null, employee.document, employee.birthday.ToString() };
			var whereColums = new string[] { "id" };
			var whereValues = new string[] { employee.employeeId.ToString() };
			update("employees", colums, values, whereColums, whereValues);
			return employee;
		}

		public Employee get(int id) {
			try {
				string consultaSQL = "SELECT e.id as employee_id, * FROM employees e JOIN users u ON u.id = e.user_id WHERE e.deleted = 0 AND u.deleted = 0 AND e.id = @id ";

				SqlCommand query = new SqlCommand(consultaSQL, conn);
				query.Parameters.AddWithValue("@id", id);

				Employee employee = new Employee();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						employee = castDto(data);
					}
				}

				conn.Close();

				return employee;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public Employee getByUser(User user) {
			try {
				string consultaSQL = "SELECT e.id as employee_id, * FROM employees e JOIN users u ON u.id = e.user_id WHERE e.deleted = 0 AND u.deleted = 0 AND u.id = @id ";

				SqlCommand query = new SqlCommand(consultaSQL, conn);
				query.Parameters.AddWithValue("@id", user.id);

				Employee employee = new Employee();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						employee = castDto(data);
					}
				}

				conn.Close();

				return employee;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public Employee create(Employee employee) {
			var colums = new string[] { "user_id", "start_day", "end_day", "id_number", "birthday" };
			var values = new string[] { employee.id.ToString(), employee.startDay.ToString(), employee.endDay != null ? employee.endDay.ToString() : null, employee.document, employee.birthday.ToString() };
			employee.id = insert("employees", colums, values);
			return employee;
		}

		int getReads(Employee employee) {
			// TODO

			return 1;
		}

		List<Employee> getMostRead() {
			// TODO

			return new List<Employee>();
		}

		List<Employee> getLessRead() {
			// TODO

			return new List<Employee>();
		}

		WriterRecommendation getRecommendations(User user, PostRecommendation post) {
			// TODO

			return new WriterRecommendation();
		}

		public Employee castDto(SqlDataReader data) {
			Employee result;

			string serializedParent = JsonConvert.SerializeObject(new UserDao().castDto(data));
			result = JsonConvert.DeserializeObject<Employee>(serializedParent);

			result.id = Convert.ToInt32(data["user_id"]);
			result.employeeId = Convert.ToInt32(data["employee_id"]);
			result.startDay = DateTime.Parse(data["start_day"].ToString());

			if (data["end_day"].ToString() != "") {
				result.endDay = DateTime.Parse(data["end_day"].ToString());
			} else {
				result.endDay = null;
			}

			result.birthday = DateTime.Parse(data["birthday"].ToString());
			result.document = data["id_number"].ToString();

			return result;
		}
	}
}
