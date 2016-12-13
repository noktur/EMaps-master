using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class FeebackAdminModel
    {
        [Required(ErrorMessage = "Debe ingresar el feedback seleccionado")]
        public EntidadesCompartidas.FeedbackEvento FeedbackSeleccionado { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de feedback")]
        public List<EntidadesCompartidas.FeedbackEvento> listaFeedback { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de comentarios")]
        public List<EntidadesCompartidas.ComentarioFeedbackEvento> listaComentariosFeedback { get; set; }


             
    }
}