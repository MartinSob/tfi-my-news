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

		public List<Language> get(string text = null) {
			return dao.get(text);
		}

		public Language get(int id) {
			return dao.get(id);
		}

		public void setToUser(Language language, User user) {
			dao.setToUser(language, user);
		}

		public bool delete(int id) {
			return dao.delete(id);
		}

		public void update(Language language) {
			dao.update(language);
		}

		public void create(Language language) {
			language.id = dao.create(language);
		}
	}
}
