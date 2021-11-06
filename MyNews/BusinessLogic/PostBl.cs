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

		int countWords(string text) {
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

		public List<Post> getRecommendations(User user) {
			return dao.getRecommendations(user);
		}

		public void addLike(Post post, User user, int qualification) {
			try {
				addRead(post, user);
				dao.addReview(post, user, qualification);

				foreach (Tag tag in tDao.get(post)) {
					tDao.addReview(tag, user, qualification);
				}
			} catch (Exception e) {
				Console.WriteLine(e);
			}
		}

		public void addOpen(Post post, User user) {
			dao.addOpen(post, user);

			foreach(Tag tag in tDao.get(post)) {
				tDao.addOpen(tag, user);
			}
		}

		public void addRead(Post post, User user) {
			dao.addRead(post, user);

			foreach(Tag tag in tDao.get(post)) {
				tDao.addRead(tag, user);
			}
		}
	}
}
