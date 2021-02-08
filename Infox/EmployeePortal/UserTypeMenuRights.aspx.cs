using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.BL;
using System.Data;

namespace HRM.EmployeePortal
{
    public partial class UserTypeMenuRights : System.Web.UI.Page
    {
        User user = new User();
        Lead lead = new Lead();

        DataTable dtLoginTypes = new DataTable();
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    Div1.Visible = false;
        //    Div2.Visible = false;

        //    if (Session["UserName"] == null)
        //    {
        //        Response.Redirect("~/SessionTimeout.aspx?DoRedirect=" + System.Web.HttpContext.Current.Request.Url.AbsolutePath);
        //    }
        //    if (!IsPostBack)
        //    {
        //        GetPages();
        //        DataTable tbGetLocation =user.CheckMultipleLocation(Convert.ToInt32(Session["UserType"]));
        //        if (tbGetLocation.Rows.Count > 0)
        //        {
        //            bool isAllowMultiple =Convert.ToBoolean( tbGetLocation.Rows[0]["IsMultipleLocation"].ToString());
        //            if (isAllowMultiple)
        //            {
        //                GeMultiyLocation();

        //                dxLocation.Visible = true;
        //                    cblLocation.Visible = true;
        //            }
        //        }



        //    }
        //}

        private void GeMultiyLocation()
        {

            try
            {

                var pages = user.GetLocations();
                cblLocation.DataSource = pages;
                cblLocation.TextField = "LocationName";
                cblLocation.ValueField = "LocationId";
                cblLocation.DataBind();



            }
            catch (Exception ex)
            {


            }

        }

