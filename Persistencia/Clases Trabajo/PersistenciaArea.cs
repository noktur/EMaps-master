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
    internal class PersistenciaArea:IPersistenciaArea
    {
        
          #region Singleton
        private static PersistenciaArea _instancia = null;

        private PersistenciaArea() { }

        public static PersistenciaArea GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaArea();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public void AltaArea(Area a)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaArea", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombre", a.NombreArea);
            cmd.Parameters.AddWithValue("pIdMapa", a.MapaAsociado.IdMapa);


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

        public void ModificarArea(Area a)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarArea", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdArea", a.IdArea);
            cmd.Parameters.AddWithValue("pNombre", a.NombreArea);
            cmd.Parameters.AddWithValue("pIdMapa", a.MapaAsociado.IdMapa);


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

        public void AltaPuntodeArea(Area a)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaPuntodeArea", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdArea", a.IdArea);
            cmd.Parameters.AddWithValue("pIdPunto", a.PuntosArea.IdPunto);
            cmd.Parameters.AddWithValue("pCordX", a.PuntosArea.CoordenadaX);
            cmd.Parameters.AddWithValue("pCordY", a.PuntosArea.CoordenadaY);
            cmd.Parameters.AddWithValue("pIdMapa", a.MapaAsociado.IdMapa);


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

        public Area BuscarArea(int IdArea)
        {
            Area UnArea = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarArea", con);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("pIdArea", IdArea);


            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnArea = new Area(IdArea,(string)oReader["NombreArea"],FabricaPersistencia.getPersistenciaMapa().BuscarMapa(Convert.ToInt32(oReader["IdMapa"])),FabricaPersistencia.getPersistenciaPunto().BuscarPuntoxId(Convert.ToInt32(oReader["IdPunto"])));
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
            return UnArea;
        }

        public void BajaArea(Area a)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarArea", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.AddWithValue("pIdArea", a.IdArea);


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

        public List<Area> ListarAreasDeMapa(int IdMapa)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Area UnArea = null;
            List<Area> listaArea = new List<Area>();

            MySqlCommand comando = new MySqlCommand("ListarAreasDeMapa", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pIdMapa", IdMapa);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnArea = new Area(Convert.ToInt32(lector["IdArea"]),Convert.ToString(lector["Nombre"]),PersistenciaMapa.GetInstancia().BuscarMapa(IdMapa),PersistenciaPunto.GetInstancia().BuscarPuntoxId(Convert.ToInt32(lector["IdPunto"])));
                        listaArea.Add(UnArea);
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
            return listaArea;
        }

        public List<Area> ListarPuntosDeUnArea(int IdArea)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Area UnArea = null;
            List<Area> listaArea = new List<Area>();

            MySqlCommand comando = new MySqlCommand("ListarPuntosdeUnArea", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pIdArea", IdArea);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnArea = new Area(IdArea, Convert.ToString(lector["Nombre"]), PersistenciaMapa.GetInstancia().BuscarMapa(Convert.ToInt32(lector["IdMapa"])), PersistenciaPunto.GetInstancia().BuscarPuntoxId(Convert.ToInt32(lector["IdPunto"])));
                        listaArea.Add(UnArea);
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
            return listaArea;
        }


        #endregion
    }
}
