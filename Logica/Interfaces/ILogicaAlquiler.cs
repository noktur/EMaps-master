using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.Interfaces
{
    public interface ILogicaAlquiler
    {
        void AltaAlquiler(Alquiler e);
        void BajaAlquiler(Alquiler e);
        Alquiler BuscarAlquiler(int IdAlquiler);
        List<Alquiler> ListarAlquileres();
        List<Alquiler> ListarAlquileresArea(int IdArea);

        List<Alquiler> ListarAlquileresOrganizador(string Ci);
    }
}
