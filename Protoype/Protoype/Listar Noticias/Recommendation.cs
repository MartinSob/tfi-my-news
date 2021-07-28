using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Protoype.Listar_Noticias
{
	public class Recommendation
	{
		public string title;
		public int opens;
		public int likes;
		public double value;

		public void calculate() {
			value = opens * 0.7 + likes;
		}
	}
}
