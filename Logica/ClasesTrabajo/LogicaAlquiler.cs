﻿using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
    internal class LogicaAlquiler:ILogicaAlquiler
    {
        #region Singleton
        private static LogicaAlquiler instancia = null;
        private LogicaAlquiler() { }
        public static LogicaAlquiler GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaAlquiler();
            return instancia;
        }
        #endregion

        #region Operaciones

        public void AltaAlquiler(Alquiler e)
        {
            FabricaPersistencia.getPersistenciaAlquiler().AltaAlquiler(e);
        }
        public void BajaAlquiler(Alquiler e)
        {
            FabricaPersistencia.getPersistenciaAlquiler().BajaAlquiler(e);
        }
        public void ComprobarAlquiler(Alquiler p, DateTime fechainicio, DateTime fechafin)
        {
            FabricaPersistencia.getPersistenciaAlquiler().ComprobarAlquiler(p,fechainicio,fechafin);
        }
        public Alquiler BuscarAlquiler(int IdAlquiler)
        {
            return FabricaPersistencia.getPersistenciaAlquiler().BuscarAlquiler(IdAlquiler);
        }
        public List<Alquiler> ListarAlquileres()
        {
           return FabricaPersistencia.getPersistenciaAlquiler().ListarAlquileres();
        }
        public List<Alquiler> ListarAlquileresLugar(string NombreLugar)
        {
          return  FabricaPersistencia.getPersistenciaAlquiler().ListarAlquileresLugar(NombreLugar);
        }


        #endregion
    }
}