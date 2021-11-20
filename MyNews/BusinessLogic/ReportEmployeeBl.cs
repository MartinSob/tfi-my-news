using BusinessEntity;
using Persistence;
using System;
using System.Collections.Generic;

namespace BusinessLogic
{
	public class ReportEmployeeBl : ReportTemplateBl
	{
		EmployeeRecommendationDao dao = new EmployeeRecommendationDao();

		public ReportEmployeeBl() {
			this.goodList = new List<EmployeeRecommendation>();
			this.badList = new List<EmployeeRecommendation>();
		}

		protected override void getData() {
			goodList = dao.getPopulars();
			badList = dao.getUnpopulars();
		}

		protected override void calculateProps() {
			foreach (EmployeeRecommendation e in goodList) {
				e.value = e.views + e.qualification + e.finished;
			}

			foreach (EmployeeRecommendation e in badList) {
				e.value = e.views + e.qualification + e.finished;
			}
		}
	}
}
