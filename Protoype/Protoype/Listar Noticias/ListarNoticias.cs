using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Protoype.Listar_Noticias
{
	public partial class ListarNoticias : Form
	{
		List<Recommendation> recommendations = new List<Recommendation>();
		Recommendation selectedRecommendation = new Recommendation();

		public ListarNoticias() {
			InitializeComponent();

			recommendations.Add(new Recommendation {
				title = "1 - Zoom: cómo convertirse en un personaje de Pixar durante una videollamada",
				opens = 0,
				likes = 0,
			});
			recommendations.Add(new Recommendation {
				title = "2 - Cómo eliminar permanentemente una cuenta de Instagram",
				opens = 0,
				likes = 0,
			});
			recommendations.Add(new Recommendation {
				title = "3 - Google y Facebook exigirán que todos los empleados estén vacunados antes del regreso a las oficinas",
				opens = 0,
				likes = 0,
			});
			recommendations.Add(new Recommendation {
				title = "4 - WhatsApp prepara función para transferir chats entre iOS y Android",
				opens = 0,
				likes = 0,
			});
			recommendations.Add(new Recommendation {
				title = "5 - Cómo usar la función de Mejores Amigos en Instagram",
				opens = 0,
				likes = 0,
			});

			foreach (var nota in recommendations) {
				listBox1.Items.Add(nota.title);
			}
		}

		private void listBox1_SelectedValueChanged(object sender, EventArgs e) {
			try {
				if (((ListBox)sender).SelectedItem == null) {
					return;
				}

				string item = ((ListBox)sender).SelectedItem.ToString();
				Recommendation rec = recommendations.First(r => r.title == item);
				rec.opens++;
				notaTxt.Text = rec.title;
				openTxt.Text = rec.opens.ToString();
				likeTxt.Text = rec.likes.ToString();
				selectedRecommendation = rec;
			} catch (Exception err) {
				Console.Write(err.Message);
			}
		}

		private void btnLike_Click(object sender, EventArgs e) {
			selectedRecommendation.likes++;
		}

		private void btnDislike_Click(object sender, EventArgs e) {
			selectedRecommendation.likes--;
		}

		private void button1_Click(object sender, EventArgs e) {
			foreach (Recommendation rec in recommendations) {
				rec.calculate();
			}

			recommendations = recommendations.OrderByDescending(rec => rec.value).ToList();

			listBox1.Items.Clear();
			foreach (var nota in recommendations) {
				listBox1.Items.Add(nota.title);
			}
		}
	}
}
