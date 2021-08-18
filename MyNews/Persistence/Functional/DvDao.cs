using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Functional
{
	public class DvDao : ConnectionDao
	{
		bool verifyDvv(string table) {
			// TODO

			return true;
		}

		List<string> verifyDvh(string table) {
			// TODO

			return new List<string>();
		}

		public List<string> getTables() {
			// TODO

			return new List<string>();
		}

		string getDvv(string table) {
			// TODO
			
			return "";
		}

		public string calculateDvv(string table) {
			// TODO

			return "";
		}

		public void updateDvv(string table) {
			// TODO

			return;
		}

		public void updateDvh(string table) {
			// TODO

			return;
		}
	}
}
