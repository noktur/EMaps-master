﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class AdminModel
    {


        public string Usuario { get; set; }
        public string Password { get; set; }


        public string Nombre { get; set; }

        public string Ci { get; set; }

        public string Email { get; set; }

    }
}