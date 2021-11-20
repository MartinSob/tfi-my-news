using BusinessEntity;
using Persistence;
using System;
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

		protected override void getData() {
			try {
				goodList = dao.getPopulars();
				badList = dao.getUnpopulars();
			} catch (Exception e) {
				Console.WriteLine(e);
			}
		}

		protected override void calculateProps() {
			foreach (PostRecommendation post in goodList) {
				post.value = post.views + post.qualification + post.finished;
			}

			foreach (PostRecommendation post in goodList) {
				post.value = post.views + post.qualification + post.finished;
			}
		}
	}
}
