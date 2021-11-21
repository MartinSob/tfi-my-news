using BusinessEntity;
using Persistence;
using System;
using System.Collections.Generic;
using System.Linq;

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

			return orderRecommendations(posts, count);
		}

		void calculateEmployeeValue(EmployeeRecommendation employee) {
			employee.value = employee.views * 25 / 100 + employee.finished * 35 / 100 + employee.qualification * 40 / 100;
		}

		void calculateTagValue(TagRecommendation tag) {
			tag.value = tag.views * 15 / 100 + tag.finished * 25 / 100 + tag.qualification * 60 / 100;
		}

		void calculatePostValue(PostRecommendation post, EmployeeRecommendation employee, List<TagRecommendation> tags) {
			post.value = employee.value * 40 / 100;

			foreach (TagRecommendation tag in tags) {
				post.value += tag.value * (60 / tags.Count) / 100;
			}
		}

		List<PostRecommendation> orderRecommendations(List<PostRecommendation> posts, int count) {
			posts = posts.OrderByDescending(x => x.value)
				.ToList();

			if (count > posts.Count)
				count = posts.Count;

			List<PostRecommendation> results = new List<PostRecommendation>();
			for (int i = 0; i < count; i++) {
				results.Add(posts[i]);
			}

			return results;
		}
	}
}
