using Protoype.Listar_Noticias;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Protoype
{
	public partial class Prototype : Form
	{
		public Prototype() {
			InitializeComponent();
		}

		private void button1_Click(object sender, EventArgs e) {
			CrearNoticia cn = new CrearNoticia();
			cn.Show();
		}

		private void button2_Click(object sender, EventArgs e) {
			ListarNoticias ln = new ListarNoticias();
			ln.Show();
		}
	}
}
