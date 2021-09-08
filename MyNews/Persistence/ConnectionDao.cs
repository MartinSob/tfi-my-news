using Persistence.Functional;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Persistence
{
	public class ConnectionDao
	{
		protected SqlConnection conn;

		public ConnectionDao() {
			try {
				this.conn = new SqlConnection(ConfigurationManager.ConnectionStrings["local"].ConnectionString.ToString());
			} catch (Exception e) {
				Console.WriteLine(e);
			}
		}

		protected int insert(string table, string[] columns, string[] values) {
			try {
				StringBuilder queryString = new StringBuilder().AppendFormat("INSERT INTO {0} (", table);

				for (int i = 0; i < columns.Length; i++) {
					if (i != 0) {
						queryString.Append(", ");
					}

					queryString.Append(columns[i]);
				}

				queryString.Append(") VALUES (");

				for (int i = 0; i < columns.Length; i++) {
					if (i != 0) {
						queryString.Append(", ");
					}

					queryString.Append("@" + columns[i]);
				}

				queryString.Append(")");

				SqlCommand query = new SqlCommand(queryString.ToString(), conn);

				for (int i = 0; i < columns.Length; i++) {
					if (values[i] == null) {
						query.Parameters.AddWithValue("@" + columns[i], DBNull.Value);
					} else {
						query.Parameters.AddWithValue("@" + columns[i], truncate(values[i], 200));
					}
				}

				if (conn.State == ConnectionState.Open) {
					return 0;
				}

				conn.Open();
				query.ExecuteNonQuery();
				conn.Close();

				return getLastId(table);
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return 0;
			}
		}

		protected int update(string table, string[] columns, string[] values, string[] whereColumns, string[] whereValues) {
			try {
				StringBuilder queryString = new StringBuilder().AppendFormat("UPDATE {0} SET ", table);

				for (int i = 0; i < columns.Length; i++) {
					if (i != 0) {
						queryString.Append(", ");
					}

					queryString.Append(columns[i] + " = @" + columns[i]);
				}

				queryString.Append(" WHERE ");

				for (int i = 0; i < columns.Length; i++) {
					if (i != 0) {
						queryString.Append(" AND ");
					}

					queryString.Append(whereColumns[i] + " = @" + whereColumns[i]);
				}

				var asd = queryString.ToString();

				SqlCommand query = new SqlCommand(queryString.ToString(), conn);

				for (int i = 0; i < columns.Length; i++) {
					if (values[i] == null) {
						query.Parameters.AddWithValue("@" + columns[i], DBNull.Value);
					} else {
						query.Parameters.AddWithValue("@" + columns[i], truncate(values[i], 200));
					}
				}

				for (int i = 0; i < whereColumns.Length; i++) {
					if (whereValues[i] == null) {
						query.Parameters.AddWithValue("@" + whereColumns[i], DBNull.Value);
					} else {
						query.Parameters.AddWithValue("@" + whereColumns[i], truncate(whereValues[i], 200));
					}
				}

				if (conn.State == ConnectionState.Open) {
					return 0;
				}

				conn.Open();
				query.ExecuteNonQuery();
				conn.Close();

				return getLastId(table);
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return 0;
			}
		}

		public string truncate(string value, int maxChars) {
			return value.Length <= maxChars ? value : value.Substring(0, maxChars) + " ...";
		}

		protected int getLastId(string table) {
			try {
				if (conn.State == ConnectionState.Open) {
					return 0;
				}

				SqlCommand query = new SqlCommand($"SELECT TOP 1 id FROM {table} ORDER BY ID DESC", conn);
				conn.Open();
				SqlDataReader data = query.ExecuteReader();
				int result = 0;

				if (data.HasRows) {
					data.Read();
					result = int.Parse(data["id"].ToString());
				}

				conn.Close();
				return result;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return 0;
			}
		}

		protected bool executeQuery(SqlCommand strQuery) {
			try {
				if (conn.State == ConnectionState.Open) {
					return false;
				}

				conn.Open();
				strQuery.ExecuteNonQuery();
				conn.Close();

				return true;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return false;
			}
		}

		protected bool deleteById(string table, int id) {
			try {
				if (conn.State == ConnectionState.Open) {
					return false;
				}

				SqlCommand query = new SqlCommand($"DELETE FROM {table} WHERE id = {id}", conn);

				conn.Open();
				query.ExecuteNonQuery();
				conn.Close();
				return true;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return false;
			}
		}

		public string getTimestamp(DateTime value) {
			return value.ToString("yyyyMMdd");
		}
	}
}
