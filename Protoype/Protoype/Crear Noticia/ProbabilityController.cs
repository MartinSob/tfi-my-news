using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Protoype
{
	class ProbabilityController
	{
		double totalPostsOpen = 15;
		double totalPostsRead = 10;
		double avgParagraphs = 2;

		public double calculate(string title, List<string> tags, string body) {
			var sportTag = new { avgWords = 2.0, postsOpen = 2.0, postsRead = 1.0 };
			var econTag = new { avgWords = 5.0, postsOpen = 5.0, postsRead = 3.0 };
			var politTag = new { avgWords = 3.0, postsOpen = 3.0, postsRead = 2.0 };

			double totalAvgWords = 0;
			double totalOpen = 0;
			double totalRead = 0;

			foreach (string tag in tags) {
				if (tag == "Deportes") {
					totalAvgWords += sportTag.avgWords;
					totalOpen += sportTag.postsOpen;
					totalRead += sportTag.postsRead;
				}
				if (tag == "Economia") {
					totalAvgWords += econTag.avgWords;
					totalOpen += econTag.postsOpen;
					totalRead += econTag.postsRead;
				}
				if (tag == "Politica") {
					totalAvgWords += politTag.avgWords;
					totalOpen += politTag.postsOpen;
					totalRead += politTag.postsRead;
				}
			}

			totalAvgWords = totalAvgWords / tags.Count();

			double bodyLength = calculateBodyLenght(body);

			double paragraphsCount = body
				.Split(
					new[] { Environment.NewLine + Environment.NewLine },
					StringSplitOptions.RemoveEmptyEntries)
				.Count();

			double open = (totalOpen / totalPostsOpen) * 0.7;
			double read = (totalRead / totalPostsRead) * 0.8;
			double words = calculatePercentageDiff(bodyLength, totalAvgWords) * 0.3;
			double paragraphs = calculatePercentageDiff(paragraphsCount, avgParagraphs) * 0.4;

			double result = ( open + read - paragraphs - words) * 100;

			if (result < 0)
				result = 0;

			return result;
		}

		int calculateBodyLenght(string body) {
			char[] delimiters = new char[] { ' ', '\r', '\n' };
			return body.Split(delimiters, StringSplitOptions.RemoveEmptyEntries).Length;
		}

		double calculatePercentageDiff(double a, double b) {
			double num = System.Math.Abs(a - b);
			double den = (a + b) / 2;

			double result = num / den;
			return result;
		}
	}
}
