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

        private void modoPagoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ModoPago frmpago = new ModoPago();
            frmpago.Show();
        }

        private void documentoIdentidadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TipoDocumentoIdentidad frmdocumentoidentidad = new TipoDocumentoIdentidad();
            frmdocumentoidentidad.Show();
        }
    }
}
