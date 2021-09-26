using BusinessEntity;
using Persistence.Functional;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Security
{
	public class DvBl
	{
		DvDao dao = new DvDao();

		public bool updateDv(User user) {
			dao.updateDv();

			new BitacoreBl().create(new BitacoreMessage {
				title = "DV actualizados",
				description = "Los digitos verificadores fueron actualizados",
				type = MessageType.Info,
				date = DateTime.Now,
				user = user
			});

			return true;
		}

		public List<string> verifyDv(User user = null) {
			List<string> errors = new List<string>();

			foreach (string table in dao.getTables()) {
				if (!dao.verifyDvv(table)) {
					string errorMsg = "Error DV en tabla: " + table;
					errors.Add(errorMsg);

					new BitacoreBl().create(new BitacoreMessage {
						title = "Error DVV en BD",
						description = errorMsg,
						type = MessageType.Error,
						date = DateTime.Now,
						user = user
					});
				}
				List<string> dvhErrors = dao.verifyDvh(table);
				foreach (string e in dvhErrors) {
					errors.Add("[DVH] [" + table + "] Linea:" + e);
				}
			}

			return errors;
		}
	}
}
