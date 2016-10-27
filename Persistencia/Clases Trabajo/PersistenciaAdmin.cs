using EntidadesCompartidas;
using MySql.Data.MySqlClient;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Persistencia.Clases_Trabajo
{
    internal class PersistenciaAdmin:IPersistenciaAdmin
    {
          #region Singleton
        private static PersistenciaAdmin _instancia = null;

        private PersistenciaAdmin() { }

        public static PersistenciaAdmin GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaAdmin();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public Usuario Logueo(string cUserLogueo, string cPassLogueo)
        {

            string UserLogueo; string PassLogueo; string Nombre; string Documento; string Email;
            Usuario c = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "AdminLogueo";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader lector;

            MySqlParameter oUserLogueo = new MySqlParameter("pNombreUsuario", cUserLogueo);
            MySqlParameter oPassLogueo = new MySqlParameter("pContraseña", cPassLogueo);


            cmd.Parameters.Add(oUserLogueo);
            cmd.Parameters.Add(oPassLogueo);

            try
            {
                cnn.Open();
                lector = cmd.ExecuteReader();

                if (lector.Read())
                {
                    Documento = (string)lector["CiAdmin"];
                    Nombre = (string)lector["Nombre"];
                    UserLogueo = (string)lector["NombreUsuario"];
                    PassLogueo = (string)lector["Contraseña"];
                    Email = (string)lector["Email"];


                    c = new Admin(Documento, Nombre, UserLogueo, PassLogueo, Email);

                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            finally
            {
                cnn.Close();
            }

            return c;
        }

        public void Alta(Admin UnAdmin)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "AltaAdmin";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiAdmin", UnAdmin.CI);
            MySqlParameter oUserLogueo = new MySqlParameter("pNombreUsuario", UnAdmin.NombreUsuario);
            MySqlParameter oPassLogueo = new MySqlParameter("pContraseña", UnAdmin.Contraseña);
            MySqlParameter oNombre = new MySqlParameter("pNombre", UnAdmin.Nombre);
            MySqlParameter oEmail = new MySqlParameter("pEmail", UnAdmin.Email);

            cmd.Parameters.Add(oDocumento);
            cmd.Parameters.Add(oUserLogueo);
            cmd.Parameters.Add(oPassLogueo);
            cmd.Parameters.Add(oNombre);
            cmd.Parameters.Add(oEmail);


            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            finally
            {
                cnn.Close();
            }
        }

        public void Baja(Admin UnAdmin)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "EliminarAdmin";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiAdmin", UnAdmin.CI);

            cmd.Parameters.Add(oDocumento);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            finally
            {
                cnn.Close();
            }
        }

        public void Modificar(Admin UnAdmin)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "ModificarAdmin";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiAdmin", UnAdmin.CI);
            MySqlParameter oUserLogueo = new MySqlParameter("pNombreUsuario", UnAdmin.NombreUsuario);
            MySqlParameter oPassLogueo = new MySqlParameter("pContraseña", UnAdmin.Contraseña);
            MySqlParameter oNombre = new MySqlParameter("pNombre", UnAdmin.Nombre);
            MySqlParameter oEmail = new MySqlParameter("pEmail", UnAdmin.Email);

            cmd.Parameters.Add(oDocumento);
            cmd.Parameters.Add(oUserLogueo);
            cmd.Parameters.Add(oPassLogueo);
            cmd.Parameters.Add(oNombre);
            cmd.Parameters.Add(oEmail);


            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            finally
            {
                cnn.Close();
            }
        }


        public List<Admin> ListarAdmin()
        {
            string Documento; string UserLogueo; string PassLogueo; string Nombre; string Email;
            Admin UnAdmin;
            List<Admin> lista = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "ListarAdmin";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader lector;

            try
            {
                cnn.Open();
                lector = cmd.ExecuteReader();
                if (lector.HasRows)
                {
                    lista = new List<Admin>();

                    while (lector.Read())
                    {
                        Documento = (string)lector["CiAdmin"];
                        UserLogueo = (string)lector["NombreUsuario"];
                        PassLogueo = (string)lector["Contraseña"];
                        Nombre = (string)lector["Nombre"];
                        Email = (string)lector["Email"];



                        UnAdmin = new Admin(Documento, Nombre, UserLogueo, PassLogueo, Email);

                        lista.Add(UnAdmin);

                    }
                }
            }
                
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            finally
            {
                cnn.Close();
            }
            return lista;
        }

        public Admin Buscar(string DocUsuario)
        {
            string UserLogueo; string PassLogueo; string Nombre; string Email;
            Admin UnAdmin = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "BuscarAdmin";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader lector;

            MySqlParameter oDocUsuario = new MySqlParameter("pCiAdmin", DocUsuario);

            cmd.Parameters.Add(oDocUsuario);

            try
            {
                cnn.Open();
                lector = cmd.ExecuteReader();

                if (lector.Read())
                {
                    UserLogueo = (string)lector["NombreUsuario"];
                    PassLogueo = (string)lector["Contraseña"];
                    Nombre = (string)lector["Nombre"];
                    Email = (string)lector["Email"];


                    UnAdmin = new Admin(DocUsuario, Nombre, UserLogueo, PassLogueo, Email);
                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            finally
            {
                cnn.Close();
            }

            return UnAdmin;

        }

            #endregion
    }
}
