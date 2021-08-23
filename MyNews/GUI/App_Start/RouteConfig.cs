using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Routing;
using System.Xml;

namespace MyNews
{
	public class RouteConfig
	{
		public static void RegisterRoutes(RouteCollection routes) {
			// Check DB installation
			if (WebConfigurationManager.AppSettings["database"].ToString() == "false" && !CheckDatabaseExists("myNews")) {
				try {
					createDatabase();
				} catch (Exception ex) {
					Console.WriteLine(ex.ToString());
				}
			}

			routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

			routes.MapRoute(
				name: "Default",
				url: "{controller}/{action}/{id}",
				defaults: new { controller = "Backup", action = "Index", id = UrlParameter.Optional }
			);
		}

		private static void createDatabase() {
			String str = File.ReadAllText("./script.sql");
			SqlConnection myConn = new SqlConnection("Server=localhost;Integrated security=SSPI;database=master");

			try {
				IEnumerable<string> commandStrings = Regex.Split(str, @"^\s*GO\s*$", RegexOptions.Multiline | RegexOptions.IgnoreCase);

				myConn.Open();
				foreach (string commandString in commandStrings) {
					if (!string.IsNullOrWhiteSpace(commandString.Trim())) {
						using (var command = new SqlCommand(commandString, myConn)) {
							command.ExecuteNonQuery();
						}
					}
				}

				myConn.Close();
			} catch (System.Exception ex) {
				Console.WriteLine(ex.ToString());
			}
		}

		private static bool CheckDatabaseExists(string databaseName) {
			using (var connection = new SqlConnection("Server=localhost;Integrated security=SSPI;database=master")) {
				using (var command = new SqlCommand($"SELECT db_id('{databaseName}')", connection)) {
					connection.Open();
					return (command.ExecuteScalar() != DBNull.Value);
				}
			}
		}
	}
}
