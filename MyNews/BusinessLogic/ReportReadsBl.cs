using BusinessEntity;
using Persistence;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
	public class ReportReadsBl : ReportTemplateBl
	{
		PostDao dao = new PostDao();

		public ReportReadsBl() {
			this.goodList = new List<PostRecommendation>();
			this.badList = new List<PostRecommendation>();
		}

		public override void getData() {
			// dao.getReadsGroupByMonth() : List<Post>
			throw new NotImplementedException();
		}

		public override void calculateProps() {
			// Dunno :D
			throw new NotImplementedException();
		}
	}
}
