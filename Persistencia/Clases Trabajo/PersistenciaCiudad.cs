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
    internal class PersistenciaCiudad : IPersistenciaCiudad
    {
        #region Singleton
        private static PersistenciaCiudad _instancia = null;

        private PersistenciaCiudad() { }

        public static PersistenciaCiudad GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaCiudad();

            return _instancia;
        }

        #endregion

        #region Operaciones
        public void AltaCiudad(Ciudad c)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaCiudad", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombre", c.Nombre);
            cmd.Parameters.AddWithValue("pCordX", c.CoordenadaX);
            cmd.Parameters.AddWithValue("pCordY", c.CoordenadaY);
            cmd.Parameters.AddWithValue("pNombrePais", c.UnPais.Nombre);

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

        public void ModificarCiudad(Ciudad c)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarCiudad", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pCordX", c.CoordenadaX);
            cmd.Parameters.AddWithValue("pCordY", c.CoordenadaY);

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

        public Ciudad BuscarCiudad(String NombreCiudad)
        {
            Ciudad UnaCiudad = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarCiudad", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pNombre", NombreCiudad);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnaCiudad = new Ciudad(NombreCiudad,Convert.ToSingle(oReader["CordX"]),Convert.ToSingle(oReader["CordY"]),PersistenciaPais.GetInstancia().BuscarPais(Convert.ToString(oReader["NombrePais"])));
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
            return UnaCiudad;
        }

        public void BajaCiudad(Ciudad c)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarCiudad", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pNombreCiudad", c.UnPais.Nombre);
            cmd.Parameters.AddWithValue("pNombre", c.Nombre);


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

        public List<Ciudad> ListarCiudades()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Ciudad UnaCiudad = null;
            List<Ciudad> listaCiudad = new List<Ciudad>();

            MySqlCommand comando = new MySqlCommand("ListarCiudades", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnaCiudad = new Ciudad((string)lector["NombreCiudad"],Convert.ToSingle(lector["CordX"]),Convert.ToSingle(lector["CordY"]), PersistenciaPais.GetInstancia().BuscarPais((string)lector["Nombre"]));
                        listaCiudad.Add(UnaCiudad);
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
            return listaCiudad;
        }
        
        public List<Ciudad> ListarCiudadesPais(Pais UnPais)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Ciudad UnaCiudad = null;
            List<Ciudad> listaCiudad = new List<Ciudad>();

            MySqlCommand comando = new MySqlCommand("ListarCiudadesdePais", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pNombrePais", UnPais.Nombre);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnaCiudad = new Ciudad((string)lector["NombreCiudad"],Convert.ToSingle(lector["CordX"]),Convert.ToSingle(lector["CordY"]), UnPais);
                        listaCiudad.Add(UnaCiudad);
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
            return listaCiudad;
        }

        #endregion

    }
}
