using System;

namespace BusinessEntity
{
	class Post
	{
		public int id;
		public string title;
		public string body;
		public string image;
		public Writer writer;
		public bool deleted;
		public DateTime date;
	}
}
