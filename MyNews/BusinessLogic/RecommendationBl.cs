using BusinessEntity;
using Persistence;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
	public class RecommendationBl
	{
		PostDao pDao = new PostDao();
		TagDao tDao = new TagDao();
		EmployeeDao wDao = new EmployeeDao();

		public List<PostRecommendation> get(User user, int count) {
			return new List<PostRecommendation>();

			/*
			 * postDao.getRecommendations(days) : List<PostRecommendation>
			 * 
			 * Loop por cada nota
			 *		writerDao.getRecommendations(user, post): WriterRecommendation
			 *		tagDao.getRecommendations(user, post) : TagRecommendation
			 *		calculateEmployeeValue(EmployeeRecommendation) : EmployeeRecommendation
			 *		
			 *		Loop por cada tag de la nota:
			 *			calculateTagValue()
			 *		
			 *		calculatePostValue
			 *	
			 *	orderRecommendations(List<PostRecommendation>, int)
			 */
		}

		EmployeeRecommendation calculateEmployeeValue(EmployeeRecommendation employee) {
			return new EmployeeRecommendation();
		}

		TagRecommendation calculateTagValue(TagRecommendation tag) {
			return new TagRecommendation();
		}

		PostRecommendation calculatePostValue(PostRecommendation post) {
			return new PostRecommendation();
		}

		List<PostRecommendation> orderRecommendations(List<PostRecommendation> posts, int count) {
			return new List<PostRecommendation>();
		}
	}
}
