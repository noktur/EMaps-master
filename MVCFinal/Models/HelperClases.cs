using EntidadesCompartidas;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCFinal.Models
{

    [Serializable]
    public class imageForCropping
    {
        //public System.Web.HttpPostedFile pic;
        public string originalPicTemp;
        public string pathForSaving;
        public Usuario usr;
        public string x;
        public string y;
        public Image b;
        public string res;
        public string pathForSaving400x300;
        public string pathForSaving1280x220;
        public bool isPng;


        public imageForCropping()
        {
            originalPicTemp = null;
            pathForSaving = null;
            usr = null;
            x = null;
            y = null;
            b = null;
            res = null;
            pathForSaving400x300 = null;
            pathForSaving1280x220 = null;

        }

        public imageForCropping(string pic1, string pathForSaving1, Usuario usr1, string x1, string y1, Image b1, string res1)
        {
            originalPicTemp = pic1;
            pathForSaving = pathForSaving1;
            usr = usr1;
            x = x1;
            y = y1;
            b = b1;
            res = res1;
        }

        public void setPaths(string p400x300, string p1280x220)
        { //aca podemos setear los tamaños
            this.pathForSaving400x300 = p400x300;
            this.pathForSaving1280x220 = p1280x220;
        }
    }
}
