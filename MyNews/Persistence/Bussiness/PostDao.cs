using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Bussiness
{
	public class PostDao : ConnectionDao
	{
		bool delete(int id) {
			// TODO

			return true;
		}

		Dictionary<string, int> getReadsGroupByMonth() {
			// TODO

			return new Dictionary<string, int>();
		}

		int create(Post post) {
			return 1;
		}

		int update(Post post) {
			return 1;
		}

		int getReads(Post post) {
			return 1;
		}

		List<Post> get(Writer writer) {
			// TODO

			return new List<Post>();
		}

		List<Post> getBad() {
			// TODO

			return new List<Post>();
		}

		List<Post> getGood() {
			// TODO

			return new List<Post>();
		}

		List<Post> get(string name) {
			// TODO

			return new List<Post>();
		}

		List<Post> get(Tag tag) {
			// TODO

			return new List<Post>();
		}

		List<PostRecommendation> getRecommendations(int days) {
			// TODO

			return new List<PostRecommendation>();
		}

		Post get(int id) {
			// TODO

			return new Post();
		}

		void addRead(Post post, User user) {
			// TODO
		}

		void addView(User user, Tag tag) {
			// TODO
		}

		void addReview(Post post, bool positive) {
			// TODO
		}

		void addView(Post post, User user) {
			// TODO
		}

		void addRead(User user, Tag tag) {
			// TODO
		}

		void addReview(User user, Tag tag, bool positive) {
			// TODO
		}
	}
}
