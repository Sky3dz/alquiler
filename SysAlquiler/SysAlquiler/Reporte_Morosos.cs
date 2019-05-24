using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SysAlquiler
{
    public partial class Reporte_Morosos : Form
    {
        DateTimePicker dtp = new DateTimePicker();
        Rectangle _Rectangle;
        public Reporte_Morosos()
        {
            InitializeComponent();
            dataGridViewReporte.Controls.Add(dtp);
            dtp.Visible = false;
            dtp.Format = DateTimePickerFormat.Custom;
            dtp.TextChanged += new EventHandler(dtp_TextChange);

        }

        private void dataGridViewReporte_CellClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        private void dtp_TextChange(object sender, EventArgs e)
        {
            dataGridViewReporte.CurrentCell.Value = dtp.Text.ToString();
        }

        private void dataGridViewReporte_ColumnWidthChanged(object sender, DataGridViewColumnEventArgs e)
        {
            dtp.Visible = false;
        }

        private void dataGridViewReporte_Scroll(object sender, ScrollEventArgs e)
        {
            dtp.Visible = false;
        }

        private void btnsalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult dialogo = MessageBox.Show("¿Desea cerrar el programa?",
               "Cerrar el programa", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dialogo == DialogResult.No)
            {
                e.Cancel = true;
            }
            else
            {
                e.Cancel = false;
            }
        }
    }
}

