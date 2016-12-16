using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;
using Logica.Interfaces;

namespace Logica.ClasesTrabajo
{
    internal class LogicaEvento:ILogicaEvento
    {
        #region Singleton

        private static LogicaEvento _instance = null;
        private LogicaEvento() { }
        public static LogicaEvento GetInstancia()
        {
            if (_instance == null)
                _instance = new LogicaEvento();

            return _instance;
        }

        #endregion

        public void AltaEvento(Evento p)
        {
            FabricaPersistencia.getPersistenciaEvento().AltaEvento(p);
        }
        public void ComprobarEstadoEvento(Evento UnEvento, DateTime fecha1, DateTime fecha2)
        {
            FabricaPersistencia.getPersistenciaEvento().ComprobarEstadoEvento(UnEvento, fecha1, fecha2);
        }
        public void BajaEvento(Evento e)
        {
            FabricaPersistencia.getPersistenciaEvento().BajaEvento(e);
        }
        public Evento BuscarEvento(int IdEvento)
        {
            return FabricaPersistencia.getPersistenciaEvento().BuscarEvento(IdEvento);
        }
        public Categoria BuscarCategoria(string NombreCategoria)
        {
            return FabricaPersistencia.getPersistenciaEvento().BuscarCategoria(NombreCategoria);
        }
        public List<Categoria> ListarCategorias()
        {
            return FabricaPersistencia.getPersistenciaEvento().ListarCategorias();
        }
        public List<Evento> ListarEventosOrdenFecha()
        {
            return FabricaPersistencia.getPersistenciaEvento().ListarEventosOrdenFecha();
        }
        public List<Evento> ListarEventosOrganizador(string CiOrganizador)
        {
            return FabricaPersistencia.getPersistenciaEvento().ListarEventosOrganizador(CiOrganizador);
        }
        public List<Evento> ListarEventosReservados()
        {
            return FabricaPersistencia.getPersistenciaEvento().ListarEventosReservados();
        }
        public List<Evento> ListarEventosxArea(int IdArea)
        {
            return FabricaPersistencia.getPersistenciaEvento().ListarEventosxArea(IdArea);
        }
            
    }
}
