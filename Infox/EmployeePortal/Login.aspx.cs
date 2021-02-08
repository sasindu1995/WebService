using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using Common.BL;

namespace HRM.EmployeePortal
{
    public partial class Login : System.Web.UI.Page
    {
        User objUser = new User();
     
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Session["SearchEmpLead"] = null;
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    txtUserName.Text = Request.Cookies["UserName"].Value;
                    txtpass.Attributes["value"] = Request.Cookies["Password"].Value;
                }
            }
        }
        public void InitializeControls()
        {
            txtUserName.Text = string.Empty;
            txtpass.Text = string.Empty;
           
        }
      

        protected void btSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                
                if (dxdDCompany.Text == "")
                {
                    lbMessage.Text = "Please Select Your Location..!";
                    txtUserName.Text = string.Empty;
                    txtpass.Text = string.Empty;
                }
                else
                {
                    objUser.UserAuthentication(txtUserName.Text, txtpass.Text);

                    if (objUser.IsSuccess)
                    {

                        Session["UserId"] = objUser.LoggedUserEmployeeId;
                        Session["UserName"] = txtUserName.Text;
                        Session["UserType"] = objUser.LoggedUserUserType;
                        Session["UserName"] = objUser.LoggedUserUserName;
                        Session["LocationId"] = dxdDCompany.Value;

                        DataTable tbGetLocation = objUser.CheckMultipleLocation(Convert.ToInt32(Session["UserType"]));
                         if (tbGetLocation.Rows.Count > 0)
                         {
                             bool isAllowMultiple = Convert.ToBoolean(tbGetLocation.Rows[0]["IsMultipleLocation"].ToString());
                             if (isAllowMultiple)
                             {
                                 Session["MultipleLocationId"] = 0;
                             }
                             else
                             Session["MultipleLocationId"] = Session["LocationId"];
                         }
                        Session.Timeout = 300;
                        if (Request.QueryString["DoRedirect"] != null)
                        {
                            Response.Redirect(Request.QueryString["DoRedirect"] as string);
                        }
                        else
                        {
                            if (Page.Request.Form["Field"] == "1")
                            {
                                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                                Response.Cookies["UserName"].Value = txtUserName.Text.Trim();
                                Response.Cookies["Password"].Value = txtpass.Text.Trim();
                            }
                            else
                            {
                                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(1);
                                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(1);

                            }

                            Response.Redirect("~/ServiceRegistration.aspx");
                        }

                    }
                    else
                    {
                        lbMessage.Text = "Invalid Login Details..!";
                    }
                }
             
            }
            catch { }
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            string UserName = txtUserName.Text;
            DataTable User = objUser.GetUserLoginLocation(UserName);
            dxdDCompany.DataSource = User;
            dxdDCompany.TextField = "LocationName";
            dxdDCompany.ValueField = "LocationId";
            dxdDCompany.DataBind();
        }

    
    }
}