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
    internal class PersistenciaOrganizador:IPersistenciaOrganizador
    {
         #region Singleton
        private static PersistenciaOrganizador _instancia = null;

        private PersistenciaOrganizador() { }

        public static PersistenciaOrganizador GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaOrganizador();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public Usuario Logueo(string cUserLogueo, string cPassLogueo)
        {

            string UserLogueo; string PassLogueo; string Nombre; string Documento; string Email;
            Usuario c = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "OrganizadorLogueo";
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
                    Documento = (string)lector["CiOrganizador"];
                    Nombre = (string)lector["Nombre"];
                    UserLogueo = (string)lector["NombreUsuario"];
                    PassLogueo = (string)lector["Contraseña"];
                    Email = (string)lector["Email"];


                    c = new Organizador(Documento, Nombre, UserLogueo, PassLogueo, Email);

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

        public void Alta(Organizador UnOrganizador)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "AltaOrganizador";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiOrganizador", UnOrganizador.CI);
            MySqlParameter oUserLogueo = new MySqlParameter("pNombreUsuario", UnOrganizador.NombreUsuario);
            MySqlParameter oPassLogueo = new MySqlParameter("pContraseña", UnOrganizador.Contraseña);
            MySqlParameter oNombre = new MySqlParameter("pNombre", UnOrganizador.Nombre);
            MySqlParameter oEmail = new MySqlParameter("pEmail", UnOrganizador.Email);

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

        public void Baja(Organizador UnOrganizador)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "EliminarOrganizador";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiOrganizador", UnOrganizador.CI);

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

        public void Modificar(Organizador UnOrganizador)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "ModificarOrganizador";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiOrganizador", UnOrganizador.CI);
            MySqlParameter oUserLogueo = new MySqlParameter("pNombreUsuario", UnOrganizador.NombreUsuario);
            MySqlParameter oPassLogueo = new MySqlParameter("pContraseña", UnOrganizador.Contraseña);
            MySqlParameter oNombre = new MySqlParameter("pNombre", UnOrganizador.Nombre);
            MySqlParameter oEmail = new MySqlParameter("pEmail", UnOrganizador.Email);

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

        public List<Organizador> ListarOrganizadores()
        {
            string Documento; string UserLogueo; string PassLogueo; string Nombre; string Email;
            Organizador UnOrganizador;
            List<Organizador> lista = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "ListarOrganizadores";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader lector;

            try
            {
                cnn.Open();
                lector = cmd.ExecuteReader();
                if (lector.HasRows)
                {
                    lista = new List<Organizador>();

                    while (lector.Read())
                    {
                        Documento = (string)lector["CiOrganizador"];
                        UserLogueo = (string)lector["NombreUsuario"];
                        PassLogueo = (string)lector["Contraseña"];
                        Nombre = (string)lector["Nombre"];
                        Email = (string)lector["Email"];



                        UnOrganizador = new Organizador(Documento, Nombre, UserLogueo, PassLogueo, Email);

                        lista.Add(UnOrganizador);

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

        public Organizador Buscar(string DocUsuario)
        {
            string UserLogueo; string PassLogueo; string Nombre; string Email;
            Organizador UnOrganizador = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "BuscarOrganizador";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader lector;

            MySqlParameter oDocUsuario = new MySqlParameter("pCiOrganizador", DocUsuario);

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


                    UnOrganizador = new Organizador(DocUsuario, Nombre, UserLogueo, PassLogueo, Email);
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

            return UnOrganizador;

        }

            #endregion

    }
}
