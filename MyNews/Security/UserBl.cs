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
			user.password = new EncryptBl().encrypt(user.password);
			dao.create(user);
			new PolicyBl().assignBasicRole(user);
			new DvDao().updateDv();
			return user;
		}

		public bool delete(int id) {
			bool response = dao.delete(id);
			new DvDao().updateDv();
			return response;
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
						description = $"{user.username} ha intentado iniciar sesión {failedAttempts} veces.",
						user = null
					});

					dao.block(user);
				}

				return null;
			}

			dao.restartFailedAttempts(loggedUser);

			new BitacoreBl().create(new BitacoreMessage() {
				title = "Inicio sesion",
				type = MessageType.Info,
				description = $"{loggedUser.username} ha iniciado sesión.",
				user = loggedUser
			});

			loggedUser.roles = new PolicyBl().getAllPermits(loggedUser);

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
			dao.update(user);
			new DvDao().updateDv();
			return user;
		}

		public bool resetPassword(string mail) {
			try {
				string newPass = new EncryptBl().randomString(6);
				User user = new User {
					mail = mail,
					password = newPass
				};
				dao.updatePassword(user);
				new DvDao().updateDv();

				new EmailBl().sendEmail(
					"<h1>Reset password</h1><p>The system has generated a new password.<br><br>New Pass: " + user.password + "<br><br>Thanks<br>myNewsMaker</p>", 
					"New Password", user.mail);
				return true;
			} catch {
				return false;
			}
		}
	}
}
