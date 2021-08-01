
namespace Protoype
{
	partial class CrearNoticia
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing) {
			if (disposing && (components != null)) {
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent() {
			this.button1 = new System.Windows.Forms.Button();
			this.title = new System.Windows.Forms.TextBox();
			this.body = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.cbx_dep = new System.Windows.Forms.CheckBox();
			this.Tags = new System.Windows.Forms.GroupBox();
			this.label9 = new System.Windows.Forms.Label();
			this.label8 = new System.Windows.Forms.Label();
			this.label7 = new System.Windows.Forms.Label();
			this.cbx_pol = new System.Windows.Forms.CheckBox();
			this.cbx_econ = new System.Windows.Forms.CheckBox();
			this.label1 = new System.Windows.Forms.Label();
			this.prob = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.Tags.SuspendLayout();
			this.SuspendLayout();
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(81, 346);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(75, 40);
			this.button1.TabIndex = 1;
			this.button1.Text = "Calcular exito";
			this.button1.UseVisualStyleBackColor = true;
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// title
			// 
			this.title.Location = new System.Drawing.Point(81, 12);
			this.title.Name = "title";
			this.title.Size = new System.Drawing.Size(162, 20);
			this.title.TabIndex = 2;
			this.title.Text = "Titulo de nota";
			// 
			// body
			// 
			this.body.Location = new System.Drawing.Point(81, 166);
			this.body.Multiline = true;
			this.body.Name = "body";
			this.body.Size = new System.Drawing.Size(162, 174);
			this.body.TabIndex = 3;
			this.body.Text = "Esto es\r\n\r\nun \r\n\r\nejemplo";
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(12, 15);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(33, 13);
			this.label2.TabIndex = 5;
			this.label2.Text = "Titulo";
			// 
			// label3
			// 
			this.label3.AutoSize = true;
			this.label3.Location = new System.Drawing.Point(12, 169);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(41, 13);
			this.label3.TabIndex = 6;
			this.label3.Text = "Cuerpo";
			// 
			// cbx_dep
			// 
			this.cbx_dep.AutoSize = true;
			this.cbx_dep.Location = new System.Drawing.Point(38, 36);
			this.cbx_dep.Name = "cbx_dep";
			this.cbx_dep.Size = new System.Drawing.Size(69, 17);
			this.cbx_dep.TabIndex = 7;
			this.cbx_dep.Text = "Deportes";
			this.cbx_dep.UseVisualStyleBackColor = true;
			// 
			// Tags
			// 
			this.Tags.Controls.Add(this.label9);
			this.Tags.Controls.Add(this.label8);
			this.Tags.Controls.Add(this.label7);
			this.Tags.Controls.Add(this.cbx_pol);
			this.Tags.Controls.Add(this.cbx_econ);
			this.Tags.Controls.Add(this.cbx_dep);
			this.Tags.Location = new System.Drawing.Point(81, 38);
			this.Tags.Name = "Tags";
			this.Tags.Size = new System.Drawing.Size(293, 122);
			this.Tags.TabIndex = 8;
			this.Tags.TabStop = false;
			this.Tags.Text = "Etiquetas";
			// 
			// label9
			// 
			this.label9.AutoSize = true;
			this.label9.Location = new System.Drawing.Point(113, 83);
			this.label9.Name = "label9";
			this.label9.Size = new System.Drawing.Size(167, 13);
			this.label9.TabIndex = 16;
			this.label9.Text = "AvgPals: 3 | Abiertos: 3 | Leidos: 2";
			// 
			// label8
			// 
			this.label8.AutoSize = true;
			this.label8.Location = new System.Drawing.Point(113, 60);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(167, 13);
			this.label8.TabIndex = 15;
			this.label8.Text = "AvgPals: 5 | Abiertos: 5 | Leidos: 3";
			// 
			// label7
			// 
			this.label7.AutoSize = true;
			this.label7.Location = new System.Drawing.Point(113, 37);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(167, 13);
			this.label7.TabIndex = 14;
			this.label7.Text = "AvgPals: 2 | Abiertos: 2 | Leidos: 1";
			// 
			// cbx_pol
			// 
			this.cbx_pol.AutoSize = true;
			this.cbx_pol.Checked = true;
			this.cbx_pol.CheckState = System.Windows.Forms.CheckState.Checked;
			this.cbx_pol.Location = new System.Drawing.Point(38, 82);
			this.cbx_pol.Name = "cbx_pol";
			this.cbx_pol.Size = new System.Drawing.Size(60, 17);
			this.cbx_pol.TabIndex = 9;
			this.cbx_pol.Text = "Politica";
			this.cbx_pol.UseVisualStyleBackColor = true;
			// 
			// cbx_econ
			// 
			this.cbx_econ.AutoSize = true;
			this.cbx_econ.Location = new System.Drawing.Point(38, 59);
			this.cbx_econ.Name = "cbx_econ";
			this.cbx_econ.Size = new System.Drawing.Size(73, 17);
			this.cbx_econ.TabIndex = 8;
			this.cbx_econ.Text = "Economia";
			this.cbx_econ.UseVisualStyleBackColor = true;
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(162, 346);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(68, 13);
			this.label1.TabIndex = 9;
			this.label1.Text = "Probabilidad:";
			// 
			// prob
			// 
			this.prob.AutoSize = true;
			this.prob.Location = new System.Drawing.Point(170, 367);
			this.prob.Name = "prob";
			this.prob.Size = new System.Drawing.Size(0, 13);
			this.prob.TabIndex = 10;
			// 
			// label4
			// 
			this.label4.AutoSize = true;
			this.label4.Location = new System.Drawing.Point(257, 169);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(91, 13);
			this.label4.TabIndex = 11;
			this.label4.Text = "Posts abiertos: 15";
			// 
			// label5
			// 
			this.label5.AutoSize = true;
			this.label5.Location = new System.Drawing.Point(257, 222);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(85, 13);
			this.label5.TabIndex = 12;
			this.label5.Text = "Prom Parrafos: 2";
			// 
			// label6
			// 
			this.label6.AutoSize = true;
			this.label6.Location = new System.Drawing.Point(257, 195);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(81, 13);
			this.label6.TabIndex = 13;
			this.label6.Text = "Posts leidos: 10";
			// 
			// CrearNoticia
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(386, 408);
			this.Controls.Add(this.label6);
			this.Controls.Add(this.label5);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.prob);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.Tags);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.body);
			this.Controls.Add(this.title);
			this.Controls.Add(this.button1);
			this.Name = "CrearNoticia";
			this.Text = "Crear nota";
			this.Load += new System.EventHandler(this.Form1_Load);
			this.Tags.ResumeLayout(false);
			this.Tags.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.TextBox title;
		private System.Windows.Forms.TextBox body;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.CheckBox cbx_dep;
		private System.Windows.Forms.GroupBox Tags;
		private System.Windows.Forms.CheckBox cbx_pol;
		private System.Windows.Forms.CheckBox cbx_econ;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label prob;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.Label label8;
	}
}

