using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Persistence
{
	public class ErrorDao
	{
		public string CurrentAssemblyDirectory() {
			string codeBase = Assembly.GetExecutingAssembly().CodeBase;
			UriBuilder uri = new UriBuilder(codeBase);
			string path = Uri.UnescapeDataString(uri.Path);
			return Path.GetDirectoryName(path);
		}

		public void create(string text) {
			try {
				var fileName = CurrentAssemblyDirectory() + "//..//error_log.txt";
				if (!File.Exists(fileName))
					File.Create(fileName);

				using (System.IO.StreamWriter file =
				new System.IO.StreamWriter(fileName, true)) {
					file.WriteLine(DateTime.Now);
					file.WriteLine("");
					file.WriteLine(text);
				}
			} catch (Exception e) {
				Console.WriteLine(e.Message);
			}
		}
	}
}
