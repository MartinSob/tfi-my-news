namespace BusinessEntity
{
	public class PostRecommendation : Post
	{
		public double value { get; set; }
		public int finished { get; set; }
		public int views { get; set; }
		public int qualification { get; set; }

		public PostRecommendation(Post p) {
			this.id = p.id;
			this.title = p.title;
			this.body = p.body;
			this.tags = p.tags;
			this.image = p.image;
			this.employee = p.employee;
			this.deleted = p.deleted;
			this.date = p.date;
			this.paragraphs = p.paragraphs;
			this.words = p.words;
		}

		public PostRecommendation() { }
	}
}
