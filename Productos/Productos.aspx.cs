using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productos
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            productosDs.InsertParameters["Descripcion"].DefaultValue = descripcion.Text;
            productosDs.Insert();
            lblAviso.Text = "*producto cargado correctamente";
            descripcion.Text = "";
        }
    }
}