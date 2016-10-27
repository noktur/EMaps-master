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
                      if (value.Length == 7)
                        _ci = value;
                    else
                        throw new Exception("&$ La cedula debe ser de 7 caracteres. &$");
                }
            }

        [DataMember]
            public string Nombre
            {
                get { return _nombre; }
                set
                {
                    if (value.Trim().Length > 0)
                        _nombre = value;
                    else
                        throw new Exception("&$ Debe ingresar un nombre. &$");
                }
            }

        [DataMember]
            public string NombreUsuario
            {
                get { return _nombreUsuario; }
                set
                {
                    if (value.Trim().Length > 0)
                        _nombreUsuario = value;
                    else
                        throw new Exception("&$ Debe ingresar un nombre de usuario. &$");
                }
            }

        [DataMember]
            public string Contraseña
            {
                get { return _contraseña; }
                set
                {
                    if (value.Length >= 7)
                        _contraseña = value;
                    else
                        throw new Exception("&$ El largo de la contraseña debe ser al menos de 7 caracteres. &$");
                }
            }

        [DataMember]
            public string Email
            {
                get { return _email; }
                set
                {
                    if (value.Trim().Length > 0)
                        _email = value;
                    else
                        throw new Exception("&$ Debe ingresar un email. &$");
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
