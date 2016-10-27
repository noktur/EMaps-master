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


        public void AltaFeebackLugar(FeedbackLugar e)
        {
            FabricaPersistencia.getPersistenciaFeedbackLugar().AltaFeebackLugar(e);
        }
        public void ModificarFeebackLugar(FeedbackLugar e)
        {
            FabricaPersistencia.getPersistenciaFeedbackLugar().ModificarFeebackLugar(e);
        }
        public void BajaFeedbackLugar(FeedbackLugar e)
        {
            FabricaPersistencia.getPersistenciaFeedbackLugar().BajaFeedbackLugar(e);
        }
        public FeedbackLugar BuscarFeedbackLugar(int IdFeedback)
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().BuscarFeedbackLugar(IdFeedback);
        }
        public List<FeedbackLugar> ListarFeedbackLugar()
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().ListarFeedbackLugar();
        }
        public List<FeedbackLugar> ListarFeedbackLugaresxUsuario(string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().ListarFeedbackLugaresxUsuario(CiUsuario);
        }
        public List<FeedbackLugar> ListarFeedbackdeUnLugar(string NombreLugar)
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().ListarFeedbackdeUnLugar(NombreLugar);
        }
        public List<FeedbackLugar> ListarFeedbackPorLugarYUsuario(string NombreLugar, string CiUsuario)
        {
            return FabricaPersistencia.getPersistenciaFeedbackLugar().ListarFeedbackPorLugarYUsuario(NombreLugar,CiUsuario);
        }

    }
}
