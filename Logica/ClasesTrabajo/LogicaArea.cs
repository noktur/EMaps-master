using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistencia;
using Logica.Interfaces;

namespace Logica.ClasesTrabajo
{
    internal class LogicaArea:ILogicaArea
    {
          #region Singleton
        private static LogicaArea instancia = null;
        private LogicaArea() { }
        public static LogicaArea GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaArea();
            return instancia;
        }
        #endregion

        #region Operaciones

        public void AltaArea(Area a)
        {
            FabricaPersistencia.getPersistenciaArea().AltaArea(a);
        }
        public void ModificarArea(Area a)
        {
            FabricaPersistencia.getPersistenciaArea().ModificarArea(a);
        }
        public Area BuscarArea(int IdArea)
        {
            return FabricaPersistencia.getPersistenciaArea().BuscarArea(IdArea);
        }
        public void AltaPuntodeArea(Area a)
        {
            FabricaPersistencia.getPersistenciaArea().AltaPuntodeArea(a);
        }
        public void BajaArea(Area a)
        {
            FabricaPersistencia.getPersistenciaArea().BajaArea(a);
        }
        public List<Area> ListarAreasDeMapa(int IdMapa)
        {
            return FabricaPersistencia.getPersistenciaArea().ListarAreasDeMapa(IdMapa);
        }
        public List<Area> ListarPuntosDeUnArea(int IdArea)
        {
            return FabricaPersistencia.getPersistenciaArea().ListarPuntosDeUnArea(IdArea);
        }

        #endregion
    }
}
