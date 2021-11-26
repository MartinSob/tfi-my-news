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
		/// Calculates the probability of success of a given Post, returning a value and a list of reasons for that value.
		/// </summary>
		/// <param name="post"></param>
		/// <returns> Probability </returns>
		public Probability calculate(Post post) {
			post.paragraphs = Regex.Matches(post.body, "[^\r\n]+((\r|\n|\r\n)[^\r\n]+)*").Count;
			post.words = new PostBl().countWords(post.body);

			Probability probability = new Probability();

			double recommendedWords = 0;
			double recommendedParagraphs = 0;
			double recommendedTitle = 0;

			foreach (Tag tag in post.tags) {
				probability.probOpen += dao.getOpen(tag);
				probability.probRead += dao.getRead(tag);

				var postivePosts = dao.getPositivePosts(tag);
				recommendedWords += calculateAvgWords(postivePosts);
				recommendedParagraphs += calculateAvgParagrphs(postivePosts);
				recommendedTitle += calculateAvgTitle(postivePosts);
			}

			// Get the total of open and read tags
			double totalOpen = dao.getTotalOpen();
			double totalRead = dao.getTotalRead();

			// Average of words, paragraphs and title length in the most liked posts of each of the tags
			recommendedWords = recommendedWords / post.tags.Count;
			recommendedParagraphs = recommendedParagraphs / post.tags.Count;
			recommendedTitle = recommendedTitle / post.tags.Count;

			// How many of the total opened/read have the selected tags
			probability.probOpen = probability.probOpen / totalOpen;
			probability.probRead = probability.probRead / totalRead;

			// Difference between the length the of the post and the average of words, paragraphs and title in the most liked posts of each of the tags
			probability.probParagraph = post.paragraphs > recommendedParagraphs ? recommendedParagraphs / post.paragraphs : post.paragraphs / recommendedParagraphs;
			probability.probWords = post.words > recommendedWords ? recommendedWords / post.words : post.words / recommendedWords;
			probability.probTitle = post.title.Length > recommendedTitle ? recommendedTitle / post.title.Length : post.title.Length / recommendedTitle;

			// Add recommendations based on each probability
			if (probability.probOpen * 100 < 60)
				probability.recommendations.Add("error.tag_low_open_probability");

			if (probability.probOpen * 100 > 80)
				probability.recommendations.Add("success.tag_high_open_probability");

			if (probability.probRead * 100 < 60)
				probability.recommendations.Add("error.tag_low_read_probability");

			if (probability.probRead * 100 > 80)
				probability.recommendations.Add("success.tag_high_read_probability");

			if (probability.probParagraph * 100 < 60) {
				if (post.paragraphs > recommendedParagraphs) {
					probability.recommendations.Add("error.too_many_paragraphs");
				} else {
					probability.recommendations.Add("error.too_few_paragraphs");
				}
			}

			if (probability.probParagraph * 100 > 80)
				probability.recommendations.Add("success.good_count_paragraphs");

			if (probability.probWords * 100 < 60) {
				if (post.words > recommendedWords) {
					probability.recommendations.Add("error.too_many_words");
				} else {
					probability.recommendations.Add("error.too_few_words");
				}
			}

			if (probability.probWords * 100 > 80)
				probability.recommendations.Add("success.good_count_words");

			if (probability.probTitle * 100 < 60) {
				if (post.title.Length > recommendedTitle) {
					probability.recommendations.Add("error.too_long_title");
				} else {
					probability.recommendations.Add("error.too_short_title");
				}
			}

			if (probability.probTitle * 100 > 80)
				probability.recommendations.Add("success.good_title_length");

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

		double calculateAvgTitle(List<Post> posts) {
			int count = 0;
			double total = 0;

			foreach (Post p in posts) {
				total += p.title.Length;
				count++;
			}

			return total / count;
		}

		Probability calculateValue(Probability probability) {
			// Multiply by 20 so the Sum of all perfect values would be 100%
			probability.value = Convert.ToInt32(probability.probOpen * 20 + probability.probTitle * 20 + probability.probRead * 20 + probability.probParagraph * 20 + probability.probWords * 20);

			return probability;
		}
	}
}
