namespace BusinessEntity
{
	public class EmployeeRecommendation : Employee
	{
		public double value;
		public int finished;
		public int views;
		public int qualification;

		public EmployeeRecommendation(Employee e) {
			this.employeeId = e.employeeId;
			this.startDay = e.startDay;
			this.endDay = e.endDay;
			this.document = e.document;
			this.birthday = e.birthday;
			this.name = e.name;
			this.lastname = e.lastname;
		}

		public EmployeeRecommendation() { }
	}
}
