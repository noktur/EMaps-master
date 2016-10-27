using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaMapa
    {
        void AltaMapa(Mapa m);
        void ModificarMapa(Mapa m); 
        Mapa BuscarMapa(int IdMapa);
        void BajaMapa(Mapa m);
    }
}
