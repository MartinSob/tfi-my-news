using BusinessEntity;
using Persistence.Bussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace BusinessLogic
{
	public class PostBl
	{
		PostDao dao = new PostDao();

		public Post create(Post post) {
			post.paragraphs = Regex.Matches(post.body, "[^\r\n]+((\r|\n|\r\n)[^\r\n]+)*").Count;
			post.words = countWords(post.body);

			dao.create(post);
			return post;
		}

		public bool delete(int id) {
			return dao.delete(id);
		}

		public List<Post> get(string name = null) {
			return dao.get(name);
		}

		public Post get(int id) {
			return dao.get(id);
		}

		public void update(Post post) {
			post.paragraphs = Regex.Matches(post.body, "[^\r\n]+((\r|\n|\r\n)[^\r\n]+)*").Count;
			post.words = countWords(post.body);

			dao.update(post);
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
	}
}
