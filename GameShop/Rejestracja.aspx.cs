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
    public partial class Contact : Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dalej_Click(object sender, EventArgs e)
        {
            con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\kamil\source\repos\GameShop\GameShop\App_Data\MyDb.mdf;Integrated Security=True";
            String imieNazwisko = imie.Text +" " +nazwisko.Text;

            SqlCommand cmd1 = new SqlCommand("select Login from Uzytkownicy where Login=@login1",con);
            cmd1.Parameters.AddWithValue("@login1", login.Text);

            
            SqlCommand cmd = new SqlCommand("insert into [Uzytkownicy]"+"(Login,Haslo,Imie_nazwisko,Email,Telefon,Adres) values(@login,@haslo,@im_naz,@email,@telefon,@adres)", con);
            cmd.Parameters.AddWithValue("@login", login.Text);
            cmd.Parameters.AddWithValue("@haslo", haslo.Text);
            cmd.Parameters.AddWithValue("@im_naz", imieNazwisko);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@telefon", telefon.Text);
            cmd.Parameters.AddWithValue("@adres", adres.Text);

            con.Open();

            SqlDataAdapter sda = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Response.Write("Login o nazwie " + login.Text + " jest już zajęty!");
            }
            else
            {
                cmd.ExecuteNonQuery();
                Response.Write("Rejestracja zakończona!");
            }

            con.Close();

            login.Text = "";
            haslo.Text = "";
            imie.Text = "";
            nazwisko.Text = "";
            email.Text = "";
            telefon.Text = "";
            adres.Text = "";
        }
    }
}