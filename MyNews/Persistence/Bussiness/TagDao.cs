using BusinessEntity;
using System.Collections.Generic;

namespace Persistence
{
	class TagDao : ConnectionDao
	{
		List<Tag> get(Post post) {
			// TODO

			return new List<Tag>();
		}

		List<Tag> get() {
			// TODO

			return new List<Tag>();
		}

		List<TagRecommendation> getRecommendations(User user, PostRecommendation post) {
			// TODO

			return new List<TagRecommendation>();
		}

		Tag get(int id) {
			// TODO

			return new Tag();
		}

		List<Tag> getPopulars() {
			// TODO

			return new List<Tag>();
		}

		int getReads(Tag tag) {
			// TODO

			return 1;
		}
	}
}
