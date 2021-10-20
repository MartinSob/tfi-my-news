using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessEntity;
using Persistence;

namespace Security
{
	public class UserBl
	{
		UserDao dao = new UserDao();

		public User create(User user, List<Role> roles = null) {
			user.password = new EncryptBl().encrypt(user.password);
			dao.create(user);

			PolicyBl pBl = new PolicyBl();
			if (roles == null) {
				pBl.assignBasicRole(user);
			} else {
				foreach (Role r in roles) {
					pBl.assignRole(user, r);
				}
				user.roles = roles;
			}

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

		public List<User> get(string name = null) {
			return dao.get(name);
		}

		public User get(int id) {
			User result = dao.get(id);
			dao.getRoles(result);
			return result;
		}

		public User getRoles(User user) {
			return dao.getRoles(user);
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

		public User basicLogin(User user) {
			user.password = new EncryptBl().encrypt(user.password);
			User loggedUser = dao.login(user);

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

			PolicyBl policyBl = new PolicyBl();
			policyBl.cleanRoles(user);
			foreach (Role role in user.roles) {
				policyBl.assignRole(user, role);
			}

			new DvDao().updateDv();
			return user;
		}

		public bool resetPassword(string mail) {
			try {
				string newPass = new EncryptBl().randomString(6);
				User user = new User {
					mail = mail,
					password = new EncryptBl().encrypt(newPass)
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

		public bool updatePassword(int id, string password) {
			try {
				User user = new User {
					id = id,
					password = new EncryptBl().encrypt(password)
				};
				dao.updatePasswordById(user);
				return true;
			} catch (Exception e) {
				Console.WriteLine(e);
				return false;
			}
		}
	}
}
