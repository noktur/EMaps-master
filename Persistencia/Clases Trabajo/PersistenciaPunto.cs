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
    internal class PersistenciaPunto:IPersistenciaPunto
    {
        #region Singleton
        private static PersistenciaPunto _instancia = null;

        private PersistenciaPunto() { }

        public static PersistenciaPunto GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaPunto();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public void AltaPunto(Punto p)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaPunto", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pCordX", p.CoordenadaX);
            cmd.Parameters.AddWithValue("pCordY", p.CoordenadaY);

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

        public void ModificarPunto(Punto p)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarPunto", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdPunto", p.IdPunto);
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

        public Punto BuscarPuntoxId(int IdPunto)
        {
            Punto UnPunto = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarPuntoxId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pIdPunto", IdPunto);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnPunto = new Punto(IdPunto,(double)oReader["CordX"], (double)oReader["CordY"]);
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
            return UnPunto;
        }

        public Punto BuscarPuntoxCoordenadas(double Cordx,double CordY)
        {
            Punto UnPunto = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarPuntoxCoordenadas", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pCordX", Cordx);
            cmd.Parameters.AddWithValue("pCordY", CordY);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnPunto = new Punto((int)oReader["IdPunto"],Cordx,CordY);
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
            return UnPunto;
        }

        public void BajaPunto(Punto p)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarPunto", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pIdPunto", p.IdPunto);


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
        
        #endregion
    }
}
