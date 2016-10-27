using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.Interfaces
{
    public interface ILogicaUbicacion
    {
        void Alta(Ubicacion U);
        void Modificar(Ubicacion U);
        void Eliminar(Ubicacion U);
        Pais BuscarPais(string pNombre);
        Ciudad BuscarCiudad(string pNombrePais);
        List<Ciudad> ListarCiudades();
        List<Pais> ListarPais();

        List<Ciudad> ListarCiudadesPais(Pais UnPais);

    }
}
