using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.ServiceModel;
using System.Runtime.Serialization;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Admin:Usuario
    {

       #region Atributos

       #endregion

       #region Propiedades

       #endregion

       #region Constructores

            public Admin(string pCi, string pNombre, string pNombreUsuario, string pContraseña,string pEmail)
                : base(pCi, pNombre, pNombreUsuario, pContraseña,pEmail)
            {

            }

            public Admin()
            {
            }

       #endregion

    }
}
