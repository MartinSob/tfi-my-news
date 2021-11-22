namespace BusinessEntity
{
	public class EmployeeRecommendation : Employee
	{
		public double value { get; set; }
		public int finished { get; set; }
		public int views { get; set; }
		public int qualification { get; set; }

		public EmployeeRecommendation(Employee e) {
			this.employeeId = e.employeeId;
			this.startDay = e.startDay;
			this.endDay = e.endDay;
			this.document = e.document;
			this.birthday = e.birthday;
			this.name = e.name;
			this.lastname = e.lastname;
			this.username = e.username;
			this.mail = e.mail;
			this.active = e.active;
			this.failedAttempts = e.failedAttempts;
		}

		public EmployeeRecommendation() { }
	}
}
