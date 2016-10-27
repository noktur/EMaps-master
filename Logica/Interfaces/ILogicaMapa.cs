using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.Interfaces
{
    public interface ILogicaMapa
    {
        void AltaMapa(Mapa m);
        void ModificarMapa(Mapa m);
        Mapa BuscarMapa(int IdMapa);
        void BajaMapa(Mapa m);
    }
}
