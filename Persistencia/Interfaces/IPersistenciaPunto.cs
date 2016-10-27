using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaPunto
    {
        void AltaPunto(Punto p);
        void ModificarPunto(Punto p);
        Punto BuscarPuntoxId(int IdPunto);
        Punto BuscarPuntoxCoordenadas(double Cordx, double CordY);
        void BajaPunto(Punto p);
    }
}
