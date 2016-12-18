using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class PlanoModel
    {
        [Required(ErrorMessage = "Debe ingresar el mapa")]
        public EntidadesCompartidas.Mapa elMapa { get; set; }
        [Required(ErrorMessage = "Debe ingresar las areas del plano")]
        public List<EntidadesCompartidas.Area> ListaAreasPlano { get; set; }

    }
}