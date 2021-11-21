using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Persistence
{
	public class EmployeeRecommendationDao : ConnectionDao
	{
		public EmployeeRecommendation get(User user, Employee employee) {
			try {
				SqlCommand query = new SqlCommand("GetEmployeeRecommendationForUser", conn);
				query.CommandType = CommandType.StoredProcedure;

				query.Parameters.Add(new SqlParameter {
					ParameterName = "@userId",
					DbType = DbType.Int32,
					Value = user.id
				});

				query.Parameters.Add(new SqlParameter {
					ParameterName = "@employeeId",
					DbType = DbType.Int32,
					Value = employee.id
				});

				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				EmployeeRecommendation employees = new EmployeeRecommendation();
				if (data.HasRows) {
					while (data.Read()) {
						employees = castDto(data);
					}
				}

				conn.Close();

				return employees;
			} catch (Exception e) {
				Console.WriteLine(e);
				return null;
			}
		}

		public List<EmployeeRecommendation> getPopulars() {
			try {
				SqlCommand query = new SqlCommand("GetPopularEmployees", conn);
				query.CommandType = CommandType.StoredProcedure;

				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				List<EmployeeRecommendation> employees = new List<EmployeeRecommendation>();
				if (data.HasRows) {
					while (data.Read()) {
						employees.Add(castDto(data));
					}
				}

				conn.Close();

				return employees;
			} catch (Exception e) {
				Console.WriteLine(e);
				return new List<EmployeeRecommendation>();
			}
		}

		public List<EmployeeRecommendation> getUnpopulars() {
			try {
				SqlCommand query = new SqlCommand("GetUnpopularEmployees", conn);
				query.CommandType = CommandType.StoredProcedure;

				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				List<EmployeeRecommendation> employees = new List<EmployeeRecommendation>();
				if (data.HasRows) {
					while (data.Read()) {
						employees.Add(castDto(data));
					}
				}

				conn.Close();

				return employees;
			} catch (Exception e) {
				Console.WriteLine(e);
				return new List<EmployeeRecommendation>();
			}
		}

		public EmployeeRecommendation castDto(SqlDataReader data) {
			EmployeeRecommendation t = new EmployeeRecommendation(new EmployeeDao().castDto(data));
			t.views = data["views"] != null ? Convert.ToInt32(data["views"]) : 0;
			t.finished = data["finished"] != null ? Convert.ToInt32(data["finished"]) : 0;
			t.qualification = data["qualification"] != null ? Convert.ToInt32(data["qualification"]) : 0;

			return t;
		}
	}
}
