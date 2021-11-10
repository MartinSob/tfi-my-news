using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Persistence
{
	public class PostRecommendationDao : ConnectionDao
	{
		public List<EmployeeRecommendation> getPopulars() {
			// TODOOOOO
			SqlCommand query = new SqlCommand("GetPopularPosts", conn);
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
		}

		public List<EmployeeRecommendation> getUnpopulars() {
			// TODOOOOO
			SqlCommand query = new SqlCommand("GetUnpopularPosts", conn);
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
		}

		public EmployeeRecommendation castDto(SqlDataReader data) {
			EmployeeRecommendation t = new EmployeeRecommendation(new EmployeeDao().castDto(data));
			t.views = Convert.ToInt32(data["views"]);
			t.finished = Convert.ToInt32(data["finished"]);
			t.qualification = Convert.ToInt32(data["qualification"]);

			return t;
		}
	}
}
