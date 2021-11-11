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
			this.badList = new List<PostRecommendation>();
		}

		public override void getData() {
			goodList = dao.getTotalReads().ToList();
		}

		public override void calculateProps() {}
	}
}
