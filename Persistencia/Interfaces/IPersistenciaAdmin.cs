using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaAdmin
    {
        Usuario Logueo(string cUserLogueo, string cPassLogueo);
        void Alta(Admin UnAdmin);
        void Baja(Admin UnAdmin);
        void Modificar(Admin UnAdmin);
        List<Admin> ListarAdmin();
        Admin Buscar(string DocUsuario);
    }
}
