﻿using BusinessEntity;
using Persistence.Functional;
using System;
using System.Collections.Generic;

namespace Security
{
	public class BackupBl
	{
		BackupDao dao = new BackupDao();

		public bool restore(Backup backup) {
			return dao.restore(backup);
		}

		public bool backup(string path) {
			return dao.backup(path);
		}

		public List<Backup> get() {
			return dao.get();
		}
	}
}
