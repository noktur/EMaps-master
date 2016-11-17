using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaEntrada
    {
        void AltaEntrada(Entrada e);
        void ModificarEntrada(Entrada e);
        void BajaEntrada(Entrada e);
        Entrada BuscarEntrada(int IdEntrada);
        List<Entrada> ListarEntradasOrdenFecha();

    }
}
