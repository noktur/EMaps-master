using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Zona
    {
        #region Atributos

        private string _NombreZona;
        private double _CoordenadaX;
        private double _CoordenadaY;

        #endregion

        #region Propiedades

        [DataMember]
        public string NombreZona
        {
            get { return _NombreZona; }
            set { _NombreZona = value; }
        }

        [DataMember]
        public double CoordenadaX
        {
            get { return _CoordenadaX; }
            set { _CoordenadaX = value; }
        }

        [DataMember]
        public double CoordenadaY
        {
            get { return _CoordenadaY; }
            set { _CoordenadaY = value; }
        }


        #endregion

        #region Constructores

        public Zona(string pNombreZona,double pCoordenadaX,double pCoordenadaY)
        {
            NombreZona = pNombreZona;
            CoordenadaX = pCoordenadaX;
            CoordenadaY = pCoordenadaY;
        }

        public Zona()
        {
            NombreZona = "";
            CoordenadaX = 0.0;
            CoordenadaY = 0.0;
        }

        #endregion
    }
}
