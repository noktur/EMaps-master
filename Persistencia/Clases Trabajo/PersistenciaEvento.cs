using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Persistencia.Interfaces;
using EntidadesCompartidas;
using MySql.Data.MySqlClient;
using System.Data;

namespace Persistencia.Clases_Trabajo
{
    internal class PersistenciaEvento : IPersistenciaEvento
    {

       
        #region Singleton

        private static PersistenciaEvento _instancia = null;

        private PersistenciaEvento() { }

        public static PersistenciaEvento GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaEvento();

            return _instancia;
        }

        #endregion


        #region Operaciones

        public void AltaEvento(Evento p)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombre", p.NombreEvento);
            cmd.Parameters.AddWithValue("pDescripcion", p.Descripcion);
            cmd.Parameters.AddWithValue("pFechaInicio", p.FechaInicio);
            cmd.Parameters.AddWithValue("pFechaFin", p.FechaFin);
            cmd.Parameters.AddWithValue("pNombreLugar", p.UnLugar.Nombre);
            cmd.Parameters.AddWithValue("pCiOrganizador", p.OrganizadorEvento.CI);
            cmd.Parameters.AddWithValue("pNombreCategoria", p.CategoriaEvento.NombreCategoria);


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


        public void ComprobarEstadoEvento(Evento UnEvento,DateTime fecha1,DateTime fecha2)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdEvento", UnEvento.IdEvento);
            cmd.Parameters.AddWithValue("pFechaInicio", fecha1);
            cmd.Parameters.AddWithValue("pFechaFin", fecha2);


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

        public void BajaEvento(Evento e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIEvento", e.IdEvento);


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

        public Evento BuscarEvento(int IdEvento)
        {
            Evento UnEvento = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pIdEvento", IdEvento);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnEvento = new Evento(IdEvento, Convert.ToString(oReader["Nombre"]), Convert.ToString(oReader["Descripcion"]), Convert.ToDateTime(oReader["FechaInicio"]), Convert.ToDateTime(oReader["FechaFin"]), PersistenciaLugar.GetInstancia().BuscarLugar(Convert.ToString(oReader["NombreLugar"])), PersistenciaEvento.GetInstancia().BuscarCategoria(Convert.ToString(oReader["NombreCategoria"])), PersistenciaOrganizador.GetInstancia().Buscar(Convert.ToString(oReader["CiOrganizador"])));
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
            return UnEvento;
        }

         public Categoria BuscarCategoria(string NombreCategoria)
        {
            Categoria UnaCategoria = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarCategoria", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pNombreCategoria", NombreCategoria);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    oReader.Read();
                    UnaCategoria = new Categoria(NombreCategoria,Convert.ToString(oReader["Descripcion"]));
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
            return UnaCategoria;
        }

