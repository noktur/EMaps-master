using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Interes
    {
        #region Atributos

        private string _NombreInteres;
        private string _Descripcion;

        #endregion

        #region Propiedades

        [DataMember]
        public string NombreInteres
        {
            get { return _NombreInteres; }
            set
            {
                if (value.Trim().Length > 0)
                    _NombreInteres = value;
                else
                    throw new Exception("&$ Debe ingresar un interes. &$");
            }
        }

        [DataMember]
        public string Descripcion
        {
            get { return _Descripcion; }
            set
            {
                if (value.Trim().Length > 0)
                    _Descripcion = value;
                else
                    throw new Exception("&$ Debe ingresar una descripcion. &$");
            }
        }

        #endregion

        #region Constructores

        public Interes(string pNombreInteres,string pDescripcion)
        {
            NombreInteres = pNombreInteres;
            Descripcion = pDescripcion;
        }

        public Interes()
        {
            NombreInteres = "";
            Descripcion = "";
        }

        #endregion
    }
}
