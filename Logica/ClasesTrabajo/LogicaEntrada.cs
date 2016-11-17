using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
    internal class LogicaEntrada:ILogicaEntrada
    {
        #region Singleton
        private static LogicaEntrada instancia = null;
        private LogicaEntrada() { }
        public static LogicaEntrada GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaEntrada();
            return instancia;
        }
        #endregion

        public void AltaEntrada(Entrada e)
        {
            FabricaPersistencia.getPersistenciaEntrada().AltaEntrada(e);
        }
        public void ModificarEntrada(Entrada e)
        {
            FabricaPersistencia.getPersistenciaEntrada().ModificarEntrada(e);
        }
        public void BajaEntrada(Entrada e)
        {
            FabricaPersistencia.getPersistenciaEntrada().BajaEntrada(e);
        }
        public Entrada BuscarEntrada(int IdEntrada)
        {
            return FabricaPersistencia.getPersistenciaEntrada().BuscarEntrada(IdEntrada);
        }
        public List<Entrada> ListarEntradasOrdenFecha()
        {
            return FabricaPersistencia.getPersistenciaEntrada().ListarEntradasOrdenFecha();
        }
    }
}
