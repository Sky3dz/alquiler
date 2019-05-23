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
    public partial class FrmMnuAlquiler : Form
    {
        public FrmMnuAlquiler()
        {
            InitializeComponent();
        }

        private void oficinaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Oficina ofi = new Oficina();
            ofi.Show();
        }

        private void oficinaServicioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OficinaServicio ofiser = new OficinaServicio();
            ofiser.Show();
        }

        private void modoDePagoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ModoPago mpago = new ModoPago();
            mpago.Show();
        }

        private void documentoIdentidadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TipoDocumentoIdentidad documentoiden = new TipoDocumentoIdentidad();
            documentoiden.Show();
        }
    }
}
