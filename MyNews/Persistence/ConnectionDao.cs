using System.Data.SqlClient;

namespace Persistence
{
	public abstract class ConnectionDao
	{
		SqlConnection conn;

		int insert(string table, string[] columns, string values) {
			// TODO

			return getLastId(table);
		}

		int getLastId(string table) {
			// TODO

			return 1;
		}

		bool executeQuery(SqlCommand strQuery) {
			// TODO

			return true;
		}

		bool deleteById(string table, int id) {
			// TODO

			return true;
		}
	}
}
