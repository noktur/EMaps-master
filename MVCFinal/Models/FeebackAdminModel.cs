using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class FeebackAdminModel
    {

        public EntidadesCompartidas.FeedbackEvento FeedbackSeleccionado { get; set; }

        public List<EntidadesCompartidas.FeedbackEvento> listaFeedback { get; set; }

        public List<EntidadesCompartidas.ComentarioFeedbackEvento> listaComentariosFeedback { get; set; }


             
    }
}