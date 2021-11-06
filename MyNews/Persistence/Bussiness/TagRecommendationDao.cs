﻿using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence
{
	public class TagRecommendationDao : ConnectionDao
	{
		List<TagRecommendation> get(User user, PostRecommendation post) {
			// TODO

			return new List<TagRecommendation>();
		}

		public TagRecommendation get(User user, Tag tag) {
			SqlCommand query = new SqlCommand("SELECT * FROM tags t JOIN user_tags ut ON ut.tag_id = t.id WHERE tag_id = @tagId AND user_id = @userId ", conn);
			query.Parameters.AddWithValue("@tagId", tag.id);
			query.Parameters.AddWithValue("@userId", user.id);

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
		}

		public TagRecommendation castDto(SqlDataReader data) {
			TagRecommendation t = new TagRecommendation(castDto(data));
			t.views = Convert.ToInt32(data["views"]);
			t.finished = Convert.ToInt32(data["finished"]);
			t.qualification = Convert.ToInt32(data["qualification"]);

			return t;
		}
	}
}
