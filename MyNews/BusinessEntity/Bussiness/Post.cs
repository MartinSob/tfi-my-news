using System;
using System.Collections.Generic;

namespace BusinessEntity
{
	public class Post
	{
		public int id { get; set; }
		public string title { get; set; }
		public string body { get; set; }
		public List<Tag> tags = new List<Tag>();
		public string image { get; set; }
		public Employee employee { get; set; }
		public bool deleted { get; set; }
		public DateTime date;
		public int paragraphs { get; set; }
		public int words { get; set; }
	}
}
