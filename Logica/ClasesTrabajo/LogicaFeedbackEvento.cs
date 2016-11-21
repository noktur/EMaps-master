using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
     internal class LogicaFeedbackEvento:ILogicaFeedbackEvento
    {

          #region Singleton

        private static LogicaFeedbackEvento _instance = null;
        private LogicaFeedbackEvento() { }
        public static LogicaFeedbackEvento GetInstancia()
        {
            if (_instance == null)
                _instance = new LogicaFeedbackEvento();

            return _instance;
        }

        #endregion

        public void AltaMensajeFeebackEvento(FeedbackEvento e)
        {
            FabricaPersistencia.getPersistenciaFeedbakEvento().AltaMensajeFeebackEvento(e);
        }
        public void ModificarMensajeFeebackEvento(FeedbackEvento e)
        {
            FabricaPersistencia.getPersistenciaFeedbakEvento().ModificarMensajeFeebackEvento(e);
        }
        public void BajaMensajeFeedbackEvento(FeedbackEvento e)
        {
            FabricaPersistencia.getPersistenciaFeedbakEvento().BajaMensajeFeedbackEvento(e);
        }
        public FeedbackEvento BuscarMensajeFeedbackEvento(int IdFeedback)
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().BuscarMensajeFeedbackEvento(IdFeedback);
        }
        public List<FeedbackEvento> ListarMensajesFeedbackEvento()
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().ListarMensajesFeedbackEvento();
        }
        public List<FeedbackEvento> ListarMensajesFeedbackEventoxUsuario(string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().ListarMensajesFeedbackEventoxUsuario(CiUsuario);
        }
        public List<FeedbackEvento> ListarMensajesFeedbackPorEvento(int IdEvento)
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().ListarMensajesFeedbackPorEvento(IdEvento);
        }
        public List<FeedbackEvento> ListarMensajesFeedbackPorEventoYUsuario(int IdEvento, string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().ListarMensajesFeedbackPorEventoYUsuario(IdEvento,CiUsuario);
        }

    }
}
