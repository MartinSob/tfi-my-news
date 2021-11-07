using BusinessEntity;
using Persistence;
using System.Collections.Generic;

namespace BusinessLogic
{
	public class ProbabilityBl
	{
		ProbabilityDao dao = new ProbabilityDao();

		public Probability calculate(Post post) {
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
			// Make the values a percentage
			probability.probOpen *= 100;
			probability.probRead *= 100;
			probability.probParagraph *= 100;
			probability.probWords *= 100;

			if (probability.probOpen < 60)
				probability.recommendations.Add("low_open_probability");

			if (probability.probRead < 60)
				probability.recommendations.Add("low_read_probability");

			if (probability.probParagraph < 60)
				probability.recommendations.Add("low_paragraphs_probability");

			if (probability.probWords < 60)
				probability.recommendations.Add("low_words_probability");

			// Multiply by 25 so the Sum of all perfect values is 100%
			probability.value = (int)(probability.probOpen * 25 + probability.probRead * 25 + probability.probParagraph * 25 + probability.probWords * 25);

			return probability;
		}
	}
}
