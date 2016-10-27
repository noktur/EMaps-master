using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace EntidadesCompartidas
{
    [KnownType(typeof(Ciudad))]
    [KnownType(typeof(Pais))]

    [DataContract]
    public abstract class Ubicacion
    {
        #region Atributos

        private string _Nombre;
        private float _CoordenadaX;
        private float _CoordenadaY;

        #endregion

        #region Propiedades

        [DataMember]
        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
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

        #endregion

         #region Constructores

        public Ubicacion(string pNombre,float pCoordenadaX,float pCoordenadaY)
        {
            Nombre = pNombre;
            CoordenadaX = pCoordenadaX;
            CoordenadaY = pCoordenadaY;
        }

        public Ubicacion()
        {
            Nombre = "";
            CoordenadaX = 0;
            CoordenadaY = 0;
        }

        #endregion
    }
}
