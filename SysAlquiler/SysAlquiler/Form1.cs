﻿using System;
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

        private void tarifaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Tarifa t = new Tarifa();

            t.ShowDialog();
        }

        private void reporteMorososToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Reporte_Morosos rpt = new Reporte_Morosos();
            rpt.Show();
        }

        private void monedaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Re_tip_medio_com a = new Re_tip_medio_com();
            a.Show();
        }

        private void tipoMedioComunicacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Reg_moneda b = new Reg_moneda();
            b.Show();
        }

        private void enviosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Envio_Archivo env = new Envio_Archivo();
            env.Show();
        }
    }
}
