namespace BusinessEntity
{
	public class TagRecommendation : Tag
	{
		public int finished;
		public int views;
		public int qualification;
		public double value;

		public TagRecommendation(Tag t) {
			this.id = t.id;
			this.name = t.name;
			this.color = t.color;
		}

		public TagRecommendation() {}
	}
