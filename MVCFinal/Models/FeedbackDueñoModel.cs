using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class FeedbackDueñoModel
    {
        public string AsuntoComentario { get; set; }

        public DateTime FechaRealizado { get; set; }

        public string Comentario { get; set; }

        public EntidadesCompartidas.Evento EventoActual { get; set; }

        public EntidadesCompartidas.Dueño DueñoActual { get; set; }

        public EntidadesCompartidas.FeedbackLugar feedbackAsociado { get; set; }

        public List<Lugar> listalugaresPropios { get; set; }

        public List<EntidadesCompartidas.FeedbackLugar> listaFeedbackSeleccionado { get; set; }

        public List<EntidadesCompartidas.FeedbackLugar> listaFeedbackGeneral { get; set; }
        public List<EntidadesCompartidas.ComentarioFeedbackLugar> listaComentariosMensajeSeleccionado { get; set; }



    }
}