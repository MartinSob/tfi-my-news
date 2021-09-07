using System.Collections.Generic;

namespace BusinessEntity
{
	public class Language
	{
		public int id;
		public string name;
		public Dictionary<string, string> texts = new Dictionary<string, string>();
	}
}
