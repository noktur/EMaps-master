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
        void ComprobarAlquiler(Alquiler p, DateTime fechainicio, DateTime fechafin);
        Alquiler BuscarAlquiler(int IdAlquiler);
        List<Alquiler> ListarAlquileres();
        List<Alquiler> ListarAlquileresArea(int IdArea);

        List<Alquiler> ListarAlquileresOrganizador(string Ci);
    }
}
