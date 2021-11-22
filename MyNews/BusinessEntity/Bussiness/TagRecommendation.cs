namespace BusinessEntity
{
	public class TagRecommendation : Tag
	{
		public int finished { get; set; }
		public int views { get; set; }
		public int qualification { get; set; }
		public double value { get; set; }

		public TagRecommendation(Tag t) {
			this.id = t.id;
			this.name = t.name;
			this.color = t.color;
		}

		public TagRecommendation() { }
	}
}