        private void GetPages()
        {

            try
            {
                
                var pages = user.GetSystemForms();
                chadminAdd.DataSource = pages.Tables[0];
                chadminAdd.TextField = "PageDescription";
                chadminAdd.ValueField = "ID";
                chadminAdd.DataBind();

                common.DataSource = pages.Tables[1];
                common.TextField = "PageDescription";
                common.ValueField = "ID";
                common.DataBind();


            }
            catch (Exception ex)
            {


            }

        }
        private void SaveUserRole()
        {

            int user =Convert.ToInt32(dxUsers.Value);
            int userRoll=Convert.ToInt32(txtUserRole.Value);
            try
            {
                //txtUseroleid.Text = "1";
                // var userroleid = user.Save_UserRole(string.IsNullOrEmpty(txtUseroleid.Text) ? 0 : int.Parse(txtUseroleid.Text), txtUserRole.SelectedItem.Text);
                if (dxLocation.Visible)
                {
                    SaveUserRoleList(Convert.ToInt32(txtUserRole.Value), Convert.ToInt32(dxUsers.Value), Convert.ToInt32(dxLocation.Value));
                
            }
                else
                {
                    for (var i = 0; i < cblLocation.Items.Count; i++)
                    {
                        if (!Equals(cblLocation.Items[i].Selected, true)) continue;
                        SaveUserRoleList(userRoll, user, int.Parse(cblLocation.Items[i].Value.ToString()));
                    }
                }
                Label2.Text = "User Forms Assign Sucessfull";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "pop('popDivv');", true);
                dxLocation.SelectedIndex = -1;
                dxUsers.SelectedIndex = -1;
                chadminAdd.SelectedIndex = -1;
                common.SelectedIndex = -1;
                cblLocation.SelectedIndex = -1;

            }
            catch (Exception ex)
            {

                Label1.Text = ex.Message;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "pop('popDiv');", true);
            }
        }

        private void SaveUserRoleList(int UserTypeId, int UserId, int LocationId)
        {

            try
            {
                DeleteUserRole(UserId, LocationId);
                for (var i = 0; i < chadminAdd.Items.Count; i++)
                {
                    if (!Equals(chadminAdd.Items[i].Selected, true)) continue;

                    user.Save_UserRoleList(UserTypeId, UserId, LocationId, int.Parse(chadminAdd.Items[i].Value.ToString()), true, true, true, 1);
                }


                for (var i = 0; i < common.Items.Count; i++)
                {
                    if (!Equals(common.Items[i].Selected, true)) continue;

                    user.Save_UserRoleList(UserTypeId, UserId, LocationId, int.Parse(common.Items[i].Value.ToString()), true, true, true, 1);
                }
               // Clear();
                // pawMessage.ShowPopup(1, "User role save successfully.", "");
            }
            catch (Exception ex)
            {

                // ErrHandler.WriteError(ex.Message);
            }
        }
        private void DeleteUserRole(int UserId, int LocationId)
        {

            try
            {
                user.Delete_UserRoleList(UserId, LocationId);
            }
            catch (Exception ex)
            {


            }
        }
        private void Clear()
        {

            dxLocation.SelectedIndex = -1;
            dxUsers.SelectedIndex = -1;
            chadminAdd.SelectedIndex = -1;
            common.SelectedIndex = -1;
           // cblLocation.SelectedIndex = -1;

        }
     
        private void SetUserPages(int id)
        {

            try
            {
                var pages = user.GetUserRoleList(id);
                foreach (DataRow dr in pages.Tables[0].Rows)
                {
                    for (var i = 0; i < chadminAdd.Items.Count; i++)
                    {
                        if (!Equals(dr["PageID"].ToString(), chadminAdd.Items[i].Value)) continue;
                        chadminAdd.Items[i].Selected = true;
                        break;
                    }

                    for (var i = 0; i < common.Items.Count; i++)
                    {
                        if (!Equals(dr["PageID"].ToString(), common.Items[i].Value)) continue;
                        common.Items[i].Selected = true;
                        break;
                    }



                }

            }
            catch (Exception ex)
            {

                Label1.Text = ex.Message;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "pop('popDiv');", true);
            }

        }


        protected void btSaveExtarActivity_Click(object sender, EventArgs e)
        {
            SaveUserRole();
        }

        protected void btnClr_Click(object sender, EventArgs e)
        {
            chadminAdd.SelectedIndex = -1;
            common.SelectedIndex = -1;
            txtUserRole.Text = string.Empty;
            txtUserRole.IsValid = true;
            SetUserPages(Convert.ToInt32(0));
        }

        protected void dxLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            for (var i = 0; i < chadminAdd.Items.Count; i++)
            {
                chadminAdd.Items[i].Selected = false;
            }

            for (var i = 0; i < common.Items.Count; i++)
            {
                common.Items[i].Selected = false;
            }

            DataTable tblUser = user.GetPORUserPermissions(Convert.ToInt32(txtUserRole.Value), Convert.ToInt32(dxUsers.Value), Convert.ToInt32(dxLocation.Value));

            foreach (DataRow dr in tblUser.Rows)
            {
                for (var i = 0; i < chadminAdd.Items.Count; i++)
                {
                    if (!Equals(dr["PageID"].ToString(), chadminAdd.Items[i].Value)) continue;
                    chadminAdd.Items[i].Selected = true;

                    break;
                }

                for (var i = 0; i < common.Items.Count; i++)
                {
                    if (!Equals(dr["PageID"].ToString(), common.Items[i].Value)) continue;
                    common.Items[i].Selected = true;
                    break;
                }
            }
        }

        protected void dxUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cblLocation.Visible)
            {
                for (var i = 0; i < cblLocation.Items.Count; i++)
                {
                    cblLocation.Items[i].Selected = false;
                }

                for (var i = 0; i < chadminAdd.Items.Count; i++)
                {
                    chadminAdd.Items[i].Selected = false;
                }

                for (var i = 0; i < common.Items.Count; i++)
                {
                    common.Items[i].Selected = false;
                }
                DataTable tblUser = user.GetPORUserPermissions(Convert.ToInt32(txtUserRole.Value), Convert.ToInt32(dxUsers.Value), Convert.ToInt32(dxLocation.Value));
                DataTable tblUserLocations = user.GetUserLocations(Convert.ToInt32(txtUserRole.Value), Convert.ToInt32(dxUsers.Value));
                foreach (DataRow dr in tblUserLocations.Rows)
                {
                    for (var i = 0; i < cblLocation.Items.Count; i++)
                    {
                        if (!Equals(dr["LocationId"].ToString(), cblLocation.Items[i].Value)) continue;
                        cblLocation.Items[i].Selected = true;

                        break;
                    }
                }

              

                foreach (DataRow dr in tblUser.Rows)
                {
                    for (var i = 0; i < chadminAdd.Items.Count; i++)
                    {
                        if (!Equals(dr["PageID"].ToString(), chadminAdd.Items[i].Value)) continue;
                        chadminAdd.Items[i].Selected = true;

                        break;
                    }

                    for (var i = 0; i < common.Items.Count; i++)
                    {
                        if (!Equals(dr["PageID"].ToString(), common.Items[i].Value)) continue;
                        common.Items[i].Selected = true;
                        break;
                    }
                }
            }
        }

        //protected void txtUserRole_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (txtUserRole.SelectedIndex != -1)
        //    {
        //        DataTable tbGetLocation = user.CheckMultipleLocation(Convert.ToInt32(txtUserRole.Value.ToString()));
        //        if (tbGetLocation.Rows.Count > 0)
        //        {
        //            bool isAllowMultiple = Convert.ToBoolean(tbGetLocation.Rows[0]["IsMultipleLocation"].ToString());
        //            if (isAllowMultiple)
        //            {
        //                GeMultiyLocation();

        //                dxLocation.Visible = true;
        //                cblLocation.Visible = true;
        //            }
        //            else
        //            {
        //                dxLocation.Visible = false;
        //                cblLocation.Visible = false;
        //            }

        //        }
        //    }
        //}

       
    }
}