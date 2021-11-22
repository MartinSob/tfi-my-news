using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Persistence
{
	public class PostRecommendationDao : ConnectionDao
	{
		PostDao pDao = new PostDao();

		public List<PostRecommendation> get(User user, DateTime dateFrom) {
			try {
				string consultaSQL = "SELECT * FROM posts p WHERE p.deleted = 0 AND p.date >= @dateFrom ";
				SqlCommand query = new SqlCommand(consultaSQL, conn);
				query.Parameters.AddWithValue("@dateFrom", dateFrom);

				List<PostRecommendation> posts = new List<PostRecommendation>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						posts.Add(castDto(data));
					}
				}

				conn.Close();

				foreach (Post post in posts) {
					SqlCommand queryTags = new SqlCommand("SELECT t.* FROM tags t JOIN post_tags pt ON pt.tag_id = t.id WHERE pt.post_id = @id", conn);
					queryTags.Parameters.AddWithValue("@id", post.id);

					conn.Open();
					SqlDataReader dataTags = queryTags.ExecuteReader();

					if (dataTags.HasRows) {
						while (dataTags.Read()) {
							post.tags.Add(new TagDao().castDto(dataTags));
						}
					}

					conn.Close();

					pDao.getImage(post);
				}

				return posts;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

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
					posts.Add(data["month"].ToString().ToLower(), Convert.ToInt32(data["finished"].ToString()));
				}
			}

			conn.Close();

			return posts;
		}

		public PostRecommendation castDto(SqlDataReader data) {
			PostRecommendation t = new PostRecommendation(pDao.castDto(data));

			try {
				t.employee = new EmployeeDao().castDto(data);
			} catch (Exception e) {
				Console.WriteLine(e);
			}

			try {
				t.views = Convert.ToInt32(data["views"]);
			} catch (Exception e) {
				Console.WriteLine(e);
				t.views = 0;
			}
			try {
				t.finished = Convert.ToInt32(data["finished"]);
			} catch (Exception e) {
				Console.WriteLine(e);
				t.finished = 0;
			}
			try {
				t.qualification = Convert.ToInt32(data["qualification"]);
			} catch (Exception e) {
				Console.WriteLine(e);
				t.qualification = 0;
			}

			return t;
		}
	}
}
