using EntidadesCompartidas;
using MySql.Data.MySqlClient;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia.Clases_Trabajo
{
    internal class PersistenciaPais:IPersistenciaPais
    {
         #region Singleton
        private static PersistenciaPais _instancia = null;

        private PersistenciaPais() { }

        public static PersistenciaPais GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaPais();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public void AltaPais(Pais p)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaPais", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombre", p.Nombre);
            cmd.Parameters.AddWithValue("pCordX", p.CoordenadaX);
            cmd.Parameters.AddWithValue("pCordY", p.CoordenadaY);
            cmd.Parameters.AddWithValue("pCodPais", p.CodPais);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Problema con la base de datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public void ModificarPais(Pais p)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarPais", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombre", p.Nombre);
            cmd.Parameters.AddWithValue("pCordX", p.CoordenadaX);
            cmd.Parameters.AddWithValue("pCordY", p.CoordenadaY);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error con la base de datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public Pais BuscarPais(String NombrePais)
        {
            Pais UnPais = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarPais", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pNombre", NombrePais);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnPais = new Pais(NombrePais,Convert.ToString(oReader["CodPais"]),Convert.ToSingle(oReader["CordX"]),Convert.ToSingle(oReader["CordY"]));
                }
                oReader.Close();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Error con la base de datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return UnPais;
        }

        public void BajaPais(Pais p)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarPais", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pNombre", p.Nombre);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error con la Base de Datos: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public List<Pais> ListarPaises()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Pais UnPais = null;
            List<Pais> listaPais = new List<Pais>();

            MySqlCommand comando = new MySqlCommand("ListarPaises", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnPais = new Pais((string)lector["Nombre"], (string)lector["CodPais"], Convert.ToSingle(lector["CordX"]), Convert.ToSingle(lector["CordY"]));
                        listaPais.Add(UnPais);
                    }
                }
                lector.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conexion.Close();
            }
            return listaPais;
        }
        #endregion
    }
}
