using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.Interfaces
{
    public interface ILogicaComentariosFeedbackLugar
    {
        void AltaComentarioFeebackLugar(ComentarioFeedbackLugar e);
        void ModificarComentarioFeebackLugar(ComentarioFeedbackLugar e);
        void BajaComentarioFeedbackLugar(ComentarioFeedbackLugar e);
        ComentarioFeedbackLugar BuscarComentarioDeunMensajeFeedbackLugar(int IdFeedback, int IdComentario);
        List<ComentarioFeedbackLugar> ListarComentariosFeedbackLugar();
        List<ComentarioFeedbackLugar> ListarComentariosFeedbackLugarxUsuario(string CiUsuario);
        List<ComentarioFeedbackLugar> ListarComentariosdeUnMensajeFeedbackLugar(int IdFeedback);
    }
}
