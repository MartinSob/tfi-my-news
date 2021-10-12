using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessEntity;
using Persistence;

namespace BusinessLogic
{
	public class TagBl
	{
		TagDao dao = new TagDao();

		public Tag create(Tag tag) {
			dao.create(tag);
			return tag;
		}

		public bool delete(int id) {
			return dao.delete(id);
		}

		public List<Tag> get(string name = null) {
			return dao.get(name);
		}

		public Tag get(int id) {
			return dao.get(id);
		}

		public void update(Tag tag) {
			dao.update(tag);
		}
	}
}
