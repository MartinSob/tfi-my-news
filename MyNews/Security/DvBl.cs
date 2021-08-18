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
			// TODO

			var tables = dao.getTables();

			foreach (string table in tables) {
				dao.updateDvv(table);
				dao.updateDvh(table);
			}

			// BItacore

			return true;
		}

		public List<string> verifyDv() {
			// TODO
			return new List<string>();
		}
	}
}
