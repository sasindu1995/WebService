using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.BL;
using System.Data;
using DevExpress.Web.Rendering;

namespace HRM.EmployeePortal
{
    public partial class CreateUser : System.Web.UI.Page
    {
        User objUser = new User();
        DataTable dtUser = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            popDiv.Visible = false;
            popDivv.Visible = false;

            if (Session["UserName"] == null)
            {
                Response.Redirect("~/SessionTimeout.aspx?DoRedirect=" + System.Web.HttpContext.Current.Request.Url.AbsolutePath);
            }
            if (!IsPostBack)
            {

                changeAttPopUp.ShowOnPageLoad = false;
                InitializeControls();
                DataBind();
                fillGrid();
            }
        }

        public void InitializeControls()
        {
            cbLoginType.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtContactNo.Text = string.Empty;
            txtpw.Text = string.Empty;
            txtpwRetype.Text = string.Empty;
            dxcheck.Checked = false;
            txtpwRetype.ReadOnly = false;
            txtpw.ReadOnly = false;
            txtUserName.ReadOnly = false;
            txtpwRetype.Visible = true;
            txtpw.Visible = true;
            txtContactNo.ReadOnly = false;
            lblPassword.Visible = true;
            dxLocation.Visible = true;
            dxLocation.Text = string.Empty;
            lblRetypePassword.Visible = true;
            cbLoginType.IsValid = true;
            txtpwRetype.IsValid = true;
            dxLocation.IsValid = true;
            txtpw.IsValid = true;
            txtUserName.IsValid = true;
            txtContactNo.IsValid = true;
            btnAdd.Text = "Save";
            lblerror.Text = "";
        }

        protected void bntuser_Click(object sender, EventArgs e)
        {
            changeAttPopUp.ShowOnPageLoad = true;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            changeAttPopUp.ShowOnPageLoad = false;
            btnSave.Text = "Save";
            dxtxtUserType.Text = string.Empty;
            lblerror.Text = "";

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int value;
            if (btnSave.Text == "Save")
            {
                value = objUser.AddUserType(dxtxtUserType.Text, cbActive.Checked, cbMultiple.Checked);

                if (objUser.IsError == true)
                {
                    lblerror.Visible = true;
                }
                if (value == 1)
                {
                    lblerror.Visible = true;
                    lblerror.Text = "Record Already Exists!";
                }

                else
                {

                    cbLoginType.DataBind();
                    dxtxtUserType.Text = string.Empty;
                    fillGrid();

                }



            }
            else
            {
                objUser.UpdateUserType(Convert.ToInt32(Session["id"].ToString()), dxtxtUserType.Text, cbActive.Checked, cbMultiple.Checked);
                cbLoginType.DataBind();
                fillGrid();
                dxtxtUserType.Text = string.Empty;
                btnSave.Text = "Save";
            }
        }
        protected void lkSelectUser_Click(object sender, EventArgs e)
        {
            try
            {
                var gridView = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).Grid;
                var index = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).VisibleIndex;

                var UserType = gridView.GetRowValues(index, "UserTypeName").ToString();
                bool Active = Convert.ToBoolean(gridView.GetRowValues(index, "Active"));
                bool multiple = Convert.ToBoolean(gridView.GetRowValues(index, "IsMultipleLocation"));

                hfUserTypeId.Value = gridView.GetRowValues(index, "UserTypeId").ToString();

                Session["id"] = hfUserTypeId.Value;

                dxtxtUserType.Text = UserType.ToString();
                cbActive.Value = Active;
                cbMultiple.Value = multiple;

                btnSave.Text = "Update";


            }
            catch
            {
            }
        }

        private void fillGrid()
        {
            dtUser = objUser.GetPORLoginTypes();
            gvUserType.DataSource = dtUser;
            gvUserType.DataBind();
        }
        protected void lkSelect_Click(object sender, EventArgs e)
        {

            try
            {
                var gridView = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).Grid;
                var index = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).VisibleIndex;

                var userName = gridView.GetRowValues(index, "UserName").ToString(); //Request.QueryString["id"];
                var dxuserType = gridView.GetRowValues(index, "UserTypeName").ToString();
                var password = gridView.GetRowValues(index, "Password").ToString();
                var UserContactNo = gridView.GetRowValues(index, "UserContactNo").ToString();
                var LocationName = gridView.GetRowValues(index, "LocationName").ToString();
                bool isBloked = Convert.ToBoolean(gridView.GetRowValues(index, "IsBlocked").ToString());


                
                txtUserName.Text = userName.ToString();
                txtContactNo.Text = UserContactNo.ToString();
                dxLocation.Text = LocationName.ToString();
                cbLoginType.Text = dxuserType.ToString();
                txtpw.Text = password.ToString();
                dxcheck.Value = isBloked;



                btnAdd.Text = "Update";
                txtUserName.ReadOnly = true;
                txtpwRetype.Visible = false;
                txtpw.Visible = false;
                lblPassword.Visible = false;
                lblRetypePassword.Visible = false;
                dxLocation.Visible = true;
            }
            catch
            {
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnAdd.Text == "Save")
                {
                    objUser.AddUserLoginDetails(Convert.ToInt32(cbLoginType.Value), txtUserName.Text, Convert.ToInt64(Session["EmployeeId"]), DateTime.Today,
                        txtpw.Text,txtContactNo.Text, dxcheck.Checked, Convert.ToInt32(dxLocation.Value));

                    InitializeControls();
                    DataBind();

                    if (objUser.IsError == true)
                    {
                        
                        lberror.Text = objUser.ErrorMsg.ToString();
                        popDiv.Visible = true;
                    }
                    else
                    {
                        lbSuccess.Text = "User Login Creation Successfully Saved." + Environment.NewLine;
                        popDivv.Visible = true;

                    }

                }
                else
                {
                    txtpw.IsValid = true;
                    objUser.UpdateUserLoginDetails(Convert.ToInt32(cbLoginType.Value), txtUserName.Text, txtContactNo.Text, Convert.ToInt32(dxLocation.Value), Convert.ToInt64(Session["EmployeeId"]), DateTime.Today, dxcheck.Checked);

                    if (objUser.IsError == true)
                    {
                        lberror.Text = "Error Occured";
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
                    }
                    else
                    {
                        lbSuccess.Text = "User Login Creation Successfully Updated." + Environment.NewLine;
                        popDivv.Visible = true;

                        InitializeControls();
                        DataBind();

                    }
                }
            }

            catch (Exception ex)
            {
                lberror.Text = ex.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            InitializeControls();
        }

    }
}