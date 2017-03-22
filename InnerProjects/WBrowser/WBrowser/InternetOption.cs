// Goga Claudia
//WBrowser 2009
//Email : goga.claudia@gmail.com
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WBrowser
{
    public partial class InternetOption : Form
    {
        String adresa;
        public InternetOption(String adresa)
        {
            this.adresa = adresa;
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        { 
            homepage.Text="about:blank";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            homepage.Text = adresa;
        }


        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void InternetOption_Load(object sender, EventArgs e)
        {

        }

      
    }
}
