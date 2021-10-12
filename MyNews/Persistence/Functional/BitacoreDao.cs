using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Persistence
{
	public class BitacoreDao : ConnectionDao
	{
		public int create(BitacoreMessage message) {
			string[] columns = { "date", "title", "description", "type", "user_id" };
			var userId = message.user != null ? message.user.id : 0;
			string[] values = { DateTime.Now.ToString(), message.title, message.description, message.type.ToString(), userId.ToString() };
			return insert("bitacore", columns, values);
		}

		public List<BitacoreMessage> get(BitacoreFilter filter) {
            try {
                string consultaSQL = $"SELECT b.id, b.date, b.title, b.description, b.type, b.user_id, u.username FROM bitacore b LEFT JOIN users u ON u.id = b.user_id WHERE b.date BETWEEN '{filter.from.ToString("yyyy-MM-dd")}' AND '{filter.to.ToString("yyyy-MM-dd")}  23:59:59'";

                if (filter.type != null) {
                    consultaSQL += $" AND (b.type LIKE '%{filter.type}%' OR b.title LIKE '%{filter.type}%' OR b.description LIKE '%{filter.type}%')";
                }

                consultaSQL += " ORDER BY b.id DESC";

                SqlCommand query = new SqlCommand(consultaSQL, conn);
                conn.Open();
                SqlDataReader data = query.ExecuteReader();

                List<BitacoreMessage> mensajes = new List<BitacoreMessage>();
                while (data.Read()) {
                    mensajes.Add(castDto(data));
                }
                conn.Close();

                return mensajes;
            } catch (Exception e) {
                new ErrorDao().create(e.ToString());
                return null;
            }
        }

        public BitacoreMessage castDto(SqlDataReader data) {
            BitacoreMessage result = new BitacoreMessage();
            result.id = Convert.ToInt32(data["id"]);
            result.date = Convert.ToDateTime(data["date"].ToString());
            result.title = data["title"].ToString();
            result.description = data["description"].ToString();
            switch (data["type"].ToString()) {
                case "Error":
                    result.type = MessageType.Error;
                    break;
                case "Info":
                    result.type = MessageType.Info;
                    break;
                case "Warning":
                    result.type = MessageType.Warning;
                    break;
                case "Control":
                    result.type = MessageType.Control;
                    break;
                default:
                    result.type = MessageType.Info;
                    break;
            }
            result.user = new User() {
                id = Convert.ToInt32(data["user_id"]),
                username = data["username"].ToString()
            };

            return result;
        }
    }
}
