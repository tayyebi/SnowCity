namespace SnowBrowser
{
    partial class SplashScreen
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
            this.components = new System.ComponentModel.Container();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.explorerProgressbar1 = new VistaControls.ExplorerProgressbar();
            this.SuspendLayout();
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 64;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // explorerProgressbar1
            // 
            this.explorerProgressbar1.ForeColor = System.Drawing.Color.Red;
            this.explorerProgressbar1.Location = new System.Drawing.Point(228, 136);
            this.explorerProgressbar1.Name = "explorerProgressbar1";
            this.explorerProgressbar1.ProgressState = VistaControls.ExplorerProgressbar.States.Normal;
            this.explorerProgressbar1.Size = new System.Drawing.Size(423, 67);
            this.explorerProgressbar1.TabIndex = 0;
            this.explorerProgressbar1.Value = 50;
            // 
            // SplashScreen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::SnowBrowser.Properties.Resources.SplashScreen;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ClientSize = new System.Drawing.Size(875, 492);
            this.ControlBox = false;
            this.Controls.Add(this.explorerProgressbar1);
            this.Cursor = System.Windows.Forms.Cursors.AppStarting;
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "SplashScreen";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.ResumeLayout(false);

        }

        #endregion

        private VistaControls.ExplorerProgressbar explorerProgressbar1;
        private System.Windows.Forms.Timer timer1;
    }
}