using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Drawing;

namespace VistaControls
{
    class CueTextBox:TextBox
    {
        private string cuetext_ = "";
        public string CueText
        {
            get
            {
                return cuetext_;
            }
            set
            {
                cuetext_ = value;
                this.SetCueText(this.cuetext_);
            }
        }
        public void SetCueText(string Cue_Text)
        {
            VistaControls.VistaConstants.SendMessage(this.Handle, VistaControls.VistaConstants.EM_SETCUEBANNER, IntPtr.Zero, Cue_Text);
        }
    }
}
