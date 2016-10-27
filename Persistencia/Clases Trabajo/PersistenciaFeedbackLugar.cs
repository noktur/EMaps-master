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
    internal class PersistenciaFeedbackLugar:IPersistenciaFeedbackLugar
    {

         #region Singleton

        private static PersistenciaFeedbackLugar _instancia = null;

        private PersistenciaFeedbackLugar() { }

        public static PersistenciaFeedbackLugar GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaFeedbackLugar();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public void AltaFeebackLugar(FeedbackLugar e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaFeedbackLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pNombreFeedback", e.NombreFeedback);
            cmd.Parameters.AddWithValue("pCiUsuario", e.UsuarioFeedback.CI);
            cmd.Parameters.AddWithValue("pFechaRealizado", e.FechaRealizado);
            cmd.Parameters.AddWithValue("pNombreLugar", e.LugarFeedback.Nombre);


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

        public void ModificarFeebackLugar(FeedbackLugar e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarFeedbackLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdFeedback", e.IdFeedbackLugar);
            cmd.Parameters.AddWithValue("pNombreFeedback", e.NombreFeedback);
            cmd.Parameters.AddWithValue("pCiUsuario", e.UsuarioFeedback.CI);
            cmd.Parameters.AddWithValue("pFechaRealizado", e.FechaRealizado);
            cmd.Parameters.AddWithValue("pNombreLugar", e.LugarFeedback.Nombre);


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

        public void BajaFeedbackLugar(FeedbackLugar e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarFeedbackLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdFeedback", e.IdFeedbackLugar);

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

        public FeedbackLugar BuscarFeedbackLugar(int IdFeedback)
        {
            FeedbackLugar UnFeedbackLugar = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarFeebackLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.AddWithValue("pIdFeedback", IdFeedback);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {
                    


                    oReader.Read();

                    Usuario unUsuario=null;

                    unUsuario=Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar((string)oReader["CiUsuario"]);

                    if(unUsuario == null)
                    {
                        unUsuario=Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar((string)oReader["CiUsuario"]);
                    }
                    else if(unUsuario == null)
                    {
                         unUsuario=Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar((string)oReader["CiUsuario"]);
                    }
                    else if(unUsuario == null)
                    {
                         unUsuario=Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar((string)oReader["CiUsuario"]);
                    }


                    UnFeedbackLugar = new FeedbackLugar(IdFeedback, Convert.ToString(oReader["NombreFeedback"]), unUsuario, Convert.ToDateTime(oReader["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaLugar.GetInstancia().BuscarLugar((string)oReader["NombreLugar"]));
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
            return UnFeedbackLugar;
        }

        public List<FeedbackLugar> ListarFeedbackLugar()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            FeedbackLugar UnFeedbackLugar = null;
            List<FeedbackLugar> listaFeedbackLugar = new List<FeedbackLugar>();

            MySqlCommand comando = new MySqlCommand("ListarFeedbackLugar", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {

                        Usuario unUsuario = null;

                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar((string)lector["CiUsuario"]);

                        if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }

                        UnFeedbackLugar = new FeedbackLugar(Convert.ToInt32(lector["IdFeedback"]), Convert.ToString(lector["NombreFeedback"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaLugar.GetInstancia().BuscarLugar((string)lector["NombreLugar"]));
                        listaFeedbackLugar.Add(UnFeedbackLugar);
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
            return listaFeedbackLugar;
        }

        public List<FeedbackLugar> ListarFeedbackLugaresxUsuario(string CiUsuario)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            FeedbackLugar UnFeedbackLugar = null;
           List<FeedbackLugar> listaFeedbacklugar = new List<FeedbackLugar>();

            MySqlCommand comando = new MySqlCommand("ListarFeedbackLugaresxUsuario", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pCiUsuario", CiUsuario);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {

                        Usuario unUsuario = null;

                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar(CiUsuario);

                        if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar(CiUsuario);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar(CiUsuario);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar(CiUsuario);
                        }

                        UnFeedbackLugar = new FeedbackLugar(Convert.ToInt32(lector["IdFeedback"]), Convert.ToString(lector["NombreFeedback"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaLugar.GetInstancia().BuscarLugar((string)lector["NombreLugar"]));
                        listaFeedbacklugar.Add(UnFeedbackLugar);
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
            return listaFeedbacklugar;
        }

        public List<FeedbackLugar> ListarFeedbackdeUnLugar(string NombreLugar)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            FeedbackLugar UnFeedbackLugar = null;
            List<FeedbackLugar> listaFeedbackLugar = new List<FeedbackLugar>();

            MySqlCommand comando = new MySqlCommand("ListarFeedbackdeUnLugar", conexion);
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

                        Usuario unUsuario = null;

                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar((string)lector["CiUsuario"]);

                        if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar((string)lector["CiUsuario"]);
                        }

                        UnFeedbackLugar = new FeedbackLugar(Convert.ToInt32(lector["IdFeedback"]), Convert.ToString(lector["NombreFeedback"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaLugar.GetInstancia().BuscarLugar(NombreLugar));
                        listaFeedbackLugar.Add(UnFeedbackLugar);
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
            return listaFeedbackLugar;
        }

        public List<FeedbackLugar> ListarFeedbackPorLugarYUsuario(string NombreLugar, string CiUsuario)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            FeedbackLugar UnFeedbackLugar = null;
            List<FeedbackLugar> listaFeedbackLugar = new List<FeedbackLugar>();

            MySqlCommand comando = new MySqlCommand("ListarFeedbackPorLugarYUsuario", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pNombreLugar", NombreLugar);
            comando.Parameters.AddWithValue("pCiUsuario", CiUsuario);

            try
            {
                conexion.Open();
                MySqlDataReader lector = comando.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                    {

                        Usuario unUsuario = null;

                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar(CiUsuario);

                        if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar(CiUsuario);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar(CiUsuario);
                        }
                        else if (unUsuario == null)
                        {
                            unUsuario = Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar(CiUsuario);
                        }

                        UnFeedbackLugar = new FeedbackLugar(Convert.ToInt32(lector["IdFeedback"]), Convert.ToString(lector["NombreFeedback"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), Persistencia.Clases_Trabajo.PersistenciaLugar.GetInstancia().BuscarLugar(NombreLugar));
                        listaFeedbackLugar.Add(UnFeedbackLugar);
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
            return listaFeedbackLugar;
        }



        #endregion

    }
}
