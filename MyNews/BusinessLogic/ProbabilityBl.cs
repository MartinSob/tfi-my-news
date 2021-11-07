using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
	public class ProbabilityBl
	{
		public double calculate(Post post) {
			Probability probability = new Probability();
			/*
			 * Loop por cada tag
			 * 
			 *		getPositivePosts(tag) : List<Post>
			 *		Loop por cada post
			 *			calculateAvgWords(post, probability) : Probability
			 *		getOpen(tag) : int
			 *		getRead(tag) : int
			 * 
			 * getTotalOpen(tag) : int
			 * getTotalRead(tag) : int
			 * 
			 * calculateValue(Probability) : Probability
			 */

			return 0;
		}

		Probability calculateAvgWords(Post post, Probability probability) {
			return new Probability();
		}

		Probability calculateValue(Probability probability) {
			return new Probability();
		}
	}
}
