using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Drawing;

namespace VistaControls
{
    public partial class ExplorerTaskDialog : Component
    {
        //[DllImport("CommCtrl.dll", CharSet = CharSet.Unicode)]
        //IntPtr TaskDialogIndirect (IntPtr TASKDIALOGCONFIG pTaskConfig, int pnButton, int pnRadioButton, bool *pfVerificationFlagChecked );
        public ExplorerTaskDialog()
        {
            InitializeComponent();
        }

        public ExplorerTaskDialog(IContainer container)
        {
            container.Add(this);

            InitializeComponent();
        }
    }
}
