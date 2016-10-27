using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaCliente
    {
        Usuario Logueo(string cUserLogueo, string cPassLogueo);
        void Alta(Cliente UnCliente);

        void Baja(Cliente UnCliente);
        void Modificar(Cliente UnCliente);
        List<Cliente> ListarClientes();
        Cliente Buscar(string DocUsuario);
    }
}
