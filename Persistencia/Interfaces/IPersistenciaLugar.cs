using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaLugar
    {
        void AltaLugar(Lugar l);
        void ModificarLugar(Lugar l);
        Lugar BuscarLugar(string NombreLugar);
        void BajaLugar(Lugar l);
        List<Lugar> ListarLugares();
        List<Lugar> ListarLugaresDisponibles();
        List<Lugar> ListarLugaresCiudad(string pNombreCiudad);
        Lugar BuscarMapaLugar(string NombreLugar, int IdMapa);
    }
}
