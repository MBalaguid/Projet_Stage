﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace paradis_des_huiles
{
    static class Program
    {
        /// <summary>
        /// Point d'entrée principal de l'application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            
                Application.EnableVisualStyles();
                //Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(Program.form1);
            
        }
        public static Form1 form1 = new Form1();
    }
}
