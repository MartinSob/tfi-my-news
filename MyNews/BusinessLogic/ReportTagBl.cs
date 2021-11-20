using BusinessEntity;
using Persistence;
using System.Collections.Generic;

namespace BusinessLogic
{
	public class ReportTagBl : ReportTemplateBl
	{
		TagRecommendationDao dao = new TagRecommendationDao();

		public ReportTagBl() { 
			this.goodList = new List<TagRecommendation>();
		}

		protected override void getData() {
			goodList = dao.getPopulars();
		}

		protected override void calculateProps() {
			foreach (TagRecommendation tag in goodList) {
				tag.value = tag.views + tag.qualification + tag.finished;
			}
		}
	}
}
