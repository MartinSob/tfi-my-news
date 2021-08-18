using BusinessEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Functional
{
	public class BitacoreDao : ConnectionDao
	{
		public int create(BitacoreMessage message) {
			// TODO
			
			return 1;
		}

		public List<BitacoreMessage> get(BitacoreFilter filter) {
			// TODO

			return new List<BitacoreMessage>();
		}
	}
}
