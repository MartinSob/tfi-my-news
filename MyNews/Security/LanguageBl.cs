using BusinessEntity;
using Persistence.Functional;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Security
{
	public class LanguageBl
	{
		LanguageDao dao = new LanguageDao();

		public Language load(Language language) {
			return dao.load(language);
		}

		public Language loadDefault() {
			return dao.loadDefault();
		}

		public List<Language> get() {
			return dao.get();
		}

		public void setToUser(Language language, User user) {
			dao.setToUser(language, user);
		}
	}
}
