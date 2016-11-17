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
    internal class PersistenciaEntrada:IPersistenciaEntrada
    {
          #region Singleton

        private static PersistenciaEntrada _instancia = null;

        private PersistenciaEntrada() { }

        public static PersistenciaEntrada GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaEntrada();

            return _instancia;
        }

        #endregion


        #region Operaciones

        public void AltaEntrada(Entrada e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaEntrada", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pPrecio", e.Precio);
            cmd.Parameters.AddWithValue("pIdReserva", e.ReservaEvento.IdReserva);
            cmd.Parameters.AddWithValue("pCantidad", e.Cantidad);
            cmd.Parameters.AddWithValue("pFechaEmision", e.FechaEmision);


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

        public void ModificarEntrada(Entrada e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarEntrada", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdEntrada", e.IdEntrada);
            cmd.Parameters.AddWithValue("pPrecio", e.Precio);
            cmd.Parameters.AddWithValue("pIdReserva", e.ReservaEvento.IdReserva);
            cmd.Parameters.AddWithValue("pCantidad", e.Cantidad);
            cmd.Parameters.AddWithValue("pFechaEmision", e.FechaEmision);


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

        public void BajaEntrada(Entrada e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarEntrada", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdEntrada", e.IdEntrada);
            cmd.Parameters.AddWithValue("pIdReserva", e.ReservaEvento.IdReserva);


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

        public Entrada BuscarEntrada(int IdEntrada)
        {
            Entrada UnaEntrada = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarEntrada", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pIdEntrada", IdEntrada);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnaEntrada = new Entrada(IdEntrada,Convert.ToDouble(oReader["Precio"]),PersistenciaReserva.GetInstancia().BuscarReserva(Convert.ToInt32(oReader["IdReserva"])),Convert.ToInt32(oReader["Cantidad"]),Convert.ToDateTime(oReader["FechaEmision"]));                   
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
            return UnaEntrada;
            }

        public List<Entrada> ListarEntradasOrdenFecha()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Entrada UnaEntrada = null;
            List<Entrada> listaEntrada = new List<Entrada>();

            MySqlCommand comando = new MySqlCommand("ListarEntradasPorFecha", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnaEntrada = new Entrada(Convert.ToInt32(lector["IdEntrada"]), Convert.ToDouble(lector["Precio"]),PersistenciaReserva.GetInstancia().BuscarReserva(Convert.ToInt32(lector["IdReserva"])), Convert.ToInt32(lector["Cantidad"]), Convert.ToDateTime(lector["FechaEmision"]));                   
                        listaEntrada.Add(UnaEntrada);
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
            return listaEntrada;
        }


       #endregion
    }
}
