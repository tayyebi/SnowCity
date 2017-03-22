using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Drawing;

namespace VistaControls
{
    public class ExplorerListView: ListView
    {
        public const int LVM_FIRST = 0x1000; //Value from http://www.winehq.org/pipermail/wine-devel/2002-October/009527.html
        public const int LVM_SETEXTENDEDLISTVIEWSTYLE = LVM_FIRST + 54;
        public const int LVS_EX_DOUBLEBUFFER = 0x00010000;
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern IntPtr SendMessage(IntPtr hWnd, int msg, int wParam, int lParam);
        //Imports the UXTheme DLL
        [DllImport("uxtheme", CharSet = CharSet.Unicode)]
        public extern static Int32 SetWindowTheme(IntPtr hWnd, String textSubAppName, String textSubIdList);

        public ExplorerListView()
        {
            //Unknown problem: Calling anything that affects the interface here has no effect
            //SetWindowTheme(this.Handle, "explorer", null); //Explorer style
            //SendMessage(this.Handle, LVM_SETEXTENDEDLISTVIEWSTYLE, 0, LVS_EX_DOUBLEBUFFER); //Blue selection
            this.Enter += new EventHandler(ExplorerListView_Load);
        }

        //1-time execution, to set the theme; Used to render the control at run-time without extra code
        private Boolean elv = false;
        public void ExplorerListView_Load(object sender, EventArgs e)
        {
            if (!elv)
            {
            SetWindowTheme(this.Handle, "explorer", null); //Explorer style
            SendMessage(this.Handle, LVM_SETEXTENDEDLISTVIEWSTYLE, 0, LVS_EX_DOUBLEBUFFER); //Blue selection
            elv = true;
            }
        }

    }
}
