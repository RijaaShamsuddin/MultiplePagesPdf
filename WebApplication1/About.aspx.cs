using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            var hiddenValue = hdf2.Value;
            Session["hd2"] = hiddenValue;
            Response.Redirect("/Contact.aspx");
        }
    }
}