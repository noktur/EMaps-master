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
    internal class PersistenciaMapa:IPersistenciaMapa
    {

          #region Singleton
        private static PersistenciaMapa _instancia = null;

        private PersistenciaMapa() { }

        public static PersistenciaMapa GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaMapa();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public void AltaMapa(Mapa m)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaMapa", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombre", m.Nombre);
            cmd.Parameters.AddWithValue("pImagen", m.Imagen);

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

        public void ModificarMapa(Mapa m)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarMapa", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdMapa", m.IdMapa);
            cmd.Parameters.AddWithValue("pNombre", m.Nombre);
            cmd.Parameters.AddWithValue("pImagen", m.Imagen);


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

        public Mapa BuscarMapa(int IdMapa)
        {
            Mapa UnMapa = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarMapa", con);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("pIdMapa", IdMapa);


            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnMapa = new Mapa(IdMapa,(byte[])oReader["Imagen"], (string)oReader["Nombre"]);
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
            return UnMapa;
        }  

        public void BajaMapa(Mapa m)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarMapa", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pIdMapa", m.IdMapa);


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
