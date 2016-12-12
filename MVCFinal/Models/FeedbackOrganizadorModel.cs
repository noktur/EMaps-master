using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class FeedbackOrganizadorModel
    {
        public string Asunto { get; set; }

        public DateTime FechaRealizado { get; set; }

        public string Comentario { get; set; }

        public EntidadesCompartidas.Evento EventoActual { get; set; }

        public EntidadesCompartidas.Organizador OrganizadorActual { get; set; }

        public List<Alquiler> listalugaresAlquilados { get; set; }

        public List<EntidadesCompartidas.FeedbackEvento> listaFeedbackEventoGeneral { get; set; }

        public List<EntidadesCompartidas.FeedbackEvento> listaFeedbackEventoPorLugar { get; set; }

        public List<EntidadesCompartidas.ComentarioFeedbackEvento> listaComentariosDeUnEvento { get; set; }

    }
}