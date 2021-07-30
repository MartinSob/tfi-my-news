using Protoype.Crear_Noticia;
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

		public Probability calculate(string title, List<string> tags, string body) {
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

			var prob = new Probability() {
				open = (totalOpen / totalPostsOpen),
				read = (totalRead / totalPostsRead),
				words = calculatePercentageDiff(bodyLength, totalAvgWords),
				paragraphs = calculatePercentageDiff(paragraphsCount, avgParagraphs),
			};

			prob.calculateValue();
			prob.calculateRecommendations();
			
			if (prob.value < 0)
				prob.value = 0;

			return prob;
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
