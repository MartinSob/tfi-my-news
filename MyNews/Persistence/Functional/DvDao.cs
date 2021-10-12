using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence
{
	public class DvDao : ConnectionDao
	{
		public bool verifyDvv(string table) {
			string dvvCalculado = calculateDvv(table);
			return dvvCalculado.Equals(getDvv(table));
		}

		public List<string> verifyDvh(string table) {
			List<string> result = new List<string>();

			string selectDVH = $"SELECT * FROM {table}";
			SqlCommand query = new SqlCommand(selectDVH, conn);
			conn.Open();
			SqlDataReader data = query.ExecuteReader();

			var dvhs = new System.Text.StringBuilder();
			int row = 1;
			while (data.Read()) {
				for (int i = 0; i < data.FieldCount; i++) {
					if (!data.GetName(i).Equals("dvh")) {
						dvhs.Append(data.GetValue(i).GetHashCode().ToString());
					}
				}

				string dvhsCalculated = dvhs.ToString().GetHashCode().ToString();
				if (dvhsCalculated != data["dvh"].ToString()) {
					result.Add(row.ToString());
				}
				row++;
				dvhs.Clear();
			}
			conn.Close();

			return result;
		}

		public List<string> getTables() {
			string selectDVV = "SELECT table_name FROM dvv";
			SqlCommand query = new SqlCommand(selectDVV, conn);
			conn.Open();
			SqlDataReader data = query.ExecuteReader();

			List<string> names = new List<string>();
			while (data.Read()) {
				names.Add(data["table_name"].ToString());
			}
			conn.Close();

			return names;
		}

		public string getDvv(string table) {
			string selectDVV = $"SELECT dvv FROM dvv WHERE table_name = '{table}'";
			SqlCommand query = new SqlCommand(selectDVV, conn);
			conn.Open();
			SqlDataReader data = query.ExecuteReader();

			string dvv = "";
			while (data.Read()) {
				dvv = data["dvv"].ToString();
			}
			conn.Close();

			return dvv;
		}

		public string calculateDvv(string table) {
			string selectDVH = $"SELECT dvh FROM {table}";
			SqlCommand query = new SqlCommand(selectDVH, conn);
			conn.Open();
			SqlDataReader data = query.ExecuteReader();

			var dvhs = new StringBuilder();
			while (data.Read()) {
				dvhs.Append(data["dvh"]);
			}
			conn.Close();

			return dvhs.ToString().GetHashCode().ToString();
		}

		public bool updateDv() {
			var tables = getTables();

			foreach (string table in tables) {
				updateDvh(table);
				updateDvv(table);
			}

			return true;
		}

		public bool updateDv(int id, string table) {
			updateDvh(id, table);
			updateDvv(table);

			return true;
		}

		public void updateDvv(string table) {
			try {
				if (conn.State == ConnectionState.Open) {
					return;
				}

				string SQL = $"UPDATE dvv SET dvv = '{calculateDvv(table)}' WHERE table_name = '{table}'";
				SqlCommand mCom = new SqlCommand(SQL, conn);
				executeQuery(mCom);
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
			}
		}

		public void updateDvh(string table) {
			try {
				if (conn.State == ConnectionState.Open) {
					return;
				}

				List<string> result = new List<string>();

				string selectDVH = $"SELECT * FROM {table}";
				SqlCommand selectQuery = new SqlCommand(selectDVH, conn);
				conn.Open();
				SqlDataReader data = selectQuery.ExecuteReader();

				var finalQuery = new StringBuilder();
				var dvhs = new StringBuilder();
				int row = 1;
				while (data.Read()) {
					for (int i = 0; i < data.FieldCount; i++) {
						if (!data.GetName(i).Equals("dvh")) {
							dvhs.Append(data.GetValue(i).GetHashCode().ToString());
						}
					}

					finalQuery.Append($"UPDATE {table} SET dvh = '{dvhs.ToString().GetHashCode().ToString()}' WHERE id = {data["id"].ToString()};");
					row++;
					dvhs.Clear();
				}
				conn.Close();

				SqlCommand updateQuery = new SqlCommand(finalQuery.ToString(), conn);
				executeQuery(updateQuery);
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
			}
		}

		public void updateDvh(int id, string table) {
			try {
				if (conn.State == ConnectionState.Open) {
					return;
				}

				List<string> result = new List<string>();

				string selectDVH = $"SELECT * FROM {table} WHERE id = {id}";
				SqlCommand selectQuery = new SqlCommand(selectDVH, conn);
				conn.Open();
				SqlDataReader data = selectQuery.ExecuteReader();

				var finalQuery = new StringBuilder();
				var dvhs = new StringBuilder();
				int row = 1;
				while (data.Read()) {
					for (int i = 0; i < data.FieldCount; i++) {
						if (!data.GetName(i).Equals("dvh")) {
							dvhs.Append(data.GetValue(i).GetHashCode().ToString());
						}
					}

					finalQuery.Append($"UPDATE {table} SET dvh = '{dvhs.ToString().GetHashCode().ToString()}' WHERE id = {data["id"].ToString()};");
					row++;
					dvhs.Clear();
				}
				conn.Close();

				SqlCommand updateQuery = new SqlCommand(finalQuery.ToString(), conn);
				executeQuery(updateQuery);
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
			}
		}
	}
}
