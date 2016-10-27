using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Ciudad:Ubicacion
    {
         #region Atributos
         
        private Pais _UnPais;

        #endregion

       #region Propiedades

        [DataMember]
        public Pais UnPais
        {
            get{return _UnPais;}
            set{_UnPais=value;}
        }


       #endregion

       #region Constructores

            public Ciudad( string pNombre,float pCoordenadaX,float pCoordenadaY,Pais pPais)
                : base(pNombre, pCoordenadaX, pCoordenadaY)
            {
                UnPais=pPais;
               
            }

            public Ciudad()
            {
                UnPais = null;
                
            }

       #endregion
    }
}
