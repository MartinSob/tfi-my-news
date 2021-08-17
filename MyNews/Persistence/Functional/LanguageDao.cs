using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Functional
{
	public class LanguageDao : ConnectionDao
	{
		Language load(Language language) {
			// TODO

			return new Language();
		}

		List<Language> get() {
			// TODO

			return new List<Language>();
		}

		void load(User user) {
			// TODO
		}

		void setToUser(Language language) { 
			// TODO
		}
	}
}
