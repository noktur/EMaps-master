using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logica.Interfaces
{
    public interface ILogicaArea
    {
        void AltaArea(Area a);
        void ModificarArea(Area a);
        Area BuscarArea(int IdArea);
        void AltaPuntodeArea(Area a,Punto p);
        void BajaArea(Area a);
        List<Area> ListarAreasDeMapa(int IdMapa);
        List<Punto> ListarPuntosDeUnArea(Area a);
    }
}
