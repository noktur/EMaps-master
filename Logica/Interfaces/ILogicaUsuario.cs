using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.Interfaces
{
    public interface ILogicaUsuario
    {
        void Alta(Usuario U);
        void Modificar(Usuario U);
        void Eliminar(Usuario U);
        Usuario Buscar(string pDoc);
        Usuario Login(String nomUsu, String pass);
        List<Admin> ListarAdmin();
        List<Dueño> ListarDueños();
        List<Organizador> ListarOrganizadores();
        List<Cliente> ListarClientes();
    }
}
