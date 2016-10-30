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
    internal class PersistenciaLugar:IPersistenciaLugar
    {
         #region Singleton
        private static PersistenciaLugar _instancia = null;

        private PersistenciaLugar() { }

        public static PersistenciaLugar GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaLugar();

            return _instancia;
        }

        #endregion
        

        #region Operaciones

        public void AltaLugar(Lugar l)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombre", l.Nombre);
            cmd.Parameters.AddWithValue("pDireccion", l.Direccion);
            cmd.Parameters.AddWithValue("pCapacidad", l.Capacidad);
            cmd.Parameters.AddWithValue("pDescripcion", l.Descripcion);
            cmd.Parameters.AddWithValue("pNombreUbicacion", l.UbicacionLugar.Nombre);
            cmd.Parameters.AddWithValue("pIdMapa", l.MapaLugar.IdMapa);
            cmd.Parameters.AddWithValue("pCordX", l.CoordenadaX);
            cmd.Parameters.AddWithValue("pCordY", l.CoordenadaY);
            cmd.Parameters.AddWithValue("pCiDueño", l.DueñoLugar.CI);



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

        public void ModificarLugar(Lugar l)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombre", l.Nombre);
            cmd.Parameters.AddWithValue("pDireccion", l.Direccion);
            cmd.Parameters.AddWithValue("pCapacidad", l.Capacidad);
            cmd.Parameters.AddWithValue("pDescripcion", l.Descripcion);
            cmd.Parameters.AddWithValue("pNombreUbicacion", l.UbicacionLugar.Nombre);
            cmd.Parameters.AddWithValue("pIdMapa", l.MapaLugar.IdMapa);
            cmd.Parameters.AddWithValue("pCiDueño", l.DueñoLugar.CI);


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

        public Lugar BuscarLugar(string  NombreLugar)
        {
            Lugar UnLugar = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pNombreLugar", NombreLugar);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnLugar = new Lugar(NombreLugar, (string)oReader["Direccion"], (string)oReader["Descripcion"], (int)oReader["Capacidad"], PersistenciaCiudad.GetInstancia().BuscarCiudad((string)oReader["UbicacionCiudad"]), PersistenciaMapa.GetInstancia().BuscarMapa((int)oReader["IdMapa"]), Convert.ToSingle(oReader["CordX"]), Convert.ToSingle(oReader["CordY"]),PersistenciaDueño.GetInstancia().Buscar((string)oReader["CiDueño"]));
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
            return UnLugar;
        }


        public void BajaLugar(Lugar l)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pNombreLugar", l.Nombre);


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

        public List<Lugar> ListarLugares()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Lugar UnLugar = null;
            List<Lugar> listaLugar = new List<Lugar>();

            MySqlCommand comando = new MySqlCommand("ListarLugares", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnLugar = new Lugar((string)lector["NombreLugar"], (string)lector["Direccion"], (string)lector["Descripcion"], (int)lector["Capacidad"], PersistenciaCiudad.GetInstancia().BuscarCiudad((string)lector["UbicacionCiudad"]), PersistenciaMapa.GetInstancia().BuscarMapa((int)lector["IdMapa"]), Convert.ToSingle(lector["CordX"]), Convert.ToSingle(lector["CordY"]), PersistenciaDueño.GetInstancia().Buscar((string)lector["CiDueño"]));
                        listaLugar.Add(UnLugar);
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
            return listaLugar;
        }

        public List<Lugar> ListarLugaresDisponibles()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Lugar UnLugar = null;
            List<Lugar> listaLugar = new List<Lugar>();

            MySqlCommand comando = new MySqlCommand("ListarLugaresDisponibles", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnLugar = new Lugar((string)lector["NombreLugar"], (string)lector["Direccion"], (string)lector["Descripcion"], (int)lector["Capacidad"], PersistenciaCiudad.GetInstancia().BuscarCiudad((string)lector["UbicacionCiudad"]), PersistenciaMapa.GetInstancia().BuscarMapa((int)lector["IdMapa"]), Convert.ToSingle(lector["CordX"]), Convert.ToSingle(lector["CordY"]), PersistenciaDueño.GetInstancia().Buscar((string)lector["CiDueño"]));
                        listaLugar.Add(UnLugar);
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
            return listaLugar;
        }

        public List<Lugar> ListarLugaresCiudad(string pNombreCiudad)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Lugar UnLugar = null;
            List<Lugar> listaLugar = new List<Lugar>();

            MySqlCommand comando = new MySqlCommand("ListarLugaresCiudad", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pNombreCiudad", pNombreCiudad);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnLugar = new Lugar((string)lector["NombreLugar"], (string)lector["Direccion"], (string)lector["Descripcion"], (int)lector["Capacidad"],PersistenciaCiudad.GetInstancia().BuscarCiudad(pNombreCiudad), PersistenciaMapa.GetInstancia().BuscarMapa((int)lector["IdMapa"]), Convert.ToSingle(lector["CordX"]), Convert.ToSingle(lector["CordY"]), PersistenciaDueño.GetInstancia().Buscar((string)lector["CiDueño"]));
                        listaLugar.Add(UnLugar);
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
            return listaLugar;
        }

        public List<Lugar> ListarLugaresDueño(string pCiDueño)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            Lugar UnLugar = null;
            List<Lugar> listaLugar = new List<Lugar>();

            MySqlCommand comando = new MySqlCommand("ListarLugaresDueño", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pCiDueño", pCiDueño);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {
                        UnLugar = new Lugar((string)lector["NombreLugar"], (string)lector["Direccion"], (string)lector["Descripcion"], (int)lector["Capacidad"], PersistenciaCiudad.GetInstancia().BuscarCiudad(Convert.ToString(lector["UbicacionCiudad"])), PersistenciaMapa.GetInstancia().BuscarMapa((int)lector["IdMapa"]), Convert.ToSingle(lector["CordX"]), Convert.ToSingle(lector["CordY"]), PersistenciaDueño.GetInstancia().Buscar(pCiDueño));
                        listaLugar.Add(UnLugar);
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
            return listaLugar;
        }

        public Lugar BuscarMapaLugar(string NombreLugar,int IdMapa)
        {
            Lugar UnLugar = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pNombreLugar", NombreLugar);
            cmd.Parameters.AddWithValue("pIdMapa", IdMapa);


            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnLugar = new Lugar(NombreLugar, (string)oReader["Direccion"], (string)oReader["Descripcion"], (int)oReader["Capacidad"], PersistenciaCiudad.GetInstancia().BuscarCiudad((string)oReader["UbicacionCiudad"]), PersistenciaMapa.GetInstancia().BuscarMapa(IdMapa), Convert.ToSingle(oReader["CordX"]), Convert.ToSingle(oReader["CordY"]), PersistenciaDueño.GetInstancia().Buscar((string)oReader["CiDueño"]));
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
            return UnLugar;
        }


        #endregion
    }
}
