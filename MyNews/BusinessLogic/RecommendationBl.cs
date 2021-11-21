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
		PostRecommendationDao pRDao = new PostRecommendationDao();
		PostDao pDao = new PostDao();
		TagRecommendationDao tDao = new TagRecommendationDao();
		EmployeeRecommendationDao eDao = new EmployeeRecommendationDao();

		public List<PostRecommendation> get(User user, int count) {
			List<PostRecommendation> posts = pRDao.get(user, DateTime.Now.AddMonths(-1));

			foreach (PostRecommendation post in posts) {
				EmployeeRecommendation employee = eDao.get(user, post.employee);
				calculateEmployeeValue(employee);

				List<TagRecommendation> tags = new List<TagRecommendation>();
				foreach (Tag tag in post.tags) {
					TagRecommendation tr = tDao.get(user, tag);
					calculateTagValue(tr);
					tags.Add(tr);
				}

				calculatePostValue(post, employee, tags);
			}

			posts = orderRecommendations(posts, count);
			return posts;
		}

		void calculateEmployeeValue(EmployeeRecommendation employee) {
			employee.value = employee.views * 25 + employee.finished * 35 + employee.qualification * 40;
		}

		void calculateTagValue(TagRecommendation tag) {
			tag.value = tag.views * 15 + tag.finished * 25 + tag.qualification * 60;
		}

		void calculatePostValue(PostRecommendation post, EmployeeRecommendation employee, List<TagRecommendation> tags) {
			post.value = employee.value * 40;

			foreach (TagRecommendation tag in tags) {
				post.value += tag.value * (60 / tags.Count);
			}
		}

		List<PostRecommendation> orderRecommendations(List<PostRecommendation> posts, int count) {
			posts = posts.OrderByDescending(x => x.value)
				.ToList();

			List<PostRecommendation> results = new List<PostRecommendation>();
			for (int i = 0; i < count; i++) {
				results.Add(posts[i]);
			}

			return results;
		}
	}
}
