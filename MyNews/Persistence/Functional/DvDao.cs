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

		List<string> getTables() {
			// TODO

			return new List<string>();
		}

		string getDvv(string table) {
			// TODO
			
			return "";
		}

		string calculateDvv(string table) {
			// TODO

			return "";
		}

		void updateDvv(string table) {
			// TODO

			return;
		}

		void updateDvh(string table) {
			// TODO

			return;
		}
	}
}
