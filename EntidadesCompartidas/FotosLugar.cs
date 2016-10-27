using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class FotosLugar
    {
        private String _nombreFoto;
        private byte[] _imagen;

         #region 


        public String NombreFoto
        {
            get { return _nombreFoto; }
            set
            {
                if (value.Trim().Length > 0)
                    _nombreFoto = value;
                else
                    throw new Exception("&$ La imagen debe tener un nombre. &$");
            }
        }

        public byte[] Imagen
        {
            get { return _imagen; }
            set { _imagen = value; }
        }

        #endregion

        #region Constructores

        public FotosLugar(String fNombre, byte[] fImagen)
        {
            NombreFoto = fNombre;
            Imagen = fImagen;
        }

        public FotosLugar()
        {
            NombreFoto = "aaa";
            Imagen = null;
        }

        #endregion
    }
}
