using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class FeedbackDueñoModel
    {
        [Required(ErrorMessage = "Debe ingresar el asunto del comentario")]
        [StringLength(30,ErrorMessage ="El asunto no puede exceder los 30 caracteres")]
        public string AsuntoComentario { get; set; }

        public DateTime FechaRealizado { get; set; }
        [Required(ErrorMessage = "Debe ingresar el comentario")]
        [StringLength(100,ErrorMessage ="El comentario no puede exceder los 100 comentarios")]
        public string Comentario { get; set; }
        [Required(ErrorMessage = "Debe ingresar el evento")]
        public EntidadesCompartidas.Evento EventoActual { get; set; }
        public EntidadesCompartidas.Dueño DueñoActual { get; set; }
        public EntidadesCompartidas.FeedbackLugar feedbackAsociado { get; set; }
        public List<Lugar> listalugaresPropios { get; set; }
        public List<EntidadesCompartidas.FeedbackLugar> listaFeedbackSeleccionado { get; set; }
        public List<EntidadesCompartidas.FeedbackLugar> listaFeedbackGeneral { get; set; }
        public List<EntidadesCompartidas.ComentarioFeedbackLugar> listaComentariosMensajeSeleccionado { get; set; }



    }
}