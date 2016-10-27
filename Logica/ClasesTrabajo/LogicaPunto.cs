using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
    internal class LogicaPunto:ILogicaPunto
    {
        #region Singleton
        private static LogicaPunto instancia = null;
        private LogicaPunto() { }
        public static LogicaPunto GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaPunto();
            return instancia;
        }
        #endregion

        #region Operaciones
        public void AltaPunto(Punto p)
        {
            FabricaPersistencia.getPersistenciaPunto().AltaPunto(p);
        }

        public void ModificarPunto(Punto p)
        {
            FabricaPersistencia.getPersistenciaPunto().ModificarPunto(p);
        }
        public void BajaPunto(Punto p)
        {
            FabricaPersistencia.getPersistenciaPunto().BajaPunto(p);
        }

        public Punto BuscarPuntoxId(int IdPunto)
        {
            return FabricaPersistencia.getPersistenciaPunto().BuscarPuntoxId(IdPunto);
        }
        public Punto BuscarPuntoxCoordenadas(double Cordx, double CordY)
        {
            return FabricaPersistencia.getPersistenciaPunto().BuscarPuntoxCoordenadas(Cordx,CordY);
        }
        #endregion
    }
}
