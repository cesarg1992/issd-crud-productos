using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productos
{
    public partial class Productos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(descripcion.Text))
            {
                lblAviso.Text = "Ingrese descripción del producto.";
            }
            else
            {
                productosDs.InsertParameters["Descripcion"].DefaultValue = descripcion.Text;
                productosDs.Insert();
                lblAviso.Text = "";
                descripcion.Text = "";
            }
        }
    }
}