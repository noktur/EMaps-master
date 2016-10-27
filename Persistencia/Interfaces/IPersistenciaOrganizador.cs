using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaOrganizador
    {
        Usuario Logueo(string cUserLogueo, string cPassLogueo);
        void Alta(Organizador UnOrganizador);
        void Baja(Organizador UnOrganizador);
        void Modificar(Organizador UnOrganizador);
        List<Organizador> ListarOrganizadores();
        Organizador Buscar(string DocUsuario);
    }
}
