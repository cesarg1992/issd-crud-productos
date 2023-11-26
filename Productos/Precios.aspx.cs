using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productos
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlProductos.SelectedValue))
            {
                lblAviso.Text = "Ingrese Producto";
                return;
            }
            if (string.IsNullOrEmpty(txtPrecio.Text))
            {
                lblAviso.Text = "Ingrese Monto";
                return;
            }
            if (clndVigencia.SelectedDate.Year == 1)
            {
                lblAviso.Text = "Ingrese Fecha";
                return;
            }

            lblAviso.Text = "";
            preciosDs.InsertParameters["Monto"].DefaultValue = txtPrecio.Text;
            preciosDs.InsertParameters["Fecha"].DefaultValue = clndVigencia.SelectedDate.ToString();
            preciosDs.InsertParameters["idProducto"].DefaultValue = ddlProductos.SelectedValue.ToString();
            preciosDs.Insert();
            txtPrecio.Text = "";
        }
    }
}