namespace WBrowser
{
    partial class DeleteBrowsingHistory
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
            this.TempFiles = new System.Windows.Forms.CheckBox();
            this.History = new System.Windows.Forms.CheckBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // TempFiles
            // 
            this.TempFiles.AutoSize = true;
            this.TempFiles.BackColor = System.Drawing.Color.White;
            this.TempFiles.Font = new System.Drawing.Font("Tahoma", 7F);
            this.TempFiles.ForeColor = System.Drawing.Color.Black;
            this.TempFiles.Location = new System.Drawing.Point(11, 11);
            this.TempFiles.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.TempFiles.Name = "TempFiles";
            this.TempFiles.Size = new System.Drawing.Size(107, 16);
            this.TempFiles.TabIndex = 0;
            this.TempFiles.Text = "صفحات ذخیره شده";
            this.TempFiles.UseVisualStyleBackColor = false;
            // 
            // History
            // 
            this.History.AutoSize = true;
            this.History.BackColor = System.Drawing.Color.White;
            this.History.Font = new System.Drawing.Font("Tahoma", 7F);
            this.History.ForeColor = System.Drawing.Color.Black;
            this.History.Location = new System.Drawing.Point(11, 71);
            this.History.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.History.Name = "History";
            this.History.Size = new System.Drawing.Size(57, 16);
            this.History.TabIndex = 1;
            this.History.Text = "تاریخچه";
            this.History.UseVisualStyleBackColor = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.White;
            this.label1.Font = new System.Drawing.Font("Tahoma", 7F);
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(29, 88);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(136, 12);
            this.label1.TabIndex = 2;
            this.label1.Text = "فهرستی از صفحات بازدید شده";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.White;
            this.label2.Font = new System.Drawing.Font("Tahoma", 7F);
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(29, 31);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Padding = new System.Windows.Forms.Padding(0, 0, 0, 6);
            this.label2.Size = new System.Drawing.Size(264, 18);
            this.label2.TabIndex = 3;
            this.label2.Text = "صفحات،تصاویر و دیگر فایل های ذخیره شده برای مرور سریع تر";
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.White;
            this.button1.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.button1.Font = new System.Drawing.Font("Tahoma", 7F);
            this.button1.ForeColor = System.Drawing.Color.Black;
            this.button1.Location = new System.Drawing.Point(72, 121);
            this.button1.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(62, 19);
            this.button1.TabIndex = 5;
            this.button1.Text = "حذف";
            this.button1.UseVisualStyleBackColor = false;
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.Color.White;
            this.button2.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.button2.Font = new System.Drawing.Font("Tahoma", 7F);
            this.button2.ForeColor = System.Drawing.Color.Black;
            this.button2.Location = new System.Drawing.Point(139, 121);
            this.button2.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(62, 19);
            this.button2.TabIndex = 6;
            this.button2.Text = "انصراف";
            this.button2.UseVisualStyleBackColor = false;
            // 
            // DeleteBrowsingHistory
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(5F, 11F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(299, 151);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.History);
            this.Controls.Add(this.TempFiles);
            this.Font = new System.Drawing.Font("Tahoma", 7F);
            this.ForeColor = System.Drawing.Color.Black;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Margin = new System.Windows.Forms.Padding(2, 3, 2, 3);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "DeleteBrowsingHistory";
            this.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.RightToLeftLayout = true;
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "پاک کردن تاریخچه";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        public System.Windows.Forms.CheckBox TempFiles;
        public System.Windows.Forms.CheckBox History;
    }
}