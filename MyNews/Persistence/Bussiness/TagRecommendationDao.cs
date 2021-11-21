using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Persistence
{
	public class TagRecommendationDao : ConnectionDao
	{
		List<TagRecommendation> get(User user, PostRecommendation post) {
			// TODO

			return new List<TagRecommendation>();
		}

		public List<TagRecommendation> getPopulars() {
			try {
				SqlCommand query = new SqlCommand("GetPopularTags", conn);
				query.CommandType = CommandType.StoredProcedure;

				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				List<TagRecommendation> tags = new List<TagRecommendation>();
				if (data.HasRows) {
					while (data.Read()) {
						tags.Add(castDto(data));
					}
				}

				conn.Close();

				return tags;
			} catch (Exception e) {
				Console.WriteLine(e);
				return null;
			}
		}

		public TagRecommendation get(User user, Tag tag) {
			try {
				SqlCommand query = new SqlCommand("GetTagRecommendationForUser", conn);
				query.CommandType = CommandType.StoredProcedure;

				query.Parameters.Add(new SqlParameter {
					ParameterName = "@userId",
					DbType = DbType.Int32,
					Value = user.id
				});

				query.Parameters.Add(new SqlParameter {
					ParameterName = "@tagId",
					DbType = DbType.Int32,
					Value = tag.id
				});

				TagRecommendation tagRecommendation = new TagRecommendation();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();
				if (!data.HasRows) {
					conn.Close();
					return null;
				}

				while (data.Read()) {
					tagRecommendation = castDto(data);
				}
				conn.Close();

				return tagRecommendation;
			} catch (Exception e) {
				Console.WriteLine(e);
				return null;
			}
		}

		public TagRecommendation castDto(SqlDataReader data) {
			TagRecommendation t = new TagRecommendation(new TagDao().castDto(data));
			t.views = data["views"] != null ? Convert.ToInt32(data["views"]) : 0;
			t.finished = data["finished"] != null ? Convert.ToInt32(data["finished"]) : 0;
			t.qualification = data["qualification"] != null ? Convert.ToInt32(data["qualification"]) : 0;

			return t;
		}
	}
}
