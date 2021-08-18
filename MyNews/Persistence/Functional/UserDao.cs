using BusinessEntity;

namespace Persistence.Functional
{
	public class UserDao : ConnectionDao
	{
		public bool delete(int id) {
			// TODO

			return true;
		}

		public bool exists(string username, string mail) {
			// TODO

			return true;
		}

		public int addFailedAttempt(string username) {
			// TODO

			return 1;
		}

		public User create(User user) {
			// TODO

			return new User();
		}

		public User update(User user) {
			// TODO

			return new User();
		}

		public User login(User user) {
			// TODO

			return new User();
		}

		public User create(int id) {
			// TODO

			return new User();
		}

		public void block(User user) {
			// TODO

			return;
		}

		public void restartFailedAttempts(int userId) {
			// TODO

			return;
		}
	}
}
