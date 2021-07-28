
namespace Protoype.Listar_Noticias
{
	partial class ListarNoticias
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
			this.btnLike = new System.Windows.Forms.Button();
			this.notaTxt = new System.Windows.Forms.TextBox();
			this.listBox1 = new System.Windows.Forms.ListBox();
			this.label1 = new System.Windows.Forms.Label();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.btnDislike = new System.Windows.Forms.Button();
			this.button1 = new System.Windows.Forms.Button();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			// 
			// btnLike
			// 
			this.btnLike.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnLike.Location = new System.Drawing.Point(28, 73);
			this.btnLike.Name = "btnLike";
			this.btnLike.Size = new System.Drawing.Size(75, 27);
			this.btnLike.TabIndex = 0;
			this.btnLike.Text = "👍🏻";
			this.btnLike.UseVisualStyleBackColor = true;
			this.btnLike.Click += new System.EventHandler(this.btnLike_Click);
			// 
			// notaTxt
			// 
			this.notaTxt.Location = new System.Drawing.Point(15, 28);
			this.notaTxt.Name = "notaTxt";
			this.notaTxt.Size = new System.Drawing.Size(183, 20);
			this.notaTxt.TabIndex = 1;
			// 
			// listBox1
			// 
			this.listBox1.FormattingEnabled = true;
			this.listBox1.Location = new System.Drawing.Point(12, 51);
			this.listBox1.Name = "listBox1";
			this.listBox1.Size = new System.Drawing.Size(230, 381);
			this.listBox1.TabIndex = 2;
			this.listBox1.SelectedValueChanged += new System.EventHandler(this.listBox1_SelectedValueChanged);
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(12, 23);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(35, 13);
			this.label1.TabIndex = 3;
			this.label1.Text = "Notas";
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.btnDislike);
			this.groupBox1.Controls.Add(this.notaTxt);
			this.groupBox1.Controls.Add(this.btnLike);
			this.groupBox1.Location = new System.Drawing.Point(264, 38);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(216, 116);
			this.groupBox1.TabIndex = 4;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Nota";
			// 
			// btnDislike
			// 
			this.btnDislike.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnDislike.Location = new System.Drawing.Point(109, 73);
			this.btnDislike.Name = "btnDislike";
			this.btnDislike.Size = new System.Drawing.Size(75, 27);
			this.btnDislike.TabIndex = 5;
			this.btnDislike.Text = "👎🏻";
			this.btnDislike.UseVisualStyleBackColor = true;
			this.btnDislike.Click += new System.EventHandler(this.btnDislike_Click);
			// 
			// button1
			// 
			this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button1.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
			this.button1.Location = new System.Drawing.Point(202, 12);
			this.button1.Margin = new System.Windows.Forms.Padding(0);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(40, 36);
			this.button1.TabIndex = 6;
			this.button1.Text = "🔄";
			this.button1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
			this.button1.UseVisualStyleBackColor = true;
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// ListarNoticias
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(507, 450);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.groupBox1);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.listBox1);
			this.Name = "ListarNoticias";
			this.Text = "ListarNoticias";
			this.groupBox1.ResumeLayout(false);
			this.groupBox1.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Button btnLike;
		private System.Windows.Forms.TextBox notaTxt;
		private System.Windows.Forms.ListBox listBox1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Button btnDislike;
		private System.Windows.Forms.Button button1;
	}
}