using System.Collections;

namespace BusinessLogic
{
	public abstract class ReportTemplateBl
	{
		protected IList goodList;
		protected IList badList;

		public void calculateResult() {
			getData();
			calculateProps();
		}

		public abstract void getData();
		public abstract void calculateProps();

		public IList getResult() {
			return goodList;
		}
		public IList getNegativeResult() {
			return badList;
		}
	}
}
