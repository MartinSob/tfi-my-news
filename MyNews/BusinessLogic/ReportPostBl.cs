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
	public class ReportPostBl : ReportTemplateBl
	{
		PostDao dao = new PostDao();

		public ReportPostBl() {
			this.goodList = new List<PostRecommendation>();
			this.badList = new List<PostRecommendation>();
		}

		public override void getData() {
			// dao.getGood() : List<Post>
			// dao.getBad() : List<Post>
			throw new NotImplementedException();
		}

		public override void calculateProps() {
			// Por cada recommendation: dao.get(Post) : PostRecommendation
			// Por cada recommendation: dao.get(Post) : PostRecommendation
			throw new NotImplementedException();
		}
	}
}
