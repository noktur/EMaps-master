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
        private float _CoordenadaX;
        private float _CoordenadaY;
        private Area _MiArea;


        #endregion

        #region Propiedades

        [DataMember]
        public int IdPunto
        {
            get { return _IdPunto;}
            set { _IdPunto = value; }
        }

        [DataMember]
        public float CoordenadaX
        {
            get { return _CoordenadaX; }
            set { _CoordenadaX = value; }
        }

        [DataMember]
        public float CoordenadaY
        {
            get { return _CoordenadaY; }
            set { _CoordenadaY = value; }
        }

        [DataMember]
        public Area MiArea
        {
            get { return _MiArea; }
            set { _MiArea = value; }
        }

        #endregion

        #region Constructores
        
        public Punto(int pIdPunto,float pCoordenadaX,float pCoordenadaY,Area UnArea)
        {
            IdPunto = pIdPunto;
            CoordenadaX = pCoordenadaX;
            CoordenadaY = pCoordenadaY;
            MiArea = UnArea;
        }

        public Punto()
        {
            IdPunto = 0;
            CoordenadaX =0;
            CoordenadaY = 0;
            MiArea = null;
        }


        #endregion
    }
}
