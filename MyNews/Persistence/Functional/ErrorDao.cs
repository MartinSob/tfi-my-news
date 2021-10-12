using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence
{
	public class ErrorDao
	{
		public void create(string text) {
			if (!File.Exists("./error_log.txt"))
				File.Create("./error_log.txt");

			using (System.IO.StreamWriter file =
			new System.IO.StreamWriter("./error_log.txt", true)) {
				file.WriteLine(DateTime.Now);
				file.WriteLine("");
				file.WriteLine(text);
			}
		}
	}
}
