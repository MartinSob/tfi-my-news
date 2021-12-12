using System;
using System.Collections;
using System.IO;
using IronPdf;

namespace BusinessLogic
{
	public abstract class ReportTemplateBl
	{
		protected IList goodList;
		protected IList badList;

		public void calculateResult() {
			try {
				getData();
				calculateProps();
			} catch (Exception e) {
				Console.WriteLine(e);
			}
		}

		protected abstract void getData();
		protected abstract void calculateProps();

		public IList getResult() {
			return goodList;
		}
		public IList getNegativeResult() {
			return badList;
		}

		public void createPDF(string htmlFile, string path) {
			ChromePdfRenderer Renderer = new ChromePdfRenderer();
			Renderer.RenderHtmlAsPdf(htmlFile).SaveAs(path + "..\\..\\Backups\\report.pdf");
		}

		public byte[] downloadPDF(string path) {
			return System.IO.File.ReadAllBytes(path + "..\\..\\Backups\\report.pdf");
		}

		public StreamWriter getCSVStremWriter(string path) {
			return new StreamWriter(path + "..\\..\\Backups\\report.csv");
		}

		public string getCSVPath(string path) {
			return path + "..\\..\\Backups\\report.csv";
		}
	}
}
