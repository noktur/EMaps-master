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
    internal class PersistenciaAlquiler:IPersistenciaAlquiler
    {
            #region Singleton

        private static PersistenciaAlquiler _instancia = null;

        private PersistenciaAlquiler() { }

        public static PersistenciaAlquiler GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaAlquiler();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public void AltaAlquiler(Alquiler e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AlquilarLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombreLugar", e.LugarAlquiler.Nombre);
            cmd.Parameters.AddWithValue("pCiOrganizador", e.ClienteAlquiler.CI);
            cmd.Parameters.AddWithValue("pFechaInicio", e.FechaInicio);
            cmd.Parameters.AddWithValue("pFechaFin", e.FechaFin);
            cmd.Parameters.AddWithValue("pFechaReservacion", e.FechaReservacion);


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


        public void ComprobarAlquiler(Alquiler p,DateTime fechainicio,DateTime fechafin)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AlquilarLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombreLugar", p.LugarAlquiler.Nombre);
            cmd.Parameters.AddWithValue("pFechaInicio", fechainicio);
            cmd.Parameters.AddWithValue("pFechaFin", fechafin);



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

        public void BajaAlquiler(Alquiler e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarAlquilerLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdAlquiler", e.IdAlquiler);
            cmd.Parameters.AddWithValue("pNombreLugar", e.LugarAlquiler.Nombre);
            


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

        public Alquiler BuscarAlquiler(int IdAlquiler)
        {
            Alquiler UnAlquiler = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarAlquiler", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pIdAlquiler", IdAlquiler);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnAlquiler = new Alquiler(IdAlquiler, PersistenciaLugar.GetInstancia().BuscarLugar(Convert.ToString(oReader["NombreLugar"])), PersistenciaOrganizador.GetInstancia().Buscar(Convert.ToString(oReader["CiOrganizador"])),Convert.ToDateTime(oReader["FechaInicioAlquiler"]),Convert.ToDateTime(oReader["FechaFinAlquiler"]),Convert.ToDateTime(oReader["FechaRealizado"]));
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
            return UnAlquiler;
        }

        public List<Alquiler> ListarAlquileres()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Alquiler UnAlquiler = null;
            List<Alquiler> listaAlquiler = new List<Alquiler>();

            MySqlCommand comando = new MySqlCommand("ListarAlquiler", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnAlquiler = new Alquiler(Convert.ToInt32(lector["IdAlquiler"]), PersistenciaLugar.GetInstancia().BuscarLugar(Convert.ToString(lector["NombreLugar"])), PersistenciaOrganizador.GetInstancia().Buscar(Convert.ToString(lector["CiOrganizador"])), Convert.ToDateTime(lector["FechaInicioAlquiler"]), Convert.ToDateTime(lector["FechaFinAlquiler"]), Convert.ToDateTime(lector["FechaRealizado"]));
                        listaAlquiler.Add(UnAlquiler);
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
            return listaAlquiler;
        }

        public List<Alquiler> ListarAlquileresLugar(string NombreLugar)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Alquiler UnAlquiler = null;
            List<Alquiler> listaAlquiler = new List<Alquiler>();

            MySqlCommand comando = new MySqlCommand("ListarAlquilerdeLugar", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pNombreLugar", NombreLugar);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnAlquiler = new Alquiler(Convert.ToInt32(lector["IdAlquiler"]), PersistenciaLugar.GetInstancia().BuscarLugar(NombreLugar), PersistenciaOrganizador.GetInstancia().Buscar(Convert.ToString(lector["CiOrganizador"])), Convert.ToDateTime(lector["FechaInicioAlquiler"]), Convert.ToDateTime(lector["FechaFinAlquiler"]), Convert.ToDateTime(lector["FechaRealizado"]));
                        listaAlquiler.Add(UnAlquiler);
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
            return listaAlquiler;
        }

        public List<Alquiler> ListarAlquileresOrganizador(string Ci)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Alquiler UnAlquiler = null;
            List<Alquiler> listaAlquiler = new List<Alquiler>();

            MySqlCommand comando = new MySqlCommand("ListarAlquilerdeOrganizador", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pCiOrganizador", Ci);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnAlquiler = new Alquiler(Convert.ToInt32(lector["IdAlquiler"]), PersistenciaLugar.GetInstancia().BuscarLugar(Convert.ToString(lector["NombreLugar"])), PersistenciaOrganizador.GetInstancia().Buscar(Ci), Convert.ToDateTime(lector["FechaInicioAlquiler"]), Convert.ToDateTime(lector["FechaFinAlquiler"]), Convert.ToDateTime(lector["FechaRealizado"]));
                        listaAlquiler.Add(UnAlquiler);
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
            return listaAlquiler;
        }





        #endregion
    }
}
