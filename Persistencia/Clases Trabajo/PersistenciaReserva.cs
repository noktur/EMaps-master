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
    internal class PersistenciaReserva:IPersistenciaReserva
    {
           #region Singleton

        private static PersistenciaReserva _instancia = null;

        private PersistenciaReserva() { }

        public static PersistenciaReserva GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaReserva();

            return _instancia;
        }

        #endregion


        #region Operaciones

        public void AltaReserva(Reserva r)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaReserva", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pClienteReserva", r.ClienteReserva.CI);
            cmd.Parameters.AddWithValue("pIdEvento", r.EventoReservado.IdEvento);
            cmd.Parameters.AddWithValue("pCantidad", r.Cantidad);
            cmd.Parameters.AddWithValue("pFechaReserva", r.FechaReserva);
            cmd.Parameters.AddWithValue("pFechaEmision", r.FechaEmision);


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

        public void ModificarReserva(Reserva r)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarReserva", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdReserva", r.IdReserva);
            cmd.Parameters.AddWithValue("pClienteReserva", r.ClienteReserva.CI);
            cmd.Parameters.AddWithValue("pIdEvento", r.EventoReservado.IdEvento);
            cmd.Parameters.AddWithValue("pCantidad", r.Cantidad);
            cmd.Parameters.AddWithValue("pFechaReserva", r.FechaReserva);
            cmd.Parameters.AddWithValue("pFechaEmision", r.FechaEmision);


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

        public void BajaReserva(Reserva r)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarReserva", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdReserva", r.IdReserva);
            cmd.Parameters.AddWithValue("pIdEvento", r.EventoReservado);


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

        public Reserva BuscarReserva(int IdReserva)
        {
            Reserva UnaReserva = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarReserva", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pIdReserva", IdReserva);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnaReserva = new Reserva(IdReserva,PersistenciaCliente.GetInstancia().Buscar(Convert.ToString(oReader["ClienteReserva"])),PersistenciaEvento.GetInstancia().BuscarEvento(Convert.ToInt32(oReader["EventoReservado"])),Convert.ToInt32(oReader["CantidadReserva"]),Convert.ToDateTime(oReader["FechaReserva"]),Convert.ToDateTime(oReader["FechaEmision"]));                   
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
            return UnaReserva;
            }

        public List<Reserva> ListarReservasOrdenFecha()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Reserva UnaReserva = null;
            List<Reserva> listaReserva = new List<Reserva>();

            MySqlCommand comando = new MySqlCommand("ListarReservasPorFecha", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnaReserva = new Reserva(Convert.ToInt32(lector["IdReserva"]), PersistenciaCliente.GetInstancia().Buscar(Convert.ToString(lector["ClienteReserva"])), PersistenciaEvento.GetInstancia().BuscarEvento(Convert.ToInt32(lector["EventoReservado"])), Convert.ToInt32(lector["CantidadReserva"]), Convert.ToDateTime(lector["FechaReserva"]), Convert.ToDateTime(lector["FechaEmision"]));
                        listaReserva.Add(UnaReserva);
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
            return listaReserva;
        }

        public List<Reserva> ListarReservasPorCliente(string CiCliente)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Reserva UnaReserva = null;
            List<Reserva> listaReserva = new List<Reserva>();

            MySqlCommand comando = new MySqlCommand("ListarReservasPorCliente", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pCiCliente", CiCliente );

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnaReserva = new Reserva(Convert.ToInt32(lector["IdReserva"]), PersistenciaCliente.GetInstancia().Buscar(CiCliente), PersistenciaEvento.GetInstancia().BuscarEvento(Convert.ToInt32(lector["EventoReservado"])), Convert.ToInt32(lector["CantidadReserva"]), Convert.ToDateTime(lector["FechaReserva"]), Convert.ToDateTime(lector["FechaEmision"]));
                        listaReserva.Add(UnaReserva);
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
            return listaReserva;
        }

        public List<Reserva> ListarReservasPorEvento(int IdEvento)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Reserva UnaReserva = null;
            List<Reserva> listaReserva = new List<Reserva>();

            MySqlCommand comando = new MySqlCommand("ListarReservasPorEvento", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pIdEvento", IdEvento );

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnaReserva = new Reserva(Convert.ToInt32(lector["IdReserva"]), PersistenciaCliente.GetInstancia().Buscar(Convert.ToString(lector["ClienteReserva"])), PersistenciaEvento.GetInstancia().BuscarEvento(IdEvento), Convert.ToInt32(lector["CantidadReserva"]), Convert.ToDateTime(lector["FechaReserva"]), Convert.ToDateTime(lector["FechaEmision"]));
                        listaReserva.Add(UnaReserva);
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
            return listaReserva;
        }

       #endregion
    }
}
