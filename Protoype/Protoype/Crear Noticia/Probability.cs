using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Protoype.Crear_Noticia
{
	class Probability
	{
		public double value;
		public double open;
		public double read;
		public double words;
		public double paragraphs;
		public List<string> recommendations = new List<string>();

		public void calculateValue() {
			value = (open * 0.7 + read * 0.8 - paragraphs * 0.3 - words * 0.3) * 100;
		}

		public void calculateRecommendations() {
			if (open < 0.3) {
				recommendations.Add("Los tags seleccionados no son muy consumidos.");
			}

			if (read < 0.3) {
				recommendations.Add("Los tags seleccionados no suelen ser leidos.");
			}

			if (words > 0) {
				recommendations.Add("Las notas con exito suelen ser mas cortas.");
			}

			if (words < 0) {
				recommendations.Add("Las notas con exito suelen ser mas largas.");
			}

			if (paragraphs > 0) {
				recommendations.Add("Las notas con exito suelen tener mas parrafos");
			}

			if (paragraphs < 0) {
				recommendations.Add("Las notas con exito suelen tener menos parrafos");
			}
		}
	}
}
