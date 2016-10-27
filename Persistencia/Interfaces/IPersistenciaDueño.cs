using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaDueño
    {
        Usuario Logueo(string cUserLogueo, string cPassLogueo);
        void Alta(Dueño UnDueño);
        void Baja(Dueño UnDueño);
        void Modificar(Dueño UnDueño);
        List<Dueño> ListarDueños();
        Dueño Buscar(string DocUsuario);
    }
}
