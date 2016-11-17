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
    internal class PersistenciaComentariosFeedbackEvento:IPersistenciaComentariosFeedbackEvento
    {
        
           #region Singleton

        private static PersistenciaComentariosFeedbackEvento _instancia = null;

        private PersistenciaComentariosFeedbackEvento() { }

        public static PersistenciaComentariosFeedbackEvento GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaComentariosFeedbackEvento();

            return _instancia;
        }

        #endregion

        #region Operaciones

        public void AltaComentarioFeebackEvento(ComentarioFeedbackEvento e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("AltaComentarioFeedbackEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdFeedback", e.MensajeAsociado.IdFeedbackEvento);
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

        public void ModificarComentarioFeebackEvento(ComentarioFeedbackEvento e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("ModificarComentarioFeedbackEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdComentario", e.IdComentarioEvento);
            cmd.Parameters.AddWithValue("pIdFeedback", e.MensajeAsociado.IdFeedbackEvento);
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

        public void BajaComentarioFeedbackEvento(ComentarioFeedbackEvento e)
        {
            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("EliminarComentarioFeedbackEvento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("pIdComentario", e.IdComentarioEvento);

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

        public ComentarioFeedbackEvento BuscarComentarioDeunMensajeFeedbackEvento(int IdFeedback,int IdComentario)
        {
           ComentarioFeedbackEvento ComentarioFeedbackEvento = null;

            MySqlConnection con = new MySqlConnection(Conexion.Cnn);
            MySqlCommand cmd = new MySqlCommand("BuscarComentariodeUnMensajeFeebackEvento", con);
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


                    ComentarioFeedbackEvento = new ComentarioFeedbackEvento(IdComentario, Convert.ToString(oReader["AsuntoComentario"]),Convert.ToString(oReader["MensajeComentario"]), unUsuario, Convert.ToDateTime(oReader["FechaRealizado"]),PersistenciaFeedbackEvento.GetInstancia().BuscarMensajeFeedbackEvento(IdFeedback));
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
            return ComentarioFeedbackEvento;
        }

        public List<ComentarioFeedbackEvento> ListarComentariosFeedbackEvento()
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            ComentarioFeedbackEvento ComentarioFeedbackEvento = null;
            List<ComentarioFeedbackEvento> listaComentariosFeedbackEvento = new List<ComentarioFeedbackEvento>();

            MySqlCommand comando = new MySqlCommand("ListarComentariosFeedbackEvento", conexion);
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

                        ComentarioFeedbackEvento = new  ComentarioFeedbackEvento(Convert.ToInt32(lector["IdComentario"]), Convert.ToString(lector["AsuntoComentario"]),Convert.ToString(lector["MensajeComentario"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), PersistenciaFeedbackEvento.GetInstancia().BuscarMensajeFeedbackEvento((int)lector["IdFeedback"]));
                        listaComentariosFeedbackEvento.Add(ComentarioFeedbackEvento);
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
            return listaComentariosFeedbackEvento;
        }

        public List<ComentarioFeedbackEvento> ListarComentariosFeedbackEventoxUsuario(string CiUsuario)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            ComentarioFeedbackEvento ComentarioFeedbackEvento = null;
            List<ComentarioFeedbackEvento> listaComentariosFeedbackEvento = new List<ComentarioFeedbackEvento>();

            MySqlCommand comando = new MySqlCommand("ListarComentariosFeedbackEventoxUsuario", conexion);
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

                        ComentarioFeedbackEvento = new ComentarioFeedbackEvento(Convert.ToInt32(lector["IdComentario"]), Convert.ToString(lector["AsuntoComentario"]), Convert.ToString(lector["MensajeComentario"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), PersistenciaFeedbackEvento.GetInstancia().BuscarMensajeFeedbackEvento((int)lector["IdFeedback"]));
                        listaComentariosFeedbackEvento.Add(ComentarioFeedbackEvento);
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
            return listaComentariosFeedbackEvento;
        }

        public List<ComentarioFeedbackEvento> ListarComentariosdeUnMensajeFeedbackEvento(int IdFeedback)
        {
            MySqlConnection conexion = new MySqlConnection(Conexion.Cnn);
            ComentarioFeedbackEvento ComentarioFeedbackEvento = null;
            List<ComentarioFeedbackEvento> listaComentariosFeedbackEvento = new List<ComentarioFeedbackEvento>();

            MySqlCommand comando = new MySqlCommand("ListarComentariosdeUnMensajeFeedbackEvento", conexion);
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

                        ComentarioFeedbackEvento = new ComentarioFeedbackEvento(Convert.ToInt32(lector["IdComentario"]), Convert.ToString(lector["AsuntoComentario"]), Convert.ToString(lector["MensajeComentario"]), unUsuario, Convert.ToDateTime(lector["FechaRealizado"]), PersistenciaFeedbackEvento.GetInstancia().BuscarMensajeFeedbackEvento(IdFeedback));
                        listaComentariosFeedbackEvento.Add(ComentarioFeedbackEvento);
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
            return listaComentariosFeedbackEvento;
        }



        #endregion
    }
}
