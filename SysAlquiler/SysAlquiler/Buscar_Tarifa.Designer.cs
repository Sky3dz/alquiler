namespace SysAlquiler
{
    partial class Buscar_Tarifa
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.txt_buscanom = new System.Windows.Forms.TextBox();
            this.dgv_tarif = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_tarif)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(192, 13);
            this.label1.TabIndex = 11;
            this.label1.Text = "Buscar Tarifa por Nombre de Concepto";
            // 
            // txt_buscanom
            // 
            this.txt_buscanom.Location = new System.Drawing.Point(12, 25);
            this.txt_buscanom.Name = "txt_buscanom";
            this.txt_buscanom.Size = new System.Drawing.Size(245, 20);
            this.txt_buscanom.TabIndex = 10;
            // 
            // dgv_tarif
            // 
            this.dgv_tarif.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(122)))), ((int)(((byte)(204)))));
            this.dgv_tarif.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_tarif.GridColor = System.Drawing.Color.Gray;
            this.dgv_tarif.Location = new System.Drawing.Point(12, 51);
            this.dgv_tarif.Name = "dgv_tarif";
            this.dgv_tarif.Size = new System.Drawing.Size(495, 325);
            this.dgv_tarif.TabIndex = 9;
            // 
            // Buscar_Tarifa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SlateGray;
            this.ClientSize = new System.Drawing.Size(524, 384);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txt_buscanom);
            this.Controls.Add(this.dgv_tarif);
            this.Name = "Buscar_Tarifa";
            this.Opacity = 0.9D;
            this.Text = "Buscar Tarifa";
            ((System.ComponentModel.ISupportInitialize)(this.dgv_tarif)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txt_buscanom;
        private System.Windows.Forms.DataGridView dgv_tarif;
    }
}