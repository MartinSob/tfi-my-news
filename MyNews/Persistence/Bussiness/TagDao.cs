using BusinessEntity;
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
				// TODO fix query
				string consultaSQL = "SELECT * FROM tags t WHERE deleted = 0";

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

		List<TagRecommendation> getRecommendations(User user, PostRecommendation post) {
			// TODO

			return new List<TagRecommendation>();
		}

		List<Tag> getPopulars() {
			// TODO

			return new List<Tag>();
		}

		int getReads(Tag tag) {
			// TODO

			return 1;
		}

		// TODO review
		public void addOpen(Tag tag, User user) {
			SqlCommand query = new SqlCommand("SELECT * FROM user_tags uv WHERE post_id = @tagId AND user_id = @userId ", conn);
			query.Parameters.AddWithValue("@tagId", tag.id);
			query.Parameters.AddWithValue("@userId", user.id);

			conn.Open();
			SqlDataReader data = query.ExecuteReader();
			if (data.HasRows) {
				conn.Close();
				return;
			}

			conn.Close();

			var columns = new string[] { "user_id", "tag_id", "date", };
			var values = new string[] { user.id.ToString(), tag.id.ToString(), DateTime.Now.ToString() };
			insert("user_tags", columns, values);
		}

		public void addRead(Tag tag, User user) {
			var columns = new string[] { "date", "finished" };
			var values = new string[] { DateTime.Now.ToString(), 1.ToString() };
			var whereColumns = new string[] { "user_id", "tag_id" };
			var whereValues = new string[] { user.id.ToString(), tag.id.ToString() };
			update("user_tags", columns, values, whereColumns, whereValues);
		}

		public void addReview(Tag tag, User user, int qualification) {
			var columns = new string[] { "date", "qualification" };
			var values = new string[] { DateTime.Now.ToString(), qualification.ToString() };
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
	}
}
