using BusinessEntity;
using Persistence;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLogic
{
	public class ReportReadsBl : ReportTemplateBl
	{
		PostRecommendationDao dao = new PostRecommendationDao();

		public ReportReadsBl() {
			this.goodList = new List<PostRecommendation>();
		}

		protected override void getData() {
			goodList = dao.getTotalReads().ToList();
		}

		protected override void calculateProps() {}
	}
}
