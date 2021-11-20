using System;
using System.Collections;

namespace BusinessLogic
{
	public abstract class ReportTemplateBl
	{
		protected IList goodList;
		protected IList badList;

		public void calculateResult() {
			try {
				getData();
				calculateProps();
			} catch (Exception e) {
				Console.WriteLine(e);
			}
		}

		protected abstract void getData();
		protected abstract void calculateProps();

		public IList getResult() {
			return goodList;
		}
		public IList getNegativeResult() {
			return badList;
		}
	}
}
