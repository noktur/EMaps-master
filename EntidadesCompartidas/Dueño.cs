using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [DataContract]
    public class Dueño:Usuario
    {

       #region Atributos

       #endregion

       #region Propiedades

       #endregion

       #region Constructores

            public Dueño(string pCi, string pNombre, string pNombreUsuario, string pContraseña,string pEmail)
                : base(pCi, pNombre, pNombreUsuario, pContraseña,pEmail)
            {

            }

            public Dueño()
            {
            }

       #endregion
    }
}
