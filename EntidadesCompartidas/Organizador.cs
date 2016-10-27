using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Organizador:Usuario
    {
         
       #region Atributos

       #endregion

       #region Propiedades

       #endregion

       #region Constructores

            public Organizador(string pCi, string pNombre, string pNombreUsuario, string pContraseña,string pEmail)
                : base(pCi, pNombre, pNombreUsuario, pContraseña,pEmail)
            {

            }

            public Organizador()
                : base()
            {
            }

       #endregion
    }
}
