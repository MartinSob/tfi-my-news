﻿using BusinessEntity;
using Persistence.Bussiness;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace BusinessLogic
{
	public class PostBl
	{
		PostDao dao = new PostDao();

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

		public List<Post> getRecommendations() {
			return dao.getRecommendations();
		}
	}
}
