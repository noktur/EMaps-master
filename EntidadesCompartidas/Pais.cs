using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Pais:Ubicacion
    {
        #region Atributos


        string _CodPais;
       #endregion

       #region Propiedades

        public string CodPais
        {
            get { return _CodPais; }
            set { _CodPais = value; }
        }

       #endregion

       #region Constructores

            public Pais( string pNombre,string pCodPais,float pCoordenadaX,float pCoordenadaY)
                : base(pNombre, pCoordenadaX, pCoordenadaY)
            {
                CodPais = pCodPais;
            }

            public Pais()
            {
                CodPais = "";
            }

       #endregion

    }
}
