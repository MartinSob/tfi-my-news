using Persistence;
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
			dao.create(text);
		}
	}
}
