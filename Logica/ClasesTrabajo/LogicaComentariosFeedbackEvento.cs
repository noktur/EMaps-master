using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
    internal class LogicaComentariosFeedbackEvento:ILogicaComentariosFeedbackEvento
    {

         #region Singleton
        private static LogicaComentariosFeedbackEvento instancia = null;
        private LogicaComentariosFeedbackEvento() { }
        public static LogicaComentariosFeedbackEvento GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaComentariosFeedbackEvento();
            return instancia;
        }
        #endregion


        public void AltaComentarioFeebackEvento(ComentarioFeedbackEvento e)
        {
            FabricaPersistencia.getPersistenciaComentariosFeedbakEvento().AltaComentarioFeebackEvento(e);
        }
        public void ModificarComentarioFeebackEvento(ComentarioFeedbackEvento e)
        {
            FabricaPersistencia.getPersistenciaComentariosFeedbakEvento().ModificarComentarioFeebackEvento(e);
        }
        public void BajaComentarioFeedbackEvento(ComentarioFeedbackEvento e)
        {
            FabricaPersistencia.getPersistenciaComentariosFeedbakEvento().BajaComentarioFeedbackEvento(e);
        }
        public ComentarioFeedbackEvento BuscarComentarioDeunMensajeFeedbackEvento(int IdFeedback, int IdComentario)
        {
            return FabricaPersistencia.getPersistenciaComentariosFeedbakEvento().BuscarComentarioDeunMensajeFeedbackEvento(IdFeedback,IdComentario);
        }
        public List<ComentarioFeedbackEvento> ListarComentariosFeedbackEvento()
        {
            return FabricaPersistencia.getPersistenciaComentariosFeedbakEvento().ListarComentariosFeedbackEvento();
        }
        public  List<ComentarioFeedbackEvento> ListarComentariosFeedbackEventoxUsuario(string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaComentariosFeedbakEvento().ListarComentariosFeedbackEventoxUsuario(CiUsuario);
        }
        public List<ComentarioFeedbackEvento> ListarComentariosdeUnMensajeFeedbackEvento(int IdFeedback)
        {
            return FabricaPersistencia.getPersistenciaComentariosFeedbakEvento().ListarComentariosdeUnMensajeFeedbackEvento(IdFeedback);
        }
    }
}
