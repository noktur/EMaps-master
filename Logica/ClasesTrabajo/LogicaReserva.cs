using EntidadesCompartidas;
using Logica.Interfaces;
using Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.ClasesTrabajo
{
    internal class LogicaReserva:ILogicaReserva
    {
         #region Singleton
        private static LogicaReserva instancia = null;
        private LogicaReserva() { }
        public static LogicaReserva GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaReserva();
            return instancia;
        }
        #endregion

        public void AltaReserva(Reserva r)
        {
            FabricaPersistencia.getPersistenciaReserva().AltaReserva(r);
        }
        public void ModificarReserva(Reserva r)
        {
            FabricaPersistencia.getPersistenciaReserva().ModificarReserva(r);
        }
        public void BajaReserva(Reserva r)
        {
            FabricaPersistencia.getPersistenciaReserva().BajaReserva(r);
        }
        public Reserva BuscarReserva(int IdReserva)
        {
            return FabricaPersistencia.getPersistenciaReserva().BuscarReserva(IdReserva);
        }
        public List<Reserva> ListarReservasOrdenFecha()
        {
            return FabricaPersistencia.getPersistenciaReserva().ListarReservasOrdenFecha();
        }
        public List<Reserva> ListarReservasPorCliente(string CiCliente)
        {
            return FabricaPersistencia.getPersistenciaReserva().ListarReservasPorCliente(CiCliente);
        }
        public List<Reserva> ListarReservasPorEvento(int IdEvento)
        {
            return FabricaPersistencia.getPersistenciaReserva().ListarReservasPorEvento(IdEvento);
        }
    }
}
