using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
    internal class LogicaMapa:ILogicaMapa
    {
        #region Singleton
        private static LogicaMapa instancia = null;
        private LogicaMapa() { }
        public static LogicaMapa GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaMapa();
            return instancia;
        }
        #endregion

        #region Operaciones
        public void AltaMapa(Mapa m)
        {
            FabricaPersistencia.getPersistenciaMapa().AltaMapa(m);
        }

        public void ModificarMapa(Mapa m)
        {
            FabricaPersistencia.getPersistenciaMapa().ModificarMapa(m);
        }
        public void BajaMapa(Mapa m)
        {
            FabricaPersistencia.getPersistenciaMapa().BajaMapa(m);
        }

        public Mapa BuscarMapa(int IdMapa)
        {
            return FabricaPersistencia.getPersistenciaMapa().BuscarMapa(IdMapa);
        }
        #endregion
    }
}
