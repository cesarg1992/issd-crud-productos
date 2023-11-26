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
            clndVigencia.SelectedDate = DateTime.Now;
        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            preciosDs.InsertParameters["Monto"].DefaultValue = txtPrecio.Text;
            preciosDs.InsertParameters["Fecha"].DefaultValue = clndVigencia.SelectedDate.ToString();
            preciosDs.InsertParameters["idProducto"].DefaultValue = ddlProductos.SelectedValue.ToString();
            preciosDs.Insert();
            ddlProductos.SelectedValue = "";
            txtPrecio.Text = "";
            clndVigencia.SelectedDate = DateTime.Now;
        }
    }
}