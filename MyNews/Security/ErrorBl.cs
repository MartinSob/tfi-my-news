﻿using Persistence;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Security
{
	public class ErrorBl
	{
		ErrorDao dao = new ErrorDao();

		public void create(string text) {
			using (System.IO.StreamWriter file =
			new System.IO.StreamWriter("./error_log.txt", true)) {
				file.WriteLine(DateTime.Now);
				file.WriteLine("");
				file.WriteLine(text);
			}
		}
	}
}
