using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Functional
{
	public class LanguageDao : ConnectionDao
	{
		public Language load(Language language) {
			try {
				SqlCommand query = new SqlCommand("SELECT c.* FROM controls c JOIN languages l ON l.id = c.language_id WHERE l.id = @lang", conn);
				query.Parameters.AddWithValue("@lang", language.id);

				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				Dictionary<string, string> result = new Dictionary<string, string>();
				while (data.Read()) {
					language.texts.Add(data["tag"].ToString(), data["text"].ToString());
				}
				conn.Close();

				return language;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public List<Language> get() {
			try {
				SqlCommand query = new SqlCommand("SELECT * FROM languages", conn);

				List<Language> languages = new List<Language>();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						languages.Add(castDto(data));
					}
				}

				conn.Close();

				return languages;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public void load(User user) {
			// TODO
		}

		public void setToUser(Language language) { 
			// TODO
		}

		public Language castDto(SqlDataReader data) {
			Language result = new Language();
			result.id = Convert.ToInt32(data["id"]);
			result.name = data["name"].ToString();

			return result;
		}
	}
}
