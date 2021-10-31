﻿using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Persistence
{
	public class TagDao : ConnectionDao
	{
		public Tag create(Tag tag) {
			tag.id = insert("tags", new string[] { "name", "color" }, new string[] { tag.name, tag.color });
			return tag;
		}

		public bool delete(int id) {
			return logicDeleteById("tags", id);
		}

		public List<Tag> get(string name = null) {
			try {
				string consultaSQL = "SELECT * FROM tags t WHERE deleted = 0";
				if (name != null) {
					consultaSQL += $" AND t.name LIKE '%{name}%'";
				}

				SqlCommand query = new SqlCommand(consultaSQL, conn);

				List<Tag> tags = new List<Tag>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						tags.Add(castDto(data));
					}
				}

				conn.Close();

				return tags;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public Tag get(int id) {
			try {
				SqlCommand query = new SqlCommand("SELECT * FROM tags t WHERE deleted = 0 AND id = @id", conn);
				query.Parameters.AddWithValue("@id", id);

				Tag tag = new Tag();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						tag = castDto(data);
					}
				}

				conn.Close();

				return tag;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public void update(Tag tag) {
			update("tags", new string[] { "name", "color" }, new string[] { tag.name, tag.color }, new string[] { "id" }, new string[] { tag.id.ToString() });
		}

		public List<Tag> get(Post post) {
			try {
				string consultaSQL = "SELECT * FROM tags t JOIN post_tags pt ON pt.tag_id = t.id WHERE t.deleted = 0 AND pt.post_id = @postId";

				SqlCommand query = new SqlCommand(consultaSQL, conn);
				query.Parameters.AddWithValue("@postId", post.id);

				List<Tag> tags = new List<Tag>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						tags.Add(castDto(data));
					}
				}

				conn.Close();

				return tags;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		List<TagRecommendation> getRecommendations(User user, PostRecommendation post) {
			// TODO

			return new List<TagRecommendation>();
		}

		public TagRecommendation getRecommendation(User user, Tag tag) {
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
				tagRecommendation = castRecommendationDto(data);
			}
			conn.Close();

			return tagRecommendation;
		}

		List<Tag> getPopulars() {
			// TODO

			return new List<Tag>();
		}

		int getReads(Tag tag) {
			// TODO

			return 1;
		}

		public void addOpen(Tag tag, User user) {
			TagRecommendation tagRecommendation = getRecommendation(user, tag);

			if (tagRecommendation == null) {
				insert("user_tags", 
					new string[] { "user_id", "tag_id", "updated_date", }, 
					new string[] { user.id.ToString(), tag.id.ToString(), DateTime.Now.ToString() });
				return;
			}

			tagRecommendation.views++;
			var columns = new string[] { "updated_date", "views" };
			var values = new string[] { DateTime.Now.ToString(), tagRecommendation.views.ToString() };
			var whereColumns = new string[] { "user_id", "tag_id" };
			var whereValues = new string[] { user.id.ToString(), tag.id.ToString() };
			update("user_tags", columns, values, whereColumns, whereValues);
		}

		public void addRead(Tag tag, User user) {
			TagRecommendation tagRecommendation = getRecommendation(user, tag);
			tagRecommendation.finished++;

			var columns = new string[] { "updated_date", "finished" };
			var values = new string[] { DateTime.Now.ToString(), tagRecommendation.finished.ToString() };
			var whereColumns = new string[] { "user_id", "tag_id" };
			var whereValues = new string[] { user.id.ToString(), tag.id.ToString() };
			update("user_tags", columns, values, whereColumns, whereValues);
		}

		public void addReview(Tag tag, User user, int qualification) {
			TagRecommendation tagRecommendation = getRecommendation(user, tag);
			tagRecommendation.qualification += qualification;

			var columns = new string[] { "updated_date", "qualification" };
			var values = new string[] { DateTime.Now.ToString(), tagRecommendation.qualification.ToString() };
			var whereColumns = new string[] { "user_id", "tag_id" };
			var whereValues = new string[] { user.id.ToString(), tag.id.ToString() };
			update("user_tags", columns, values, whereColumns, whereValues);
		}

		public Tag castDto(SqlDataReader data) {
			Tag result = new Tag();
			result.id = Convert.ToInt32(data["id"]);
			result.name = data["name"].ToString();
			result.color = data["color"].ToString();

			return result;
		}

		public TagRecommendation castRecommendationDto(SqlDataReader data) {
			TagRecommendation t = new TagRecommendation(castDto(data));
			t.views = Convert.ToInt32(data["views"]);
			t.finished = Convert.ToInt32(data["finished"]);
			t.qualification = Convert.ToInt32(data["qualification"]);
			
			return t;
		}
	}
}
