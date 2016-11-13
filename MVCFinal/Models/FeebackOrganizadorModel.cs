using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class FeebackOrganizadorModel
    {
        public string NombreFeedback { get; set; }

        public DateTime FechaRealizado { get; set; }

        public string Mensaje { get; set; }

        public EntidadesCompartidas.Evento EventoActual { get; set; }

        public EntidadesCompartidas.Organizador OrganizadorActual { get; set; }

        public List<Alquiler> listalugaresAlquilados { get; set; }

        public List<EntidadesCompartidas.Cliente> listaClientes { get; set; }

    }
}