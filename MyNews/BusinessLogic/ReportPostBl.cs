using BusinessEntity;
using Persistence;
using System.Collections.Generic;

namespace BusinessLogic
{
	public class ReportPostBl : ReportTemplateBl
	{
		PostRecommendationDao dao = new PostRecommendationDao();

		public ReportPostBl() {
			this.goodList = new List<PostRecommendation>();
			this.badList = new List<PostRecommendation>();
		}

		public override void getData() {
			goodList = dao.getPopulars();
			badList = dao.getUnpopulars();
		}

		public override void calculateProps() {
			foreach (PostRecommendation post in goodList) {
				post.value = post.views + post.qualification + post.finished;
			}

			foreach (PostRecommendation post in goodList) {
				post.value = post.views + post.qualification + post.finished;
			}
		}
	}
}
