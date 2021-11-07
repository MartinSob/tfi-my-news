using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence
{
	public class ProbabilityDao : ConnectionDao
	{
		public int getOpen(Tag tag) {
			try {
				string consultaSQL = "SELECT SUM(ut.views) as count FROM user_tags ut JOIN tags t ON t.id = ut.tag_id WHERE t.deleted = 0 AND t.id = @tagId";

				SqlCommand query = new SqlCommand(consultaSQL, conn);
				query.Parameters.AddWithValue("@id", tag.id);

				int result = 0;
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						result = Convert.ToInt32(data["count"]);
					}
				}

				conn.Close();

				return result;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return 0;
			}
		}

		public int getRead(Tag tag) {
			try {
				string consultaSQL = "SELECT SUM(ut.finished) as count FROM user_tags ut JOIN tags t ON t.id = ut.tag_id WHERE t.deleted = 0 AND t.id = @tagId";

				SqlCommand query = new SqlCommand(consultaSQL, conn);
				query.Parameters.AddWithValue("@id", tag.id);

				int result = 0;
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						result = Convert.ToInt32(data["count"]);
					}
				}

				conn.Close();

				return result;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return 0;
			}
		}

		public int getTotalOpen() {
			try {
				string consultaSQL = "SELECT SUM(ut.views) as count FROM user_tags ut JOIN tags t ON t.id = ut.tag_id WHERE t.deleted = 0 ";

				SqlCommand query = new SqlCommand(consultaSQL, conn);

				int result = 0;
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						result = Convert.ToInt32(data["count"]);
					}
				}

				conn.Close();

				return result;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return 0;
			}
		}

		public int getTotalRead() {
			try {
				string consultaSQL = "SELECT SUM(ut.finished) as count FROM user_tags ut JOIN tags t ON t.id = ut.tag_id WHERE t.deleted = 0 ";

				SqlCommand query = new SqlCommand(consultaSQL, conn);

				int result = 0;
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						result = Convert.ToInt32(data["count"]);
					}
				}

				conn.Close();

				return result;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return 0;
			}
		}

		public List<Post> getPositivePosts(Tag tag) {
			try {
				string consultaSQL = "";

				SqlCommand query = new SqlCommand(consultaSQL, conn);
				query.Parameters.AddWithValue("@id", tag.id);

				List<Post> posts = new List<Post>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						posts.Add(new PostDao().castDto(data));
					}
				}

				conn.Close();

				return posts;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}
	}
}
