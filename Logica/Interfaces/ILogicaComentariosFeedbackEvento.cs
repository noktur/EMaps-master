using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.Interfaces
{
    public interface ILogicaComentariosFeedbackEvento
    {
        void AltaComentarioFeebackEvento(ComentarioFeedbackEvento e);
        void ModificarComentarioFeebackEvento(ComentarioFeedbackEvento e);
        void BajaComentarioFeedbackEvento(ComentarioFeedbackEvento e);
        ComentarioFeedbackEvento BuscarComentarioDeunMensajeFeedbackEvento(int IdFeedback, int IdComentario);
        List<ComentarioFeedbackEvento> ListarComentariosFeedbackEvento();
        List<ComentarioFeedbackEvento> ListarComentariosFeedbackEventoxUsuario(string CiUsuario);
        List<ComentarioFeedbackEvento> ListarComentariosdeUnMensajeFeedbackEvento(int IdFeedback);
    }
}
