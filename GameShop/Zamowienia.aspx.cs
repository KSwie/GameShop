using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameShop
{
    public partial class Zamowienia : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            var tekst = (Label)LoginView1.FindControl("tekst");

            var user = (Label)LoginView1.FindControl("user");

            user.Text = Context.User.Identity.Name;

            var grid = (GridView)LoginView1.FindControl("GridView1");
            String login = Context.User.Identity.Name;


            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kamil\source\repos\GameShop\GameShop\App_Data\MyDb.mdf;Integrated Security=True";
            SqlCommand cmd = new SqlCommand("select Zamowienia.ID, Zamowienia.Data, Baza_gier.Nazwa, Baza_gier.Platforma, Baza_gier.Cena_kupna from Zamowienia join Baza_gier on Zamowienia.ID_produktu=Baza_gier.ID join Uzytkownicy on Uzytkownicy.ID=Zamowienia.ID_uzytkownika where Login=@sql", con);
            cmd.Parameters.AddWithValue("@sql", login);

            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                grid.DataSource = dt;
                grid.DataBind();
            }
            else
            {
                tekst.Text = "Brak zamówień!";
            }

            

            con.Close();
        }


        protected void BindData()

        {
            var GridView1 = (GridView)LoginView1.FindControl("GridView1");

            DataSet ds = new DataSet();

            try

            {

                ds.ReadXml(Server.MapPath("EmployeeDetails.xml"));

                if (ds != null && ds.HasChanges())

                {

                    GridView1.DataSource = ds;

                    GridView1.DataBind();

                }

            }

            catch (Exception ex)

            {

            }

        }



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)

        {
            var GridView1 = (GridView)LoginView1.FindControl("GridView1");

            GridView1.PageIndex = e.NewPageIndex;

            BindData();

        }
    }
}