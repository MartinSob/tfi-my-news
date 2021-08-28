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

		public bool updateDv() {
			var tables = dao.getTables();

			foreach (string table in tables) {
				dao.updateDvv(table);
				dao.updateDvh(table);
			}

			// Bitacore

			return true;
		}

		public List<string> verifyDv(User user) {
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
