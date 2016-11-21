using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class DetalleEventoModel
    {

        public string NombreFeedback { get; set; }

        public DateTime FechaRealizado { get; set; }

        public string Mensaje { get; set; }

        public EntidadesCompartidas.Evento EventoActual { get; set;}

      

        public EntidadesCompartidas.Cliente ClienteActual { get; set; }

       

    }
}