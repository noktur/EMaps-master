using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaFeedbackEvento
    {
        void AltaFeebackEvento(FeedbackEvento e);
        void ModificarFeebackEvento(FeedbackEvento e);
        void BajaFeedbackEvento(FeedbackEvento e);
        FeedbackEvento BuscarFeedbackEvento(int IdFeedback);
        List<FeedbackEvento> ListarFeedbackEvento();
        List<FeedbackEvento> ListarFeedbackEventoxUsuario(string CiUsuario);
        List<FeedbackEvento> ListarFeedbackPorEvento(int IdEvento);
        List<FeedbackEvento> ListarFeedbackPorEventoYUsuario(int IdEvento, string CiUsuario);
    }
}
