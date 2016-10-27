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
    internal class PersistenciaDueño:IPersistenciaDueño
    {
        #region Singleton
        private static PersistenciaDueño _instancia = null;

        private PersistenciaDueño() { }

        public static PersistenciaDueño GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaDueño();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public Usuario Logueo(string cUserLogueo, string cPassLogueo)
        {

            string UserLogueo; string PassLogueo; string Nombre; string Documento; string Email;
            Usuario c = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "DueñoLogueo";
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
                    Documento = (string)lector["CiDueño"];
                    Nombre = (string)lector["Nombre"];
                    UserLogueo = (string)lector["NombreUsuario"];
                    PassLogueo = (string)lector["Contraseña"];
                    Email = (string)lector["Email"];


                    c = new Dueño(Documento, Nombre, UserLogueo, PassLogueo, Email);

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

        public void Alta(Dueño UnDueño)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "AltaDueño";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiDueño", UnDueño.CI);
            MySqlParameter oUserLogueo = new MySqlParameter("pNombreUsuario", UnDueño.NombreUsuario);
            MySqlParameter oPassLogueo = new MySqlParameter("pContraseña", UnDueño.Contraseña);
            MySqlParameter oNombre = new MySqlParameter("pNombre", UnDueño.Nombre);
            MySqlParameter oEmail = new MySqlParameter("pEmail", UnDueño.Email);

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

        public void Baja(Dueño UnDueño)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "EliminarDueño";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiDueño", UnDueño.CI);

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

        public void Modificar(Dueño UnDueño)
        {
            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "ModificarDueño";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlParameter oDocumento = new MySqlParameter("pCiDueño", UnDueño.CI);
            MySqlParameter oUserLogueo = new MySqlParameter("pNombreUsuario", UnDueño.NombreUsuario);
            MySqlParameter oPassLogueo = new MySqlParameter("pContraseña", UnDueño.Contraseña);
            MySqlParameter oNombre = new MySqlParameter("pNombre", UnDueño.Nombre);
            MySqlParameter oEmail = new MySqlParameter("pEmail", UnDueño.Email);

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

        public List<Dueño> ListarDueños()
        {
            string Documento; string UserLogueo; string PassLogueo; string Nombre; string Email;
            Dueño UnDueño;
            List<Dueño> lista = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "ListarDueño";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader lector;

            try
            {
                cnn.Open();
                lector = cmd.ExecuteReader();
                if (lector.HasRows)
                {
                    lista = new List<Dueño>();

                    while (lector.Read())
                    {
                        Documento = (string)lector["CiDueño"];
                        UserLogueo = (string)lector["NombreUsuario"];
                        PassLogueo = (string)lector["Contraseña"];
                        Nombre = (string)lector["Nombre"];
                        Email = (string)lector["Email"];



                        UnDueño = new Dueño(Documento, Nombre, UserLogueo, PassLogueo, Email);

                        lista.Add(UnDueño);

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

        public Dueño Buscar(string DocUsuario)
        {
            string UserLogueo; string PassLogueo; string Nombre; string Email;
            Dueño UnDueño = null;

            MySqlConnection cnn = new MySqlConnection(Conexion.Cnn);
            string oComando = "BuscarDueño";
            MySqlCommand cmd = new MySqlCommand(oComando, cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader lector;

            MySqlParameter oDocUsuario = new MySqlParameter("pCiDueño", DocUsuario);

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


                    UnDueño = new Dueño(DocUsuario, Nombre, UserLogueo, PassLogueo, Email);
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

            return UnDueño;

        }

            #endregion
    }
}
