using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaReserva
    {
        void AltaReserva(Reserva r);
        void ModificarReserva(Reserva r);
        void BajaReserva(Reserva r);
        Reserva BuscarReserva(int IdReserva);
        List<Reserva> ListarReservasOrdenFecha();
        List<Reserva> ListarReservasPorCliente(string CiCliente);
        List<Reserva> ListarReservasPorEvento(int IdEvento);

    }
}
