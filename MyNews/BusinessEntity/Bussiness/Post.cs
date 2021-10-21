using System;
using System.Collections.Generic;

namespace BusinessEntity
{
	public class Post
	{
		public int id;
		public string title;
		public string body;
		public List<Tag> tags = new List<Tag>();
		public string image;
		public Employee employee;
		public bool deleted;
		public DateTime date;
		public int paragraphs;
		public int words;
	}
}
