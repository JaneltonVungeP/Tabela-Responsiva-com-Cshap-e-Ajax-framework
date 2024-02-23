using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UltimateGridViewVsUltimateDataList.gridview.gridview1
{
    public partial class gridview1 : System.Web.UI.Page
    {
        static string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection($"{connection}");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                showtable();

            }
            
        }

        public void showtable()
        {
            con.Open();
            String query = "select * from gridview";
            SqlDataAdapter adapter = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count > 0)
            {   
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GridView1.DataSource= dt;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan= dt.Columns.Count;
                GridView1.Rows[0].Cells[0].Text="no data fount!";
                GridView1.Rows[0].Cells[0].HorizontalAlign= HorizontalAlign.Center;
           

            }
           
            con.Close();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")  
            {
                //inserting
                string success = @"swal('Operação concluida', 'Adicionado com sucesso', 'success');";
                string firtname = (GridView1.FooterRow.FindControl("TextBox5") as TextBox).Text;
                string lastname = (GridView1.FooterRow.FindControl("TextBox6") as TextBox).Text;
                string phonenumber = (GridView1.FooterRow.FindControl("TextBox7") as TextBox).Text;
                string email = (GridView1.FooterRow.FindControl("TextBox8") as TextBox).Text;
                con.Open();
                string query = "insert into [gridview] (firstname,lastname,phonenumber,email) VALUES (@firstname,@lastname,@phonenumber,@email)";
                SqlCommand cmd = new SqlCommand(query, con);
                
                cmd.Parameters.Add("@firstname", SqlDbType.NVarChar, 100).Value = firtname;
                cmd.Parameters.Add("@lastname", SqlDbType.NVarChar, 100).Value = lastname;
                cmd.Parameters.Add("@phonenumber", SqlDbType.NVarChar, 100).Value = phonenumber;
                cmd.Parameters.Add("@email", SqlDbType.NVarChar, 100).Value = email;
          
                cmd.ExecuteNonQuery();
                con.Close();
                firtname="";
                lastname="";
                phonenumber="";
                email="";
                showtable();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "janelton disse", success, true);
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //editing new page
            GridView1.EditIndex = e.NewEditIndex;
            showtable();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //cancel
            GridView1.EditIndex = -1;
            showtable();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //updating
            string success = @"swal('Operação concluida', 'Atualizado com sucesso', 'success');";
            string firtname = (GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox).Text;
            string lastname = (GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox).Text;
            string phonenumber = (GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox).Text;
            string email = (GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox).Text;
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            string query = "update [gridview] set firstname=@firstname,lastname=@lastname,phonenumber=@phonenumber,email=@email where id=@id";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.Add("@firstname", SqlDbType.NVarChar, 100).Value = firtname;
            cmd.Parameters.Add("@lastname", SqlDbType.NVarChar, 100).Value = lastname;
            cmd.Parameters.Add("@phonenumber", SqlDbType.NVarChar, 100).Value = phonenumber;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar, 100).Value = email;
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            con.Close();
            firtname = "";
            lastname = "";
            phonenumber = "";
            email = "";
            showtable();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "janelton disse", success, true);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //deleting
            string success = @"swal('Operação concluida', 'Deletado com sucesso', 'success');";

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            con.Open();
            string query = "delete from [gridview] where id=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
            cmd.ExecuteNonQuery();
            con.Close();
            showtable();
            
            ClientScript.RegisterClientScriptBlock(this.GetType(),"janelton disse", success, true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Thread.Sleep(5000);
         
        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {
            //searchbar
            con.Open(); 
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from gridview where (firstname like '%" + TextBox9.Text + "%') or  (id like '%" + TextBox9.Text + "%') ", con);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
               
                GridView1.DataSourceID = null;
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
            }
            else
            {
                dataTable.Rows.Add(dataTable.NewRow());
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dataTable.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "Nenhum dado encontrado tente novamente!";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;


            }

            
            con.Close();
        }
    }
}