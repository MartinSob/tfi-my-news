using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Persistence
{
	public class PostDao : ConnectionDao
	{
		public bool delete(int id) {
			return logicDeleteById("posts", id);
		}

		public Post create(Post post) {
			string[] columns = { "title", "body", "employee_id", "date", "paragraphs", "words" };
			string[] values = { post.title, post.body, post.employee.employeeId.ToString(), DateTime.Now.ToString(), post.paragraphs.ToString(), post.words.ToString() };
			post.id = insert("posts", columns, values);

			foreach (Tag tag in post.tags) {
				addTag(post, tag);
			}

			return post;
		}

		public void addTag(Post post, Tag tag) {
			string[] columns = { "post_id", "tag_id" };
			string[] values = { post.id.ToString(), tag.id.ToString() };
			insert("post_tags", columns, values);
		}

		public Post update(Post post) {
			string[] columns = { "title", "body", "paragraphs", "words" };
			string[] values = { post.title, post.body, post.paragraphs.ToString(), post.words.ToString() };
			update("posts", columns, values, new string[] { "id" }, new string[] { post.id.ToString() });

			deleteTags(post);
			foreach (Tag tag in post.tags) {
				addTag(post, tag);
			}

			return post;
		}

		public void updateImage(byte[] image, Post post) {
			SqlCommand command = new SqlCommand(
				"UPDATE posts SET image = @Photo WHERE id = @id", conn);

			command.Parameters.Add("@Photo",
				SqlDbType.Image, image.Length).Value = image;
			command.Parameters.AddWithValue("@id", post.id);

			executeQuery(command);
		}

		public void getImage(Post post) {
			try {
				SqlCommand command = new SqlCommand(
					"SELECT image FROM posts WHERE id = @id", conn);
				command.Parameters.AddWithValue("@id", post.id);

				MemoryStream stream = new MemoryStream();
				conn.Open();
				var result = command.ExecuteScalar();

				if (result is DBNull) {
					conn.Close();
					return;
				}

				byte[] image = (byte[])result;
				stream.Write(image, 0, image.Length);
				conn.Close();
				post.image = "data:image/jpeg;base64," + Convert.ToBase64String(image);
			} catch (Exception e) {
				Console.WriteLine(e);
			}
		}

		public void deleteTags(Post post) {
			SqlCommand query = new SqlCommand("DELETE FROM post_tags WHERE post_id = @id", conn);
			query.Parameters.AddWithValue("@id", post.id);
			executeQuery(query);
		}

		public List<Post> get(int employeeId = 0, string name = null) {
			try {
				string consultaSQL = "SELECT * FROM posts p WHERE p.deleted = 0 ";
				if (name != null) {
					consultaSQL += $" AND p.title LIKE '%{name}%' ";
				}
				if (employeeId != 0) {
					consultaSQL += $" AND p.employee_id = {employeeId} ";
				}

				SqlCommand query = new SqlCommand(consultaSQL, conn);

				List<Post> posts = new List<Post>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						posts.Add(castDto(data));
					}
				}

				conn.Close();

				foreach (Post post in posts) {
					SqlCommand queryTags = new SqlCommand("SELECT t.* FROM tags t JOIN post_tags pt ON pt.tag_id = t.id WHERE pt.post_id = @id AND t.deleted = 0 ", conn);
					queryTags.Parameters.AddWithValue("@id", post.id);

					conn.Open();
					SqlDataReader dataTags = queryTags.ExecuteReader();

					if (dataTags.HasRows) {
						while (dataTags.Read()) {
							post.tags.Add(new TagDao().castDto(dataTags));
						}
					}

					conn.Close();

					getImage(post);
				}

				return posts;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public List<Post> get(string text = null, DateTime? from = null, DateTime? to = null, int tagId = 0, int employeeId = 0) {
			try {
				SqlCommand query = new SqlCommand("GetPosts", conn);
				query.CommandType = CommandType.StoredProcedure;

				if (text != null) { 
					query.Parameters.Add(new SqlParameter {
						ParameterName = "@text",
						DbType = DbType.String,
						Value = text
					});
				}

				if (from != null) {
					query.Parameters.Add(new SqlParameter {
						ParameterName = "@from",
						DbType = DbType.DateTime,
						Value = from
					});
				}
				
				if (to != null) {
					query.Parameters.Add(new SqlParameter {
						ParameterName = "@to",
						DbType = DbType.DateTime,
						Value = to
					});
				}

				if (tagId != 0) {
					query.Parameters.Add(new SqlParameter {
						ParameterName = "@tagId",
						DbType = DbType.Int32,
						Value = tagId
					});
				}

				if (employeeId != 0) {
					query.Parameters.Add(new SqlParameter {
						ParameterName = "@employeeId",
						DbType = DbType.Int32,
						Value = employeeId
					});
				}

				List<Post> posts = new List<Post>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						posts.Add(castDto(data));
					}
				}

				conn.Close();

				foreach (Post post in posts) {
					SqlCommand queryTags = new SqlCommand("SELECT t.* FROM tags t JOIN post_tags pt ON pt.tag_id = t.id WHERE pt.post_id = @id AND t.deleted = 0 ", conn);
					queryTags.Parameters.AddWithValue("@id", post.id);

					conn.Open();
					SqlDataReader dataTags = queryTags.ExecuteReader();

					if (dataTags.HasRows) {
						while (dataTags.Read()) {
							post.tags.Add(new TagDao().castDto(dataTags));
						}
					}

					conn.Close();

					getImage(post);
				}

				return posts;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public Post get(int id) {
			try {
				SqlCommand query = new SqlCommand("SELECT * FROM posts p WHERE p.deleted = 0 AND p.id = @id", conn);
				query.Parameters.AddWithValue("@id", id);

				Post post = new Post();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						post = castDto(data);
					}
				}

				conn.Close();

				SqlCommand queryTags = new SqlCommand("SELECT t.* FROM tags t JOIN post_tags pt ON pt.tag_id = t.id WHERE pt.post_id = @id AND t.deleted = 0 ", conn);
				queryTags.Parameters.AddWithValue("@id", id);

				conn.Open();
				SqlDataReader dataTags = queryTags.ExecuteReader();

				if (dataTags.HasRows) {
					while (dataTags.Read()) {
						post.tags.Add(new TagDao().castDto(dataTags));
					}
				}

				conn.Close();

				getImage(post);

				return post;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		Dictionary<string, int> getReadsGroupByMonth() {
			// TODO

			return new Dictionary<string, int>();
		}

		public int getReads(Post post) {
			return 1;
		}

		List<Post> getBad() {
			// TODO

			return new List<Post>();
		}

		List<Post> getGood() {
			// TODO

			return new List<Post>();
		}

		List<Post> get(Tag tag) {
			// TODO

			return new List<Post>();
		}

		public UserView getUserView(Post post, User user) {
			try {
				SqlCommand query = new SqlCommand("SELECT p.*, uv.qualification FROM posts p JOIN user_posts uv ON uv.post_id = p.id AND uv.user_id = @userId WHERE p.deleted = 0 AND p.id = @postId", conn);
				query.Parameters.AddWithValue("@userId", user.id);
				query.Parameters.AddWithValue("@postId", post.id);

				UserView userView = new UserView();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						userView = new UserView {
							user = user,
							post = castDto(data),
							qualification = Convert.ToInt32(data["qualification"])
						};
					}
				}

				conn.Close();

				SqlCommand queryTags = new SqlCommand("SELECT t.* FROM tags t JOIN post_tags pt ON pt.tag_id = t.id WHERE pt.post_id = @id AND t.deleted = 0 ", conn);
				queryTags.Parameters.AddWithValue("@id", post.id);

				conn.Open();
				SqlDataReader dataTags = queryTags.ExecuteReader();

				if (dataTags.HasRows) {
					while (dataTags.Read()) {
						userView.post.tags.Add(new TagDao().castDto(dataTags));
					}
				}

				conn.Close();

				getImage(userView.post);

				return userView;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public void addOpen(Post post, User user) {
			SqlCommand query = new SqlCommand("SELECT * FROM user_posts uv WHERE post_id = @postId AND user_id = @userId ", conn);
			query.Parameters.AddWithValue("@postId", post.id);
			query.Parameters.AddWithValue("@userId", user.id);

			conn.Open();
			SqlDataReader data = query.ExecuteReader();
			if (data.HasRows) {
				conn.Close();
				return;
			}

			conn.Close();

			var columns = new string[] { "user_id", "post_id", "date", };
			var values = new string[] { user.id.ToString(), post.id.ToString(), DateTime.Now.ToString() };
			insert("user_posts", columns, values);
		}

		public void addRead(Post post, User user) {
			var columns = new string[] { "date", "finished" };
			var values = new string[] { DateTime.Now.ToString(), 1.ToString() };
			var whereColumns = new string[] { "user_id", "post_id" };
			var whereValues = new string[] { user.id.ToString(), post.id.ToString() };
			update("user_posts", columns, values, whereColumns, whereValues);
		}

		public void addReview(Post post, User user, int qualification) {
			var columns = new string[] { "date", "qualification" };
			var values = new string[] { DateTime.Now.ToString(), qualification.ToString() };
			var whereColumns = new string[] { "user_id", "post_id" };
			var whereValues = new string[] { user.id.ToString(), post.id.ToString() };
			update("user_posts", columns, values, whereColumns, whereValues);
		}

		public Post castDto(SqlDataReader data) {
			Post result = new Post();
			result.id = Convert.ToInt32(data["id"]);
			result.title = data["title"].ToString();
			result.body = data["body"].ToString();
			result.employee = new Employee {
				employeeId = Convert.ToInt32(data["employee_id"])
			};
			result.date = Convert.ToDateTime(data["date"].ToString());
			result.paragraphs = Convert.ToInt32(data["paragraphs"]);
			result.words = Convert.ToInt32(data["words"]);

			return result;
		}

		public Post castRecommendationDto(SqlDataReader data) {
			Post result = new Post();
			result.id = Convert.ToInt32(data["id"]);
			result.title = data["title"].ToString();
			result.body = data["body"].ToString();
			result.employee = new Employee {
				employeeId = Convert.ToInt32(data["employee_id"])
			};
			result.date = Convert.ToDateTime(data["date"].ToString());
			result.paragraphs = Convert.ToInt32(data["paragraphs"]);
			result.words = Convert.ToInt32(data["words"]);

			return result;
		}
	}
}
