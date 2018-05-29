using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameShop
{
    public partial class MojeKonto : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            var dialog = (Label)LoginView1.FindControl("Okno");

            dialog.Visible = false;

            var email = (TextBox)LoginView1.FindControl("email");
            var nr = (TextBox)LoginView1.FindControl("nr");
            var adres = (TextBox)LoginView1.FindControl("adres");
            var miasto = (TextBox)LoginView1.FindControl("miasto");

            email.Visible = false;
            nr.Visible = false;
            adres.Visible = false;
            miasto.Visible = false;


            var Button5 = (Button)LoginView1.FindControl("Button5");
            var Button6 = (Button)LoginView1.FindControl("Button6");
            var Button7 = (Button)LoginView1.FindControl("Button7");
            var Button8 = (Button)LoginView1.FindControl("Button8");


            Button5.Visible = false;
            Button6.Visible = false;
            Button7.Visible = false;
            Button8.Visible = false;



            var dane = (Label)LoginView1.FindControl("dane");

            String login = Context.User.Identity.Name;

            con.ConnectionString = @"Data Source=KAMIL-PC\SQLEXPRESS;Initial Catalog=s4SwietochowskiK;Integrated Security=True";
            SqlCommand SelectCommand= new SqlCommand("select imie_nazwisko from Uzytkownicy where Login=@sql", con);
            SelectCommand.Parameters.AddWithValue("@sql", login);

            SqlDataReader reader;

            con.Open();
            reader = SelectCommand.ExecuteReader();

            List<String> lista = new List<String>();

            while (reader.Read())
            {
                lista.Add(reader[0].ToString());

                dane.Text = lista[0];
            }

            reader.Close();


            var mojeDane = (GridView)LoginView1.FindControl("mojeDane");

            SqlCommand cmd = new SqlCommand("select Login,Imie_nazwisko,Email,Telefon,Adres,Miasto from Uzytkownicy where Login=@login", con);
            cmd.Parameters.AddWithValue("@login", login);

            SqlDataAdapter sda1 = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            mojeDane.DataSource = dt1;
            mojeDane.DataBind();

            con.Close();

        }

        protected void BindData()

        {

            var mojeDane = (GridView)LoginView1.FindControl("mojeDane");

            DataSet ds = new DataSet();

            try

            {

                ds.ReadXml(Server.MapPath("EmployeeDetails.xml"));

                if (ds != null && ds.HasChanges())

                {

                    mojeDane.DataSource = ds;

                    mojeDane.DataBind();

                }

            }

            catch (Exception ex)

            {

            }

        }



        protected void mojeDane_PageIndexChanging(object sender, GridViewPageEventArgs e)

        {
            var mojeDane = (GridView)LoginView1.FindControl("mojeDane");
            mojeDane.PageIndex = e.NewPageIndex;

            BindData();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var email = (TextBox)LoginView1.FindControl("email");
            var Button5 = (Button)LoginView1.FindControl("Button5");
            

            Button5.Visible = true;
            email.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var nr = (TextBox)LoginView1.FindControl("nr");
            var Button6 = (Button)LoginView1.FindControl("Button6");


            Button6.Visible = true;
            nr.Visible = true;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            var adres = (TextBox)LoginView1.FindControl("adres");
            adres.Visible = true;
            var Button7 = (Button)LoginView1.FindControl("Button7");


            Button7.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            var miasto = (TextBox)LoginView1.FindControl("miasto");
            miasto.Visible = true;
            var Button8 = (Button)LoginView1.FindControl("Button8");


            Button8.Visible = true;

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            String login = Context.User.Identity.Name;

            var email = (TextBox)LoginView1.FindControl("email");

            if (email.Text.Equals(""))
            {
                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "To pole nie może być puste!";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("update Uzytkownicy set Email=@email where Login=@login", con);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@login", login);
                con.Open();
                cmd.ExecuteNonQuery();

                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "Zmieniono";
            }

            con.Close();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            String login = Context.User.Identity.Name;
            var nr = (TextBox)LoginView1.FindControl("nr");
            int errorCount;

            if (nr.Text.Equals(""))
            {
                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "To pole nie może być puste!";
            }
            else if ((errorCount = Regex.Matches(nr.Text, @"[a-zA-Z]").Count) > 0)
            {
                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "To pole nie może zawierać liter!";
            }
            else if ((nr.Text.Length) > 9)
            {
                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "To pole może zawierać max 9 cyfr!";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("update Uzytkownicy set Telefon=@telefon where Login=@login", con);
                cmd.Parameters.AddWithValue("@telefon", nr.Text);
                cmd.Parameters.AddWithValue("@login", login);
                con.Open();
                cmd.ExecuteNonQuery();

                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "Zmieniono!";
            }

            con.Close();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            String login = Context.User.Identity.Name;
            var adres = (TextBox)LoginView1.FindControl("adres");


            if (adres.Text.Equals(""))
            {
                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "To pole nie może być puste!";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("update Uzytkownicy set Adres=@adres where Login=@login", con);
                cmd.Parameters.AddWithValue("@adres", adres.Text);
                cmd.Parameters.AddWithValue("@login", login);
                con.Open();
                cmd.ExecuteNonQuery();

                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "Zmieniono!";
            }

            con.Close();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            String login = Context.User.Identity.Name;
            var miasto = (TextBox)LoginView1.FindControl("miasto");

            if (miasto.Text.Equals(""))
            {
                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "To pole nie może być puste!";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("update Uzytkownicy set Miasto=@miasto where Login=@login", con);
                cmd.Parameters.AddWithValue("@miasto", miasto.Text);
                cmd.Parameters.AddWithValue("@login", login);
                con.Open();
                cmd.ExecuteNonQuery();

                var dialog = (Label)LoginView1.FindControl("Okno");

                dialog.Visible = true;
                dialog.Text = "Zmieniono!";
            }

            con.Close();
        }


        
    }


}