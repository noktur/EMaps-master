using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.Interfaces
{
    public interface ILogicaFeedbackEvento
    {
        void AltaMensajeFeebackEvento(FeedbackEvento e);
        void ModificarMensajeFeebackEvento(FeedbackEvento e);
        void BajaMensajeFeedbackEvento(FeedbackEvento e);
        FeedbackEvento BuscarMensajeFeedbackEvento(int IdFeedback);
        List<FeedbackEvento> ListarMensajesFeedbackEvento();
        List<FeedbackEvento> ListarMensajesFeedbackEventoxUsuario(string CiUsuario);
        List<FeedbackEvento> ListarMensajesFeedbackPorEvento(int IdEvento);
        List<FeedbackEvento> ListarMensajesFeedbackPorEventoYUsuario(int IdEvento, string CiUsuario);
    }
}
