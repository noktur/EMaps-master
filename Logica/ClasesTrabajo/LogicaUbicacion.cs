using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistencia;
using Logica.Interfaces;

namespace Logica.ClasesTrabajo
{
    internal class LogicaUbicacion:ILogicaUbicacion
    {
          #region Singleton
        private static LogicaUbicacion _instancia = null;
        private LogicaUbicacion() { }
        public static LogicaUbicacion getInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaUbicacion();

            return _instancia;
        }
        #endregion

        #region Operaciones

        public void Alta(Ubicacion U)
        {
            if (U is Pais)
            {
                FabricaPersistencia.getPersistenciaPais().AltaPais((Pais)U);
            }

            else if (U is Ciudad)
            {
                FabricaPersistencia.getPersistenciaCiudad().AltaCiudad((Ciudad)U);
            }
        }

        public void Modificar(Ubicacion U)
        {
            if (U is Pais)
            {
                FabricaPersistencia.getPersistenciaPais().ModificarPais((Pais)U);
            }
            else if (U is Ciudad)
            {
                FabricaPersistencia.getPersistenciaCiudad().ModificarCiudad((Ciudad)U);
            }
        }

        public void Eliminar(Ubicacion U)
        {
            if (U is Pais)
            {
                FabricaPersistencia.getPersistenciaPais().BajaPais((Pais)U);
            }
            else if (U is Ciudad)
            {
                FabricaPersistencia.getPersistenciaCiudad().BajaCiudad((Ciudad)U);
            }
        }

        public Pais BuscarPais(string pNombre)
        {
            Pais U = null;

            U = FabricaPersistencia.getPersistenciaPais().BuscarPais(pNombre);

            return U;
        }

        public Ciudad BuscarCiudad(string pNombreCiudad)
        {
            Ciudad U = null;

           U = FabricaPersistencia.getPersistenciaCiudad().BuscarCiudad(pNombreCiudad);

            return U;
        }


        public List<Ciudad> ListarCiudades()
        {
            return FabricaPersistencia.getPersistenciaCiudad().ListarCiudades();
        }


        public List<Ciudad> ListarCiudadesPais(Pais UnPais)
        {
            return FabricaPersistencia.getPersistenciaCiudad().ListarCiudadesPais(UnPais);
        }


        public List<Pais> ListarPais()
        {
            return FabricaPersistencia.getPersistenciaPais().ListarPaises();
        }


        #endregion
    }
}
