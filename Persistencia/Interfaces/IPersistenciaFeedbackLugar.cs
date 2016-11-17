using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaFeedbackLugar
    {
        void AltaMensajeFeebackLugar(FeedbackLugar e);
        void ModificarMensajeFeebackLugar(FeedbackLugar e);
        void BajaMensajeFeedbackLugar(FeedbackLugar e);
        FeedbackLugar BuscarMensajeFeedbackLugar(int IdFeedback);
        List<FeedbackLugar> ListarMensajesFeedbackLugar();
        List<FeedbackLugar> ListarMensajesFeedbackLugaresxUsuario(string CiUsuario);
        List<FeedbackLugar> ListarMensajesFeedbackdeUnLugar(string NombreLugar);
        List<FeedbackLugar> ListarMensajesFeedbackPorLugarYUsuario(string NombreLugar, string CiUsuario);
    }
}
