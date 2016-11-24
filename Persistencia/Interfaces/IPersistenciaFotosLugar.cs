using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IPersistenciaFotosLugar
    {
        void AltaFotoLugar(FotosLugar F, Lugar L);
        void AgregarFotosLugar(Lugar L);
    }
}
