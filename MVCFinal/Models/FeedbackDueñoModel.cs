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
        [Required(ErrorMessage = "Debe ingresar el dueño")]
        public EntidadesCompartidas.Dueño DueñoActual { get; set; }
        [Required(ErrorMessage = "Debe ingresar el feedback del lugar")]
        public EntidadesCompartidas.FeedbackLugar feedbackAsociado { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de lugares")]
        public List<Lugar> listalugaresPropios { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de feedback")]
        public List<EntidadesCompartidas.FeedbackLugar> listaFeedbackSeleccionado { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de feedback general")]
        public List<EntidadesCompartidas.FeedbackLugar> listaFeedbackGeneral { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de comentarios mensaje seleccionado")]
        public List<EntidadesCompartidas.ComentarioFeedbackLugar> listaComentariosMensajeSeleccionado { get; set; }



    }
}