using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Functional
{
	public class BackupDao : ConnectionDao
	{
		bool restore(Backup backup) {
			// TODO

			return true;
		}

		bool backup(Backup backup) {
			// TODO

			return true;
		}

		List<Backup> get() {
			// TODO

			return new List<Backup>();
		}
	}
}
