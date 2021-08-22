﻿using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Functional
{
	public class BackupDao : ConnectionDao
	{
		public bool restore(Backup backup) {
			try {
				SqlCommand singleUser = new SqlCommand("ALTER DATABASE aWords SET Single_User WITH Rollback Immediate", conn);
				SqlCommand query = new SqlCommand("USE master; RESTORE DATABASE aWords FROM DISK = @bkpPath WITH REPLACE;", conn);
				SqlCommand multiUser = new SqlCommand("ALTER DATABASE aWords SET Multi_User", conn);

				query.Parameters.AddWithValue("@bkpPath", backup.name);

				conn.Open();
				singleUser.ExecuteNonQuery();
				query.ExecuteNonQuery();
				multiUser.ExecuteNonQuery();
				conn.Close();

				return true;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return false;
			}
		}

		public bool backup(Backup backup) {
			try {
				SqlCommand query = new SqlCommand("BACKUP DATABASE aWords TO  DISK = @bkpPath", conn);
				string bkpPath = Directory.GetCurrentDirectory() + "\\..\\..\\..\\BackUps\\bkp" + getTimestamp(DateTime.Now) + ".bak";
				File.Delete(bkpPath);
				query.Parameters.AddWithValue("@bkpPath", bkpPath);

				conn.Open();
				query.ExecuteNonQuery();
				conn.Close();

				return true;
			} catch (Exception e) {
				new ErrorDao().create(e.ToString());
				return false;
			}
		}

		public List<Backup> get() {
			try {
				string consultaSQL = $"SELECT * FROM bakcups";

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
