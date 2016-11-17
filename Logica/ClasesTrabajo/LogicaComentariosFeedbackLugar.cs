using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
    internal class LogicaComentariosFeedbackLugar:ILogicaComentariosFeedbackLugar
    {
        
         #region Singleton
        private static LogicaComentariosFeedbackLugar instancia = null;
        private LogicaComentariosFeedbackLugar() { }
        public static LogicaComentariosFeedbackLugar GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaComentariosFeedbackLugar();
            return instancia;
        }
        #endregion


        public void AltaComentarioFeebackLugar(ComentarioFeedbackLugar e)
        {
            FabricaPersistencia.getPersistenciaComentariosFeedbakLugar().AltaComentarioFeebackLugar(e);
        }
        public void ModificarComentarioFeebackLugar(ComentarioFeedbackLugar e)
        {
            FabricaPersistencia.getPersistenciaComentariosFeedbakLugar().ModificarComentarioFeebackLugar(e);
        }
        public void BajaComentarioFeedbackLugar(ComentarioFeedbackLugar e)
        {
            FabricaPersistencia.getPersistenciaComentariosFeedbakLugar().BajaComentarioFeedbackLugar(e);
        }
        public ComentarioFeedbackLugar BuscarComentarioDeunMensajeFeedbackLugar(int IdFeedback, int IdComentario)
        {
            return FabricaPersistencia.getPersistenciaComentariosFeedbakLugar().BuscarComentarioDeunMensajeFeedbackLugar(IdFeedback,IdComentario);
        }
        public List<ComentarioFeedbackLugar> ListarComentariosFeedbackLugar()
        {
            return FabricaPersistencia.getPersistenciaComentariosFeedbakLugar().ListarComentariosFeedbackLugar();
        }
        public  List<ComentarioFeedbackLugar> ListarComentariosFeedbackLugarxUsuario(string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaComentariosFeedbakLugar().ListarComentariosFeedbackLugarxUsuario(CiUsuario);
        }
        public List<ComentarioFeedbackLugar> ListarComentariosdeUnMensajeFeedbackLugar(int IdFeedback)
        {
            return FabricaPersistencia.getPersistenciaComentariosFeedbakLugar().ListarComentariosdeUnMensajeFeedbackLugar(IdFeedback);
        }
    }
}
