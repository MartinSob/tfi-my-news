namespace BusinessEntity
{
	public class PostRecommendation : Post
	{
		public double value;
		public int finished;
		public int views;
		public int qualification;

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
