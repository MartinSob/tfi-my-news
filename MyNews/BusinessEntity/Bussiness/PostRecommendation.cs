using System.Collections.Generic;

namespace BusinessEntity
{
	public class PostRecommendation
	{
		public double value;
		public List<TagRecommendation> tags;
		public EmployeeRecommendation writer;
	}
}
