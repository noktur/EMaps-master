using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Punto
    {
        #region Atributos

        private int _IdPunto;
        private double _CoordenadaX;
        private double _CoordenadaY;

        #endregion

        #region Propiedades

        [DataMember]
        public int IdPunto
        {
            get { return _IdPunto;}
            set { _IdPunto = value; }
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
        
        public Punto(int pIdPunto,double pCoordenadaX,double pCoordenadaY)
        {
            IdPunto = pIdPunto;
            CoordenadaX = pCoordenadaX;
            CoordenadaY = pCoordenadaY;
        }

        public Punto()
        {
            IdPunto = 0;
            CoordenadaX = 0.0;
            CoordenadaY = 0.0;
        }


        #endregion
    }
}
