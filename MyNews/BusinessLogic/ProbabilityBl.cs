using BusinessEntity;
using Persistence;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace BusinessLogic
{
	public class ProbabilityBl
	{
		ProbabilityDao dao = new ProbabilityDao();

		/// <summary>
		/// Calculates the probability of succes of a given Post
		/// </summary>
		/// <param name="post"></param>
		/// <returns></returns>
		public Probability calculate(Post post) {
			post.paragraphs = Regex.Matches(post.body, "[^\r\n]+((\r|\n|\r\n)[^\r\n]+)*").Count;
			post.words = new PostBl().countWords(post.body);

			Probability probability = new Probability();

			double recommendedWords = 0;
			double recommendedParagraphs = 0;

			foreach (Tag tag in post.tags) {
				probability.probOpen += dao.getOpen(tag);
				probability.probRead += dao.getRead(tag);

				var postivePosts = dao.getPositivePosts(tag);
				recommendedWords += calculateAvgWords(postivePosts);
				recommendedParagraphs += calculateAvgParagrphs(postivePosts);
			}

			// Get the total of open and read tags
			double totalOpen = dao.getTotalOpen();
			double totalRead = dao.getTotalRead();

			// Average of words and paragraphs in the most liked posts of each of the tags
			recommendedWords = recommendedWords / post.tags.Count;
			recommendedParagraphs = recommendedParagraphs / post.tags.Count;

			// How many of the total opened/read have the selected tags
			probability.probOpen = probability.probOpen / totalOpen;
			probability.probRead = probability.probRead / totalRead;

			// Difference between the length the of the post and the average of words and paragraphs in the most liked posts of each of the tags
			probability.probParagraph = post.paragraphs > recommendedParagraphs ? recommendedParagraphs / post.paragraphs : post.paragraphs / recommendedParagraphs;
			probability.probWords = post.words > recommendedWords ? recommendedWords / post.words : post.words / recommendedWords;

			if (probability.probOpen * 100 < 60)
				probability.recommendations.Add("tag_low_open_probability");

			if (probability.probRead * 100 < 60)
				probability.recommendations.Add("tag_low_read_probability");

			if (probability.probParagraph * 100 < 60) {
				if (post.paragraphs > recommendedParagraphs) {
					probability.recommendations.Add("too_long_paragraphs_probability");
				} else {
					probability.recommendations.Add("too_short_paragraphs_probability");
				}
			}

			if (probability.probWords * 100 < 60) {
				if (post.words > recommendedWords) {
					probability.recommendations.Add("too_many_words_probability");
				} else {
					probability.recommendations.Add("too_few_words_probability");
				}
			}

			return calculateValue(probability);
		}

		double calculateAvgWords(List<Post> posts) {
			int count = 0;
			double total = 0;

			foreach (Post p in posts) {
				total += p.words;
				count++;
			}

			return total / count;
		}

		double calculateAvgParagrphs(List<Post> posts) {
			int count = 0;
			double total = 0;

			foreach (Post p in posts) {
				total += p.paragraphs;
				count++;
			}

			return total / count;
		}

		Probability calculateValue(Probability probability) {
			// Multiply by 25 so the Sum of all perfect values would be 100%
			probability.value = Convert.ToInt32(probability.probOpen * 25 + probability.probRead * 25 + probability.probParagraph * 25 + probability.probWords * 25);

			return probability;
		}
	}
}
