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
		public bool restore(Backup backup) {
			// TODO

			return true;
		}

		public bool backup(Backup backup) {
			// TODO

			return true;
		}

		public List<Backup> get() {
			// TODO

			return new List<Backup>();
		}
	}
}
