using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCFinal.Models
{
    public class FeedbackOrganizadorModel
    {
        [Required(ErrorMessage = "Debe ingresar el asunto")]
        [StringLength(30,ErrorMessage ="El asunto no debe exceder los 30 caracteres")]
        public string Asunto { get; set; }

        public DateTime FechaRealizado { get; set; }
        [Required(ErrorMessage = "Debe ingresar el comentario")]
        [StringLength(100, ErrorMessage = "El comentario no debe exceder los 100 caracteres")]
        public string Comentario { get; set; }
        [Required(ErrorMessage = "Debe ingresar el evento")]
        public EntidadesCompartidas.Evento EventoActual { get; set; }
        [Required(ErrorMessage = "Debe ingresar el organizador")]
        public EntidadesCompartidas.Organizador OrganizadorActual { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de lugares alquilados")]
        public List<Alquiler> listalugaresAlquilados { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de feedback")]
        public List<EntidadesCompartidas.FeedbackEvento> listaFeedbackEventoGeneral { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de feedback por lugar")]
        public List<EntidadesCompartidas.FeedbackEvento> listaFeedbackEventoPorLugar { get; set; }
        [Required(ErrorMessage = "Debe ingresar la lista de comentarios")]
        public List<EntidadesCompartidas.ComentarioFeedbackEvento> listaComentariosDeUnEvento { get; set; }

    }
}