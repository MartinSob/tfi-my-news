using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Persistence
{
	public class PostRecommendationDao : ConnectionDao
	{
		public List<PostRecommendation> getPopulars() {
			SqlCommand query = new SqlCommand("GetPopularPosts", conn);
			query.CommandType = CommandType.StoredProcedure;

			conn.Open();
			SqlDataReader data = query.ExecuteReader();

			List<PostRecommendation> posts = new List<PostRecommendation>();
			if (data.HasRows) {
				while (data.Read()) {
					posts.Add(castDto(data));
				}
			}

			conn.Close();

			return posts;
		}

		public List<PostRecommendation> getUnpopulars() {
			SqlCommand query = new SqlCommand("GetUnpopularPosts", conn);
			query.CommandType = CommandType.StoredProcedure;

			conn.Open();
			SqlDataReader data = query.ExecuteReader();

			List<PostRecommendation> posts = new List<PostRecommendation>();
			if (data.HasRows) {
				while (data.Read()) {
					posts.Add(castDto(data));
				}
			}

			conn.Close();

			return posts;
		}

		public Dictionary<string, int> getTotalReads() {
			SqlCommand query = new SqlCommand("GetTotalReads", conn);
			query.CommandType = CommandType.StoredProcedure;

			conn.Open();
			SqlDataReader data = query.ExecuteReader();

			Dictionary<string, int> posts = new Dictionary<string, int>();
			if (data.HasRows) {
				while (data.Read()) {
					posts.Add(data["month"].ToString(), Convert.ToInt32(data["reads"].ToString()));
				}
			}

			conn.Close();

			return posts;
		}

		public PostRecommendation castDto(SqlDataReader data) {
			PostRecommendation t = new PostRecommendation(new PostDao().castDto(data));
			t.views = Convert.ToInt32(data["views"]);
			t.finished = Convert.ToInt32(data["finished"]);
			t.qualification = Convert.ToInt32(data["qualification"]);

			return t;
		}
	}
}
