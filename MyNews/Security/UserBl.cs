using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessEntity;
using Persistence.Functional;

namespace Security
{
	public class UserBl
	{
		UserDao dao = new UserDao();

		public User create(User user) {
			return dao.create(user);
		}

		public bool delete(int id) {
			return dao.delete(id);
		}

		public bool exists(string username, string mail) {
			return dao.exists(username, mail);
		}

		public List<User> get() {
			// TODO
			return new List<User>();
		}

		public User get(int id) {
			// TODO
			return new User();
		}

		public User login(User user) {
			return dao.login(user);
		}

		public void logout() {
			// TODO
		}

		public User update(User user) {
			return dao.update(user);
		}

		public void block(User user) {
			dao.block(user);
		}

		public void restartFailedAttempts(int userId) {
			dao.restartFailedAttempts(userId);
		}
	}
}
