using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaArea
    {
        void AltaArea(Area a);
        void ModificarArea(Area a);
        Area BuscarArea(int IdArea);
        void AltaPuntodeArea(Area a);
        void BajaArea(Area a);
        List<Area> ListarAreasDeMapa(int IdMapa);
        List<Area> ListarPuntosDeUnArea(int IdArea);

    }
}
