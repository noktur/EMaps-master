using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
    internal class LogicaFeedbackLugar:ILogicaFeedbackLugar
    {
         #region Singleton

        private static LogicaFeedbackLugar _instance = null;
        private LogicaFeedbackLugar() { }
        public static LogicaFeedbackLugar GetInstancia()
        {
            if (_instance == null)
                _instance = new LogicaFeedbackLugar();

            return _instance;
        }

        #endregion


        public void AltaMensajeFeebackLugar(FeedbackLugar e)
        {
            FabricaPersistencia.getPersistenciaFeedbackLugar().AltaMensajeFeebackLugar(e);
        }
        public void ModificarMensajeFeebackLugar(FeedbackLugar e)
        {
            FabricaPersistencia.getPersistenciaFeedbackLugar().ModificarMensajeFeebackLugar(e);
        }
        public void BajaMensajeFeedbackLugar(FeedbackLugar e)
        {
            FabricaPersistencia.getPersistenciaFeedbackLugar().BajaMensajeFeedbackLugar(e);
        }
        public FeedbackLugar BuscarMensajeFeedbackLugar(int IdFeedback)
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().BuscarMensajeFeedbackLugar(IdFeedback);
        }
        public List<FeedbackLugar> ListarMensajesFeedbackLugar()
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().ListarMensajesFeedbackLugar();
        }
        public List<FeedbackLugar> ListarMensajesFeedbackLugaresxUsuario(string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().ListarMensajesFeedbackLugaresxUsuario(CiUsuario);
        }
        public List<FeedbackLugar> ListarMensajesFeedbackdeUnLugar(string NombreLugar)
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().ListarMensajesFeedbackdeUnLugar(NombreLugar);
        }
        public List<FeedbackLugar> ListarMensajesFeedbackPorLugarYUsuario(string NombreLugar, string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().ListarMensajesFeedbackPorLugarYUsuario(NombreLugar,CiUsuario);
        }

    }
}
