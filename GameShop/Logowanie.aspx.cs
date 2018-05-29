using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameShop
{
    public partial class strona : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();

        protected void logowanie_Click(object sender, EventArgs e)
        {
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kamil\source\repos\GameShop\GameShop\App_Data\MyDb.mdf;Integrated Security=True";
            SqlCommand cmd = new SqlCommand("select * from [Uzytkownicy] where Login=@login and Haslo=@haslo", con);
            cmd.Parameters.AddWithValue("@login", login.Text);
            cmd.Parameters.AddWithValue("@haslo", haslo.Text);

            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            
            con.Close();

            if (dt.Rows.Count > 0 )
            {
                FormsAuthentication.RedirectFromLoginPage
                (login.Text, false);

                Response.Redirect("MojeKonto.aspx");
            }
            else
            {
                

                Okno.Visible = true;
                Okno.Text = "Błędne dane spróbuj jeszcze raz";
            }
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Okno.Visible = false;
        }
    }
}