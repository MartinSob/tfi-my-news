using BusinessEntity;
using System.Collections.Generic;

namespace Persistence.Bussiness
{
	public class EmployeeDao
	{
		bool delete(int id) {
			// TODO

			return true;
		}

		int getReads(Employee employee) {
			// TODO

			return 1;
		}

		List<Employee> getMostRead() {
			// TODO

			return new List<Employee>();
		}

		List<Employee> getLessRead() {
			// TODO

			return new List<Employee>();
		}

		List<Employee> get() {
			// TODO

			return new List<Employee>();
		}

		Employee update(Employee employee) {
			// TODO

			return new Employee();
		}

		Employee get(int id) {
			// TODO

			return new Employee();
		}

		Employee create(Employee employee) {
			// TODO

			return new Employee();
		}

		WriterRecommendation getRecommendations(User user, PostRecommendation post) {
			// TODO

			return new WriterRecommendation();
		}
	}
}
