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
    public partial class Tarifa : Form
    {
        public Tarifa()
        {
            InitializeComponent();
        }

        private void btn_buscarconcp_Click(object sender, EventArgs e)
        {
            Buscar_Concepto_T bc = new Buscar_Concepto_T();
            bc.ShowDialog();
        }

        private void btn_buscar_tarifa_Click(object sender, EventArgs e)
        {
            Buscar_Tarifa bt = new Buscar_Tarifa();
            bt.ShowDialog();
        }
    }
}
