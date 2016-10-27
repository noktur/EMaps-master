using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Persistencia
{
	 public class Conexion
	{
        private static string _cnn ="server=localhost; database=SistemaEventos; user id=root; password=matias";

        public static string Cnn
        {
            get { return _cnn; }
        }
    }
	
}
