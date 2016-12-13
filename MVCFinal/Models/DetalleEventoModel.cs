using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class DetalleEventoModel
    {
        [Required(ErrorMessage = "Debe ingresar el nombre del feedback")]
        [StringLength(30, ErrorMessage = "El nombre del feedback no debe exceder los 30 caracteres")]
        public string NombreFeedback { get; set; }

        public DateTime FechaRealizado { get; set; }
        [Required(ErrorMessage = "Debe ingresar el mensaje")]
        [StringLength(100, ErrorMessage = "El mensaje no debe exceder los 100 caracteres")]
        public string Mensaje { get; set; }
        [Required(ErrorMessage = "Debe ingresar el evento")]
        public EntidadesCompartidas.Evento EventoActual { get; set;}


        [Required(ErrorMessage = "Debe ingresar el Cliente")]
        public EntidadesCompartidas.Cliente ClienteActual { get; set; }

       

    }
}