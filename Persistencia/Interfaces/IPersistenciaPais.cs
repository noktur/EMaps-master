using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaPais
    {
        void AltaPais(Pais p);
        void ModificarPais(Pais p);
        Pais BuscarPais(String NombrePais);
        void BajaPais(Pais p);
        List<Pais> ListarPaises();
    }
}
