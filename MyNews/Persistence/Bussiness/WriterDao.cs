using BusinessEntity;
using System.Collections.Generic;

namespace Persistence.Bussiness
{
	public class WriterDao
	{
		bool delete(int id) {
			// TODO

			return true;
		}

		int getReads(Writer writer) {
			// TODO

			return 1;
		}

		List<Writer> getMostRead() {
			// TODO

			return new List<Writer>();
		}

		List<Writer> getLessRead() {
			// TODO

			return new List<Writer>();
		}

		List<Writer> get() {
			// TODO

			return new List<Writer>();
		}

		Writer update(Writer writer) {
			// TODO

			return new Writer();
		}

		Writer get(int id) {
			// TODO

			return new Writer();
		}

		Writer create(Writer writer) {
			// TODO

			return new Writer();
		}

		WriterRecommendation getRecommendations(User user, PostRecommendation post) {
			// TODO

			return new WriterRecommendation();
		}
	}
}
