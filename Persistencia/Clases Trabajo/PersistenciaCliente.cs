using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;
using Persistencia.Interfaces;

namespace Persistencia.Clases_Trabajo
{
    internal class PersistenciaCliente:IPersistenciaCliente
    {

        #region Singleton
        private static PersistenciaCliente _instancia = null;

        private PersistenciaCliente() { }

        public static PersistenciaCliente GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaCliente();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public Usuario Logueo(string cUserLogueo, string cPassLogueo)
        {

            string UserLogueo; string PassLogueo; string Nombre; string Documento; string Email;
            Usuario c = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "ClienteLogueo";
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
                    Documento = (string)lector["CiCliente"];
                    Nombre = (string)lector["Nombre"];
                    UserLogueo = (string)lector["NombreUsuario"];
                    PassLogueo = (string)lector["Contraseña"];
                    Email = (string)lector["Email"];



                    c = new Cliente(Documento, Nombre, UserLogueo, PassLogueo, Email);

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

        public void Alta(Cliente UnCliente)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "AltaCliente";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiCliente", UnCliente.CI);
            MySqlParameter oUserLogueo = new MySqlParameter("pNombreUsuario", UnCliente.NombreUsuario);
            MySqlParameter oPassLogueo = new MySqlParameter("pContraseña", UnCliente.Contraseña);
            MySqlParameter oNombre = new MySqlParameter("pNombre", UnCliente.Nombre);
            MySqlParameter oEmail = new MySqlParameter("pEmail", UnCliente.Email);

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

        public void Baja(Cliente UnCliente)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "EliminarCliente";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiCliente", UnCliente.CI);

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

        public void Modificar(Cliente UnCliente)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "ModificarCliente";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiCliente", UnCliente.CI);
            MySqlParameter oUserLogueo = new MySqlParameter("pNombreUsuario", UnCliente.NombreUsuario);
            MySqlParameter oPassLogueo = new MySqlParameter("pContraseña", UnCliente.Contraseña);
            MySqlParameter oNombre = new MySqlParameter("pNombre", UnCliente.Nombre);
            MySqlParameter oEmail = new MySqlParameter("pEmail", UnCliente.Email);

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


        public List<Cliente> ListarClientes()
        {
            string Documento; string UserLogueo; string PassLogueo; string Nombre; string Email;
            Cliente UnCliente;
            List<Cliente> lista = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "ListarClientes";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader lector;

            try
            {
                cnn.Open();
                lector = cmd.ExecuteReader();
                if (lector.HasRows)
                {
                    lista = new List<Cliente>();

                    while (lector.Read())
                    {
                        Documento = (string)lector["CiCliente"];
                        UserLogueo = (string)lector["NombreUsuario"];
                        PassLogueo = (string)lector["Contraseña"];
                        Nombre = (string)lector["Nombre"];
                        Email = (string)lector["Email"];



                        UnCliente = new Cliente(Documento, Nombre, UserLogueo, PassLogueo, Email);

                        lista.Add(UnCliente);

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

        public Cliente Buscar(string DocUsuario)
        {
            string UserLogueo; string PassLogueo; string Nombre; string Email;
            Cliente UnCliente = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "BuscarCliente";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader lector;

            MySqlParameter oDocUsuario = new MySqlParameter("pCiCliente", DocUsuario);

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


                    UnCliente = new Cliente(DocUsuario, Nombre, UserLogueo, PassLogueo, Email);
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

            return UnCliente;

        }

            #endregion

    }
}
	
