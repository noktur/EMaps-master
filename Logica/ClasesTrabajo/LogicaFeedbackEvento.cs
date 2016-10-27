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

        public void AltaFeebackEvento(FeedbackEvento e)
        {
            FabricaPersistencia.getPersistenciaFeedbakEvento().AltaFeebackEvento(e);
        }
        public void ModificarFeebackEvento(FeedbackEvento e)
        {
            FabricaPersistencia.getPersistenciaFeedbakEvento().ModificarFeebackEvento(e);
        }
        public void BajaFeedbackEvento(FeedbackEvento e)
        {
            FabricaPersistencia.getPersistenciaFeedbakEvento().BajaFeedbackEvento(e);
        }
        public FeedbackEvento BuscarFeedbackEvento(int IdFeedback)
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().BuscarFeedbackEvento(IdFeedback);
        }
        public List<FeedbackEvento> ListarFeedbackEvento()
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().ListarFeedbackEvento();
        }
        public List<FeedbackEvento> ListarFeedbackEventoxUsuario(string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().ListarFeedbackEventoxUsuario(CiUsuario);
        }
        public List<FeedbackEvento> ListarFeedbackPorEvento(int IdEvento)
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().ListarFeedbackPorEvento(IdEvento);
        }
        public List<FeedbackEvento> ListarFeedbackPorEventoYUsuario(int IdEvento, string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaFeedbakEvento().ListarFeedbackPorEventoYUsuario(IdEvento,CiUsuario);
        }

    }
}
