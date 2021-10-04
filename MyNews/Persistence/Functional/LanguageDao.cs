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

		public List<Language> get(string text = null) {
			try {
				string q = "SELECT * FROM languages l WHERE deleted = 0 ";

				if (text != null) {
					q += " AND l.name LIKE CONCAT('%', @name, '%') ";
				}

				SqlCommand query = new SqlCommand(q, conn);

				if (text != null) {
					query.Parameters.AddWithValue("@name", text);
				}

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

		public Language get(int id) {
			try {
				SqlCommand query = new SqlCommand("SELECT * FROM languages l WHERE id = @id ", conn);
				query.Parameters.AddWithValue("@id", id);

				Language language = null;
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				if (data.HasRows) {
					while (data.Read()) {
						language = castDto(data);
					}
				}

				conn.Close();

				load(language);

				return language;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public Language loadDefault() {
			try {
				SqlCommand query = new SqlCommand("SELECT c.*, l.id as l_id FROM controls c JOIN languages l ON c.language_id = l.id WHERE l.id = (SELECT TOP 1 id FROM languages WHERE deleted = 0 ) ", conn);

				Language language = new Language();
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				Dictionary<string, string> result = new Dictionary<string, string>();
				while (data.Read()) {
					language.id = int.Parse(data["l_id"].ToString());
					language.texts.Add(data["tag"].ToString(), data["text"].ToString());
				}
				conn.Close();

				return language;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		public void setToUser(Language language, User user) {
			update("users", 
				new string[] { "language_id" },
				new string[] { language.id.ToString() },
				new string[] { "id" },
				new string[] { user.id.ToString() }
			);
			new DvDao().updateDv(user.id, "users");
		}

		public Language castDto(SqlDataReader data) {
			Language result = new Language();
			result.id = Convert.ToInt32(data["id"]);
			result.name = data["name"].ToString();

			return result;
		}

		public bool delete(int id) {
			return logicDeleteById("languages", id);
		}

		public void update(Language language) {
			update("languages", new string[] { "name" }, new string[] { language.name }, new string[] { "id" }, new string[] { language.id.ToString() });

			foreach (KeyValuePair<string, string> text in language.texts) {
				update("controls", new string[] { "text" }, new string[] { text.Value }, 
					new string[] { "language_id", "tag" }, new string[] { language.id.ToString(), text.Key });
			}
		}

		public int create(Language language) {
			language.id = insert("languages", new string[] { "name" }, new string[] { language.name });

			foreach (KeyValuePair<string, string> text in language.texts) {
				insert("controls", new string[] { "language_id", "tag", "text" }, new string[] { language.id.ToString(), text.Key, text.Value });
			}

			return language.id;
		}
	}
}
