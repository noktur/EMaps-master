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
        private String _extension;

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

        public String Extension
        {
            get { return _extension; }
            set
            {
                _extension = value;
            }
        }

        #endregion

        #region Constructores

        public FotosLugar(String fNombre, byte[] fImagen,String pExtension)
        {
            NombreFoto = fNombre;
            Imagen = fImagen;
            Extension = pExtension;
        }

        public FotosLugar()
        {
            Extension = "";
            NombreFoto = "aaa";
            Imagen = null;
        }

        #endregion
    }
}