         public List<Categoria> ListarCategorias()
         {
             MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
             Categoria UnaCategoria = null;
             List<Categoria> listaCategoria = new List<Categoria>();

             MySqlCommand comando = new MySqlCommand("ListarCategorias", conexion);
             comando.CommandType = System.Data.CommandType.StoredProcedure;

             try
             {
                 conexion.Open();
                 MySqlDataReader lector = comando.ExecuteReader();
                 if (lector.HasRows)
                 {
                     while (lector.Read())
                     {
                         UnaCategoria = new Categoria(Convert.ToString(lector["NombreCategoria"]), Convert.ToString(lector["Descripcion"]));
                         listaCategoria.Add(UnaCategoria);
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
             return listaCategoria;
         }

         public List<Evento> ListarEventosOrdenFecha()
         {
             MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
             Evento UnEvento = null;
             List<Evento> listaEventos = new List<Evento>();

             MySqlCommand comando = new MySqlCommand("ListarEventoPorFecha", conexion);
             comando.CommandType = System.Data.CommandType.StoredProcedure;

             try
             {
                 conexion.Open();
                 MySqlDataReader lector = comando.ExecuteReader();
                 if (lector.HasRows)
                 {
                     while (lector.Read())
                     {
                         UnEvento = new Evento(Convert.ToInt32(lector["IdEvento"]), Convert.ToString(lector["Nombre"]), Convert.ToString(lector["Descripcion"]), Convert.ToDateTime(lector["FechaInicio"]), Convert.ToDateTime(lector["FechaFin"]), PersistenciaLugar.GetInstancia().BuscarLugar(Convert.ToString(lector["NombreLugar"])), PersistenciaEvento.GetInstancia().BuscarCategoria(Convert.ToString(lector["NombreCategoria"])), PersistenciaOrganizador.GetInstancia().Buscar(Convert.ToString(lector["CiOrganizador"])));
                         listaEventos.Add(UnEvento);
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
             return listaEventos;
         }

         public List<Evento> ListarEventosOrganizador(string CiOrganizador)
         {
             MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
             Evento UnEvento = null;
             List<Evento> listaEventos = new List<Evento>();

             MySqlCommand comando = new MySqlCommand("ListarEventosOrganizador", conexion);
             comando.CommandType = System.Data.CommandType.StoredProcedure;
             comando.Parameters.AddWithValue("pCiOrganizador", CiOrganizador);

             try
             {
                 conexion.Open();
                 MySqlDataReader lector = comando.ExecuteReader();
                 if (lector.HasRows)
                 {
                     while (lector.Read())
                     {
                         UnEvento = new Evento(Convert.ToInt32(lector["IdEvento"]), Convert.ToString(lector["Nombre"]), Convert.ToString(lector["Descripcion"]),Convert.ToDateTime(lector["FechaInicio"]), Convert.ToDateTime(lector["FechaFin"]), PersistenciaLugar.GetInstancia().BuscarLugar(Convert.ToString(lector["NombreLugar"])), PersistenciaEvento.GetInstancia().BuscarCategoria(Convert.ToString(lector["NombreCategoria"])), PersistenciaOrganizador.GetInstancia().Buscar(CiOrganizador));
                         listaEventos.Add(UnEvento);
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
             return listaEventos;
         }

         public List<Evento> ListarEventosReservados()
         {
             MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
             Evento UnEvento = null;
             List<Evento> listaEventos = new List<Evento>();

             MySqlCommand comando = new MySqlCommand("ListarEventosReservados", conexion);
             comando.CommandType = System.Data.CommandType.StoredProcedure;

             try
             {
                 conexion.Open();
                 MySqlDataReader lector = comando.ExecuteReader();
                 if (lector.HasRows)
                 {
                     while (lector.Read())
                     {
                         UnEvento = new Evento(Convert.ToInt32(lector["IdEvento"]), Convert.ToString(lector["Nombre"]), Convert.ToString(lector["Descripcion"]), Convert.ToDateTime(lector["FechaInicio"]), Convert.ToDateTime(lector["FechaFin"]), PersistenciaLugar.GetInstancia().BuscarLugar(Convert.ToString(lector["NombreLugar"])), PersistenciaEvento.GetInstancia().BuscarCategoria(Convert.ToString(lector["NombreCategoria"])), PersistenciaOrganizador.GetInstancia().Buscar(Convert.ToString(lector["CiOrganizador"])));
                         listaEventos.Add(UnEvento);
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
             return listaEventos;
         }

         public List<Evento> ListarEventosxLugar(string pNombreLugar)
         {
             MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
             Evento UnEvento = null;
             List<Evento> listaEventos = new List<Evento>();

             MySqlCommand comando = new MySqlCommand("ListarEventosxLugar", conexion);
             comando.CommandType = System.Data.CommandType.StoredProcedure;
             comando.Parameters.AddWithValue("pNombreLugar", pNombreLugar);

             try
             {
                 conexion.Open();
                 MySqlDataReader lector = comando.ExecuteReader();
                 if (lector.HasRows)
                 {
                     while (lector.Read())
                     {
                         UnEvento = new Evento(Convert.ToInt32(lector["IdEvento"]), Convert.ToString(lector["Nombre"]), Convert.ToString(lector["Descripcion"]), Convert.ToDateTime(lector["FechaInicio"]), Convert.ToDateTime(lector["FechaFin"]), PersistenciaLugar.GetInstancia().BuscarLugar(pNombreLugar), PersistenciaEvento.GetInstancia().BuscarCategoria(Convert.ToString(lector["NombreCategoria"])),PersistenciaOrganizador.GetInstancia().Buscar(Convert.ToString(lector["CiOrganizador"])));
                         listaEventos.Add(UnEvento);
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
             return listaEventos;
         }





        #endregion
    }
}
