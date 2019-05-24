namespace SysAlquiler
{
    partial class Reporte_Morosos
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
            this.btnsalir = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.btnbuscar = new System.Windows.Forms.Button();
            this.dataGridViewReporte = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.columna_nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.columna_fecfinal = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewReporte)).BeginInit();
            this.SuspendLayout();
            // 
            // btnsalir
            // 
            this.btnsalir.Location = new System.Drawing.Point(217, 271);
            this.btnsalir.Name = "btnsalir";
            this.btnsalir.Size = new System.Drawing.Size(75, 23);
            this.btnsalir.TabIndex = 13;
            this.btnsalir.Text = "Salir";
            this.btnsalir.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 11);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(93, 13);
            this.label2.TabIndex = 12;
            this.label2.Text = "Mostrar fecha por:";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "Personalizado",
            "Hoy",
            "Ultima semana",
            "Ultimo mes",
            "Ultimo año"});
            this.comboBox1.Location = new System.Drawing.Point(27, 27);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 21);
            this.comboBox1.TabIndex = 11;
            // 
            // btnbuscar
            // 
            this.btnbuscar.Location = new System.Drawing.Point(217, 27);
            this.btnbuscar.Name = "btnbuscar";
            this.btnbuscar.Size = new System.Drawing.Size(75, 23);
            this.btnbuscar.TabIndex = 10;
            this.btnbuscar.Text = "Buscar";
            this.btnbuscar.UseVisualStyleBackColor = true;
            // 
            // dataGridViewReporte
            // 
            this.dataGridViewReporte.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewReporte.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.columna_nombre,
            this.Column2,
            this.columna_fecfinal,
            this.Column4,
            this.Column3});
            this.dataGridViewReporte.Location = new System.Drawing.Point(12, 76);
            this.dataGridViewReporte.Name = "dataGridViewReporte";
            this.dataGridViewReporte.Size = new System.Drawing.Size(643, 176);
            this.dataGridViewReporte.TabIndex = 9;
            // 
            // Column1
            // 
            this.Column1.HeaderText = "Nro";
            this.Column1.Name = "Column1";
            // 
            // columna_nombre
            // 
            this.columna_nombre.HeaderText = "Nombre";
            this.columna_nombre.Name = "columna_nombre";
            // 
            // Column2
            // 
            this.Column2.HeaderText = "Numero de documento";
            this.Column2.Name = "Column2";
            // 
            // columna_fecfinal
            // 
            this.columna_fecfinal.HeaderText = "Fecha registro";
            this.columna_fecfinal.Name = "columna_fecfinal";
            this.columna_fecfinal.Width = 200;
            // 
            // Column4
            // 
            this.Column4.HeaderText = "Fecha de vencimiento";
            this.Column4.Name = "Column4";
            // 
            // Column3
            // 
            this.Column3.HeaderText = "Deuda";
            this.Column3.Name = "Column3";
            // 
            // Reporte_Morosos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(668, 320);
            this.Controls.Add(this.btnsalir);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.btnbuscar);
            this.Controls.Add(this.dataGridViewReporte);
            this.Name = "Reporte_Morosos";
            this.Text = "Reporte_Morosos";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewReporte)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnsalir;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button btnbuscar;
        private System.Windows.Forms.DataGridView dataGridViewReporte;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn columna_nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn columna_fecfinal;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
    }
}