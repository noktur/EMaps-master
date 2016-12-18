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
        [Required(ErrorMessage = "Debe ingresar el nombre del pais")]
        [StringLength(30,ErrorMessage = "El nombre del pais no puede exceder los 30 caracteres")]
        public string NombrePais { get; set; }

 
        public float CoordenadaX { get; set; }
        
        public float CoordenadaY { get; set; }

        [Required(ErrorMessage = "Debe ingresar el codigo del pais")]
        [StringLength(4,ErrorMessage ="El codigo del pais no puede exceder los 4 caracteres de longitud")]
        public string CodPais { get; set; }

        [Required(ErrorMessage = "Debe ingresar los paises")]
        public List<EntidadesCompartidas.Pais> milista { get; set; }
        

    }
}