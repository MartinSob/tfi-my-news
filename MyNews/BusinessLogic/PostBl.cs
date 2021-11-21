using BusinessEntity;
using Persistence;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace BusinessLogic
{
	public class PostBl
	{
		PostDao dao = new PostDao();
		TagDao tDao = new TagDao();
		TagRecommendationDao trDao = new TagRecommendationDao();

		public Post create(Post post) {
			post.paragraphs = Regex.Matches(post.body, "[^\r\n]+((\r|\n|\r\n)[^\r\n]+)*").Count;
			post.words = countWords(post.body);

			dao.create(post);

			try {
				post.image = post.image.Split(',')[1];
				byte[] bytes = Convert.FromBase64String(post.image);
				dao.updateImage(bytes, post);
			} catch (Exception e) {
				Console.WriteLine(e);
			}

			return post;
		}

		public bool delete(int id) {
			return dao.delete(id);
		}

		public List<Post> get(int employeeId, string name = null, bool all = false) {
			return dao.get(employeeId, name, all);
		}

		/// <summary>
		/// Returns both the data of the post and the Tags associated.
		/// </summary>
		/// <param name="id">The ID of the post</param>
		/// <returns></returns>
		public Post get(int id) {
			return dao.get(id);
		}

		public UserView getUserView(Post post, User user) {
			return dao.getUserView(post, user);
		}

		public void update(Post post) {
			post.paragraphs = Regex.Matches(post.body, "[^\r\n]+((\r|\n|\r\n)[^\r\n]+)*").Count;
			post.words = countWords(post.body);

			dao.update(post);

			try {
				post.image = post.image.Split(',')[1];
				byte[] bytes = Convert.FromBase64String(post.image);
				dao.updateImage(bytes, post);
			} catch (Exception e) {
				Console.WriteLine(e);
			}
		}

		public int countWords(string text) {
			int wordCount = 0, index = 0;

			// skip whitespace until first word
			while (index < text.Length && char.IsWhiteSpace(text[index]))
				index++;

			while (index < text.Length) {
				// check if current char is part of a word
				while (index < text.Length && !char.IsWhiteSpace(text[index]))
					index++;

				wordCount++;

				// skip whitespace until next word
				while (index < text.Length && char.IsWhiteSpace(text[index]))
					index++;
			}

			return wordCount;
		}

		public void addLike(Post post, User user, int qualification) {
			try {
				addRead(post, user);
				dao.addReview(post, user, qualification);

				foreach (Tag tag in tDao.get(post)) {
					TagRecommendation tagRecommendation = trDao.get(user, tag);
					tagRecommendation.qualification += qualification;

					tDao.addReview(tagRecommendation, user);
				}
			} catch (Exception e) {
				Console.WriteLine(e);
			}
		}

		public void addOpen(Post post, User user) {
			dao.addOpen(post, user);

			foreach(Tag tag in tDao.get(post)) {
				TagRecommendation tagRecommendation = trDao.get(user, tag);

				if (tagRecommendation != null) {
					tagRecommendation.views++;
				}

				tDao.addOpen(tagRecommendation, user);
			}
		}

		public void addRead(Post post, User user) {
			dao.addRead(post, user);

			foreach(Tag tag in tDao.get(post)) {
				TagRecommendation tagRecommendation = trDao.get(user, tag);
				tagRecommendation.finished++;

				tDao.addRead(tagRecommendation, user);
			}
		}
	}
}
