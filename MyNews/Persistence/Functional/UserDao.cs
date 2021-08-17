using BusinessEntity;

namespace Persistence.Functional
{
	public class UserDao : ConnectionDao
	{
		bool delete(int id) {
			// TODO

			return true;
		}

		bool exists(string username, string mail) {
			// TODO

			return true;
		}

		int addFailedAttempt(string username) {
			// TODO

			return 1;
		}

		User create(User writer) {
			// TODO

			return new User();
		}

		User update(User writer) {
			// TODO

			return new User();
		}

		User login(User writer) {
			// TODO

			return new User();
		}

		User create(int id) {
			// TODO

			return new User();
		}

		void block(User writer) {
			// TODO

			return;
		}

		void restartFailedAttempts(int userId) {
			// TODO

			return;
		}
	}
}
