using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.BL;

namespace HRM.EmployeePortal
{
 
    public partial class ChangePassword : System.Web.UI.Page
    {
        DataTable dtUser = new DataTable();
        User objUser = new User();
        protected void Page_Load(object sender, EventArgs e)
        {

            popDivv.Visible = false;
            popDiv.Visible = false;


            if (Session["UserName"] == null)
            {
                Response.Redirect("~/SessionTimeout.aspx?DoRedirect=" + System.Web.HttpContext.Current.Request.Url.AbsolutePath);
            }

            if (!Page.IsPostBack)
            {

                dtUser = objUser.GetUserLoginDetails(Convert.ToInt64(Session["UserId"]));

                //txtEmpCode.Text = dtUser.Rows[0]["EmployeeCode"].ToString();
                txtLoginType.Text = dtUser.Rows[0]["UserTypeName"].ToString();
                txtUserName.Text = dtUser.Rows[0]["UserName"].ToString();
                txtCurrentPw.Text = dtUser.Rows[0]["Password"].ToString();
                //radtxtNewPassword.Text = dtUser.Rows[0][""].ToString();
                //radtxtConfirmPassword.Text = dtUser.Rows[0][""].ToString();
                radtxtSecurityQuestion.Text = dtUser.Rows[0]["SecurityQuestion"].ToString();
                radtxtAnswer.Text = dtUser.Rows[0]["Answer"].ToString();
                hfPassword.Value = dtUser.Rows[0]["Password"].ToString();

            }
        }


        protected void radbtnChange_Click(object sender, EventArgs e)
        {
            User objUser = new User();
            objUser.UserAuthenticationPassword(txtCurrentPw.Text);

            Password.Visible = true;

            //if (objUser.IsSuccess == true)
            //{
            //    Password.Visible = true;
            //}
            //else
            //{
            //    lberror.Text = "Enter Current Password";
            //    popDiv.Visible = true;
            //}
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Password.Visible = false;
        }

        protected void btSaveExtarActivity_Click(object sender, EventArgs e)
        {
            string password = string.Empty;
            string NewPassword = string.Empty;
            if (txtNewPassword.Text == string.Empty)
            {
                password = hfPassword.Value.ToString();
                NewPassword = hfPassword.Value.ToString();
            }
            else
            {
                password = txtCurrentPw.Text;
                NewPassword = txtNewPassword.Text;
            }

            objUser.AddUserLoginDetails(Convert.ToInt64(Session["UserId"]), radtxtSecurityQuestion.Text, radtxtAnswer.Text,
                Convert.ToInt64(Session["UserId"]), DateTime.Today, password, NewPassword);


            if (objUser.IsSuccess == true)
            {
                lbSuccess.Text = "Login Details Successfully Changed.";
                popDivv.Visible = true;
                Password.Visible = false;
            }
            else if (objUser.IsSuccess == false)
            {
                lberror.Text = "Please Enter Current Password";
                popDiv.Visible = true;
               
            }
        }

        protected void btClear_Click(object sender, EventArgs e)
        {
            radtxtSecurityQuestion.IsValid = true;
            radtxtAnswer.IsValid = true;
            Password.Visible = false;
        }
    }
}