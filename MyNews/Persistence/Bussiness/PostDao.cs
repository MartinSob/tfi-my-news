﻿using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Bussiness
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

		public void deleteTags(Post post) {
			SqlCommand query = new SqlCommand("DELETE FROM post_tags WHERE post_id = @id", conn);
			query.Parameters.AddWithValue("@id", post.id);
			executeQuery(query);
		}

		public int getReads(Post post) {
			return 1;
		}

		public List<Post> get(int employeeId, string name = null, bool all = false) {
			try {
				string consultaSQL = "SELECT * FROM posts p WHERE p.deleted = 0 ";
				if (name != null) {
					consultaSQL += $" AND p.title LIKE '%{name}%' ";
				}
				if (!all) {
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

				SqlCommand queryTags = new SqlCommand("SELECT * FROM post_tags pt WHERE pt.post_id = @id", conn);
				queryTags.Parameters.AddWithValue("@id", id);

				conn.Open();
				SqlDataReader dataTags = queryTags.ExecuteReader();

				if (dataTags.HasRows) {
					while (dataTags.Read()) {
						post.tags.Add(new Tag {
							id = Convert.ToInt32(dataTags["tag_id"])
						});
					}
				}

				conn.Close();

				return post;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		List<Post> get(Employee employee) {
			// TODO

			return new List<Post>();
		}

		Dictionary<string, int> getReadsGroupByMonth() {
			// TODO

			return new Dictionary<string, int>();
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

		List<PostRecommendation> getRecommendations(int days) {
			// TODO

			return new List<PostRecommendation>();
		}

		void addRead(Post post, User user) {
			// TODO
		}

		void addView(User user, Tag tag) {
			// TODO
		}

		void addReview(Post post, bool positive) {
			// TODO
		}

		void addView(Post post, User user) {
			// TODO
		}

		void addRead(User user, Tag tag) {
			// TODO
		}

		void addReview(User user, Tag tag, bool positive) {
			// TODO
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
	}
}
