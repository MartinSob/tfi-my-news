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
			user.password = new EncryptBl().encrypt(user.password);
			User loggedUser = dao.login(user);

			if (loggedUser == null) {
				int failedAttempts = dao.addFailedAttempt(user.username);

				if (failedAttempts > 5) {
					new BitacoreBl().create(new BitacoreMessage() {
						title = "Intentos fallidos",
						type = MessageType.Warning,
						description = $"{user.username} ha intentado iniciar sesión {failedAttempts} veces",
						user = null
					});

					dao.block(user);
					return null;
				}
			}

			dao.restartFailedAttempts(user);

			// Consultar permiso?

			// new LanguageDao().load(loggedUser);

			return loggedUser;
		}

		public void logout(User user) {
			new BitacoreBl().create(new BitacoreMessage() {
				title = "Cerrar Sesión",
				type = MessageType.Info,
				description = $"{user.username} ha cerrado sesión.",
				user = user
			});
		}

		public User update(User user) {
			return dao.update(user);
		}
	}
}
