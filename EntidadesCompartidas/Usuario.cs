using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    [KnownType(typeof(Admin))]
    [KnownType(typeof(Dueño))]
    [KnownType(typeof(Organizador))]
    [KnownType(typeof(Cliente))]

    [DataContract]
    public abstract class Usuario
    {
        
       #region Atributos

            private string _ci;
            private string _nombre;
            private string _nombreUsuario;
            private string _contraseña;
            private string _email;

       #endregion

      #region Propiedades

        [DataMember]
            public string CI
            {
                get { return _ci; }
                set
                {
                    _ci = value;
                }
            }

        [DataMember]
            public string Nombre
            {
                get { return _nombre; }
                set
                {
                        _nombre = value;
                }
            }

        [DataMember]
            public string NombreUsuario
            {
                get { return _nombreUsuario; }
                set
                {
                        _nombreUsuario = value;
                }
            }

        [DataMember]
            public string Contraseña
            {
                get { return _contraseña; }
                set
                {
                    
                        _contraseña = value;
                   
                }
            }

        [DataMember]
            public string Email
            {
                get { return _email; }
                set
                {
                        _email = value;
                }
            }

        #endregion

        #region Constructores
            public Usuario(string pCi, string pNombre, string pNombreUsuario, string pContraseña,string pEmail)
            {
                CI = pCi;
                Nombre = pNombre;
                NombreUsuario = pNombreUsuario;
                Contraseña = pContraseña;
                Email=pEmail;
            }

            public Usuario()
            {
                CI ="0000000";
                Nombre = "---";
                NombreUsuario = "---";
                Email=".....";
                Contraseña = "0000000";
            }

        #endregion

        }
    }
