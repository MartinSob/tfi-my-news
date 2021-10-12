using BusinessEntity;
using Persistence;
using System.Collections.Generic;

namespace Security
{
	public class BitacoreBl
	{
		BitacoreDao dao = new BitacoreDao();

		public int create(BitacoreMessage bitacoreMessage) {
			return dao.create(bitacoreMessage);
		}

		public List<BitacoreMessage> get(BitacoreFilter filter) {
			return dao.get(filter);
		}
	}
}
