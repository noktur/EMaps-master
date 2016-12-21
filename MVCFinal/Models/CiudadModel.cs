using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class CiudadModel
    {
        [Required(ErrorMessage = "Debe ingresar el nombre del pais")]
        [StringLength(30,ErrorMessage = "El nombre del pais no puede exceder los 30 caracteres")]
        public string NombrePais { get; set; }
        public float CoordenadaX { get; set; }
        public float CoordenadaY { get; set; }
        [Required(ErrorMessage = "Debe ingresar el nombre de la ciudad")]
        [StringLength(30,ErrorMessage ="El nombre de la ciudad no puede exceder los 30 caracteres")]
        public string NombreCiudad { get; set; }

        public List<EntidadesCompartidas.Ciudad> milista { get; set; }
    }
}