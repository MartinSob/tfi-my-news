using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence
{
	public class BackupDao : ConnectionDao
	{
		public bool restore(Backup backup, string path) {
			try {
				SqlCommand singleUser = new SqlCommand("ALTER DATABASE myNews SET Single_User WITH Rollback Immediate", conn);
				SqlCommand query = new SqlCommand("USE master; RESTORE DATABASE myNews FROM DISK = @bkpPath WITH REPLACE;", conn);
				SqlCommand multiUser = new SqlCommand("ALTER DATABASE myNews SET Multi_User", conn);

				query.Parameters.AddWithValue("@bkpPath", path + "..\\BackUps\\" + backup.name);

				executeQuery(singleUser);
				executeQuery(query);
				executeQuery(multiUser);

				return true;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return false;
			}
		}

		public bool backup(string path) {
			try {
				string fileName = "bkp_" + getTimestamp(DateTime.Now) + ".bak";
				SqlCommand query = new SqlCommand("BACKUP DATABASE myNews TO  DISK = @bkpPath", conn);
				string bkpPath = path + "\\..\\BackUps\\" + fileName;
				File.Delete(bkpPath);
				query.Parameters.AddWithValue("@bkpPath", bkpPath);

				executeQuery(query);

				insert("backups", new string[] { "name", "date" }, new string[] { fileName, DateTime.Now.ToString() });

				return true;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return false;
			}
		}

		public List<Backup> get() {
			try {
				string consultaSQL = $"SELECT * FROM backups";

				SqlCommand query = new SqlCommand(consultaSQL, conn);
				conn.Open();
				SqlDataReader data = query.ExecuteReader();

				List<Backup> bkps = new List<Backup>();
				while (data.Read()) {
					bkps.Add(castDto(data));
				}
				conn.Close();

				return bkps;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return null;
			}
		}

		Backup castDto(SqlDataReader data) {
			Backup bkp = new Backup();
			bkp.id = int.Parse(data["id"].ToString());
			bkp.name = data["name"].ToString();
			bkp.date = DateTime.Parse(data["date"].ToString());
			return bkp;
		}
	}
}
