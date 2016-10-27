using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaFeedbackLugar
    {
        void AltaFeebackLugar(FeedbackLugar e);
        void ModificarFeebackLugar(FeedbackLugar e);
        void BajaFeedbackLugar(FeedbackLugar e);
        FeedbackLugar BuscarFeedbackLugar(int IdFeedback);
        List<FeedbackLugar> ListarFeedbackLugar();
        List<FeedbackLugar> ListarFeedbackLugaresxUsuario(string CiUsuario);
        List<FeedbackLugar> ListarFeedbackdeUnLugar(string NombreLugar);
        List<FeedbackLugar> ListarFeedbackPorLugarYUsuario(string NombreLugar, string CiUsuario);
    }
}
