using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Models
{
    public class PaisModel
    {
        public string NombrePais { get; set; }
        public float CoordenadaX { get; set; }
        public float CoordenadaY { get; set; }

        public string CodPais { get; set; }

        

    }
}