using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

using System.Web.UI.WebControls;

namespace GameShop
{
    public partial class About : Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();


        protected void Page_Load(object sender, EventArgs e)
        {

            var dialog = (Label)LoginView1.FindControl("Okno");

            dialog.Visible = false;

            if (!IsPostBack)

            {

                BindData();

            }

            var confirm = (Label)LoginView1.FindControl("confirm");
            var tak = (Button)LoginView1.FindControl("tak");
            var nie = (Button)LoginView1.FindControl("nie");

            tak.Visible = false;
            nie.Visible = false;
            confirm.Visible = false;

            var ListaGier = (GridView)LoginView1.FindControl("ListaGier");

            con.ConnectionString = @"Data Source=KAMIL-PC\SQLEXPRESS;Initial Catalog=s4SwietochowskiK;Integrated Security=True";
            SqlCommand cmd = new SqlCommand("select * from [Baza_gier]", con);
            SqlCommand cmd1 = new SqlCommand("select * from [Baza_gier]", con);
            con.Open();

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListaGier.DataSource = dt;
            ListaGier.DataBind();
        }

        protected void szukajGry_Click(object sender, EventArgs e)
        {
            var ListaGier = (GridView)LoginView1.FindControl("ListaGier");
            var wpiszNazwe = (TextBox)LoginView1.FindControl("wpiszNazwe");


            SqlCommand cmd = new SqlCommand("select * from [Baza_gier] where Nazwa like '%' + @sql + '%';", con);
            cmd.Parameters.AddWithValue("@sql", wpiszNazwe.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListaGier.DataSource = dt;
            ListaGier.DataBind();

            wpiszNazwe.Text = "";
        }

        protected void listaFiltr_SelectedIndexChanged(object sender, EventArgs e)
        {
            var CheckBoxList1 = (CheckBoxList)LoginView1.FindControl("CheckBoxList1");
            var listaFiltr = (DropDownList)LoginView1.FindControl("listaFiltr");

            CheckBoxList1.Items.Clear();
            SqlCommand cmd = new SqlCommand();
            if (listaFiltr.Text.Equals(""))
            {

            }
            else if (listaFiltr.Text.Equals("Cena"))
            {
                CheckBoxList1.Items.Add("Cena do 50zł");
                CheckBoxList1.Items.Add("Cena do 100zł");
                CheckBoxList1.Items.Add("Cena do 150zł");
                CheckBoxList1.Items.Add("Cena powyżej 150zł");
            }
            else
            {
                if (listaFiltr.Text.Equals("Kategoria"))
                {
                    cmd = new SqlCommand("select distinct [Kategoria] from [Baza_gier]", con);
                }
                else if (listaFiltr.Text.Equals("Platforma"))
                {
                    cmd = new SqlCommand("select distinct [Platforma] from [Baza_gier]", con);
                }

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    CheckBoxList1.Items.Add(rdr.GetValue(0).ToString());
                }

                rdr.Close();

            }
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var ListaGier = (GridView)LoginView1.FindControl("ListaGier");
            var CheckBoxList1 = (CheckBoxList)LoginView1.FindControl("CheckBoxList1");
            var listaFiltr = (DropDownList)LoginView1.FindControl("listaFiltr");

            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items.Cast<ListItem>().Any(item => item.Selected))
                {
                    SqlCommand cmd = new SqlCommand();

                    if (listaFiltr.Text.Equals("Kategoria"))
                    {
                        cmd = new SqlCommand("select * from [Baza_gier] where Kategoria=@sql", con);
                        cmd.Parameters.AddWithValue("@sql", CheckBoxList1.SelectedItem.Text);
                    }
                    else if (listaFiltr.Text.Equals("Platforma"))
                    {
                        cmd = new SqlCommand("select * from [Baza_gier] where Platforma=@sql", con);
                        cmd.Parameters.AddWithValue("@sql", CheckBoxList1.SelectedItem.Text);
                    }
                    else if (listaFiltr.Text.Equals("Cena"))
                    {
                        if (CheckBoxList1.SelectedItem.Text.Equals("Cena do 50zł"))
                        {
                            cmd = new SqlCommand("select * from [Baza_gier] where Cena_kupna <= 50", con);
                        }
                        else if (CheckBoxList1.SelectedItem.Text.Equals("Cena do 100zł"))
                        {
                            cmd = new SqlCommand("select * from [Baza_gier] where Cena_kupna <= 100", con);
                        }
                        else if (CheckBoxList1.SelectedItem.Text.Equals("Cena do 150zł"))
                        {
                            cmd = new SqlCommand("select * from [Baza_gier] where Cena_kupna <= 150", con);
                        }
                        else if (CheckBoxList1.SelectedItem.Text.Equals("Cena powyżej 150zł"))
                        {
                            cmd = new SqlCommand("select * from [Baza_gier] where Cena_kupna > 150", con);
                        }
                    }

                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ListaGier.DataSource = dt;
                    ListaGier.DataBind();
                }
            }
        }

        protected void ListaGier_SelectedIndexChanged(object sender, EventArgs e)
        {

            var confirm = (Label)LoginView1.FindControl("confirm");
            var tak = (Button)LoginView1.FindControl("tak");
            var nie = (Button)LoginView1.FindControl("nie");

            tak.Visible = true;
            nie.Visible = true;
            confirm.Visible = true;

            var ListaGier = (GridView)LoginView1.FindControl("ListaGier");



            
        }


        protected void tak_Click(object sender, EventArgs e)
        {
            var ListaGier = (GridView)LoginView1.FindControl("ListaGier");

              String login = Context.User.Identity.Name;

              int tmp = (int)ListaGier.SelectedValue;

              SqlCommand cmd = new SqlCommand("insert into Zamowienia(ID_produktu,ID_uzytkownika,Data) values(@Id_prod,(select distinct ID from Uzytkownicy where Login=@login),GETDATE())", con);
              cmd.Parameters.AddWithValue("@Id_prod", tmp);
              cmd.Parameters.AddWithValue("@login", login);

              cmd.ExecuteNonQuery();

            var dialog = (Label)LoginView1.FindControl("Okno");

            dialog.Visible = true;
            dialog.Text = "Złożono zamówienie";
        }

        protected void nie_Click(object sender, EventArgs e)
        {
            var confirm = (Label)LoginView1.FindControl("confirm");
            var tak = (Button)LoginView1.FindControl("tak");
            var nie = (Button)LoginView1.FindControl("nie");

            tak.Visible = false;
            nie.Visible = false;
            confirm.Visible = false;



            con.Close();
        }


        protected void BindData()

        {
            var ListaGier = (GridView)LoginView1.FindControl("ListaGier");
            DataSet ds = new DataSet();

            try

            {

                ds.ReadXml(Server.MapPath("EmployeeDetails.xml"));

                if (ds != null && ds.HasChanges())

                {

                    ListaGier.DataSource = ds;

                    ListaGier.DataBind();

                }

            }

            catch (Exception ex)

            {

            }

        }



        protected void ListaGier_PageIndexChanging(object sender, GridViewPageEventArgs e)

        {
            var ListaGier = (GridView)LoginView1.FindControl("ListaGier");
            ListaGier.PageIndex = e.NewPageIndex;

            BindData();

        }
    }


    /*
private string ConvertSortDirectionToSql(SortDirection sortDirection)
{
string newSortDirection = String.Empty;

switch (sortDirection)
{
   case SortDirection.Ascending:
       newSortDirection = "ASC";
       break;

   case SortDirection.Descending:
       newSortDirection = "DESC";
       break;
}

return newSortDirection;
}

protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
{
DataTable dataTable = ListaGier.DataSource as DataTable;

if (dataTable != null)
{
   DataView dataView = new DataView(dataTable);
   dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

   ListaGier.DataSource = dataView;
   ListaGier.DataBind();
}
}
*/

}
