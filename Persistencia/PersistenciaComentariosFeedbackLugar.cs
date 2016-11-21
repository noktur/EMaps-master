using EntidadesCompartidas;
using MySql.Data.MySqlClient;
using Persistencia.Clases_Trabajo;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Persistencia
{
    internal class PersistenciaComentariosFeedbackLugar:IPersistenciaComentariosFeedbackLugar
    {

          
           #region Singleton

        private static PersistenciaComentariosFeedbackLugar _instancia = null;

        private PersistenciaComentariosFeedbackLugar() { }

        public static PersistenciaComentariosFeedbackLugar GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaComentariosFeedbackLugar();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public void AltaComentarioFeebackLugar(ComentarioFeedbackLugar e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaComentarioFeedbackLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdFeedback", e.MensajeAsociado.IdFeedbackLugar);
            cmd.Parameters.AddWithValue("pAsunto", e.AsuntoComentario);
            cmd.Parameters.AddWithValue("pMensajeComentario", e.Comentario);
            cmd.Parameters.AddWithValue("pCiUsuario", e.UsuarioComentario);
            cmd.Parameters.AddWithValue("pFechaRealizado", e.FechaRealizado);


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

        public void ModificarComentarioFeebackLugar(ComentarioFeedbackLugar e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarComentarioFeedbackLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.AddWithValue("pIdComentario", e.IdComentarioLugar);
            cmd.Parameters.AddWithValue("pIdFeedback", e.MensajeAsociado.IdFeedbackLugar);
            cmd.Parameters.AddWithValue("pAsunto", e.AsuntoComentario);
            cmd.Parameters.AddWithValue("pMensajeComentario", e.Comentario);
            cmd.Parameters.AddWithValue("pCiUsuario", e.UsuarioComentario);
            cmd.Parameters.AddWithValue("pFechaRealizado", e.FechaRealizado);


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

        public void BajaComentarioFeedbackLugar(ComentarioFeedbackLugar e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarComentarioFeedbackLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdComentario", e.IdComentarioLugar);

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

        public ComentarioFeedbackLugar BuscarComentarioDeunMensajeFeedbackLugar(int IdFeedback, int IdComentario)
        {
            ComentarioFeedbackLugar ComentarioFeedbackLugar = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarComentariodeUnMensajeFeebackLugar", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdFeedback", IdFeedback);
            cmd.Parameters.AddWithValue("pIdComentario", IdComentario);

            try
            {
                con.Open();
                MySqlDataReader oReader = cmd.ExecuteReader();
                if (oReader.HasRows)
                {



                    oReader.Read();

                    Usuario unUsuario = null;

                    unUsuario = Persistencia.Clases_Trabajo.PersistenciaAdmin.GetInstancia().Buscar((string)oReader["CiUsuario"]);

                    if (unUsuario == null)
                    {
                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaCliente.GetInstancia().Buscar((string)oReader["CiUsuario"]);
                    }
                    else if (unUsuario == null)
                    {
                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaOrganizador.GetInstancia().Buscar((string)oReader["CiUsuario"]);
                    }
                    else if (unUsuario == null)
                    {
                        unUsuario = Persistencia.Clases_Trabajo.PersistenciaDueño.GetInstancia().Buscar((string)oReader["CiUsuario"]);
                    }


                    ComentarioFeedbackLugar = new ComentarioFeedbackLugar(IdComentario, Convert.ToString(oReader["AsuntoComentario"]), Convert.ToString(oReader["MensajeComentario"]), unUsuario, Convert.ToDateTime(oReader["FechaRealizado"]),Persistencia.Clases_Trabajo.PersistenciaFeedbackLugar.GetInstancia().BuscarMensajeFeedbackLugar(IdFeedback));
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
            return ComentarioFeedbackLugar;
        }

        public List<ComentarioFeedbackLugar> ListarComentariosFeedbackLugar()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            ComentarioFeedbackLugar ComentarioFeedbackLugar = null;
            List<ComentarioFeedbackLugar> listaComentariosFeedbackLugar = new List<ComentarioFeedbackLugar>();

            MySqlCommand comando = new MySqlCommand("ListarComentariosFeedbackLugar", conexion);
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

                        ComentarioFeedbackLugar = new ComentarioFeedbackLugar(Convert.ToInt32(lector["IdComentario"]), Convert.ToString(lector["AsuntoComentario"]), Convert.ToString(lector["MensajeComentario"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), FabricaPersistencia.getPersistenciaFeedbackLugar().BuscarMensajeFeedbackLugar((int)lector["IdFeedback"]));
                        listaComentariosFeedbackLugar.Add(ComentarioFeedbackLugar);
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
            return listaComentariosFeedbackLugar;
        }

        public List<ComentarioFeedbackLugar> ListarComentariosFeedbackLugarxUsuario(string CiUsuario)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            ComentarioFeedbackLugar ComentarioFeedbackLugar = null;
            List<ComentarioFeedbackLugar> listaComentariosFeedbackLugar = new List<ComentarioFeedbackLugar>();

            MySqlCommand comando = new MySqlCommand("ListarComentariosFeedbackLugarxUsuario", conexion);
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

                        ComentarioFeedbackLugar = new ComentarioFeedbackLugar(Convert.ToInt32(lector["IdComentario"]), Convert.ToString(lector["AsuntoComentario"]), Convert.ToString(lector["MensajeComentario"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]),FabricaPersistencia.getPersistenciaFeedbackLugar().BuscarMensajeFeedbackLugar((int)lector["IdFeedback"]));
                        listaComentariosFeedbackLugar.Add(ComentarioFeedbackLugar);
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
            return listaComentariosFeedbackLugar;
        }

        public List<ComentarioFeedbackLugar> ListarComentariosdeUnMensajeFeedbackLugar(int IdFeedback)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            ComentarioFeedbackLugar ComentarioFeedbackLugar = null;
            List<ComentarioFeedbackLugar> listaComentariosFeedbackLugar = new List<ComentarioFeedbackLugar>();

            MySqlCommand comando = new MySqlCommand("ListarComentariosdeUnMensajeFeedbackLugar", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("pIdFeedback", IdFeedback);

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

                        ComentarioFeedbackLugar = new ComentarioFeedbackLugar(Convert.ToInt32(lector["IdComentario"]), Convert.ToString(lector["AsuntoComentario"]), Convert.ToString(lector["MensajeComentario"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), PersistenciaFeedbackLugar.GetInstancia().BuscarMensajeFeedbackLugar(IdFeedback));
                        listaComentariosFeedbackLugar.Add(ComentarioFeedbackLugar);
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
            return listaComentariosFeedbackLugar;
        }

        #endregion

    }
}
