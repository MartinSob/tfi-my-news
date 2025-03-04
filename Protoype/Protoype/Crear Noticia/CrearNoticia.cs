﻿using Protoype.Crear_Noticia;
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
	public partial class CrearNoticia : Form
	{
		ProbabilityController controller = new ProbabilityController();
		List<CheckBox> checks = new List<CheckBox>();

		public CrearNoticia() {
			InitializeComponent();
		}

		private void Form1_Load(object sender, EventArgs e) {
			checks.Add(cbx_dep);
			checks.Add(cbx_econ);
			checks.Add(cbx_pol);
		}

		private void button1_Click(object sender, EventArgs e) {
			List<string> tags = new List<string>();

			foreach (CheckBox cbx in checks) {
				if (cbx.Checked)
					tags.Add(cbx.Text);
			}

			try {
				var p = new Probability();
				p = controller.calculate(title.Text, tags, body.Text);

				prob.Text = String.Format("{0:0.00}", p.value);

				string message = "";
				foreach (string m in p.recommendations) {
					message += m + "\n";
				}

				MessageBox.Show(message);
			} catch (Exception exc) {
				prob.Text = exc.Message;
			}
		}
	}
}
