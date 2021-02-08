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
    public partial class CreateLocaton : System.Web.UI.Page
    {
        Lead objLead = new Lead();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null || Session["UserName"].ToString() == "" || Session["LocationId"] == null)
            {
                Response.Redirect("~/SessionTimeout.aspx?DoRedirect=" + System.Web.HttpContext.Current.Request.Url.AbsolutePath);
            }
            popDiv.Visible = false;
            popDivv.Visible = false;


            if (!IsPostBack)
            {

                InitializeControls();

            }
        }

        public void InitializeControls()
        {
            txtLocationCode.Text = string.Empty;
            txtLocationName.Text = string.Empty;
            txtLocationCode.IsValid = true;
            txtLocationName.IsValid = true;

            btnAdd.Text = "Save";

        }

        protected void lkSelect_Click(object sender, EventArgs e)
        {

            try
            {
                var gridView = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).Grid;
                var index = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).VisibleIndex;

                var locationcode = gridView.GetRowValues(index, "LocationCode").ToString();
                var locationname = gridView.GetRowValues(index, "LocationName").ToString();
                bool isActive = Convert.ToBoolean(gridView.GetRowValues(index, "IsActive").ToString());

                hfLocationId.Value = gridView.GetRowValues(index, "LocationId").ToString();

                Session["id"] = hfLocationId.Value;

                txtLocationCode.Text = locationcode.ToString();
                txtLocationName.Text = locationname.ToString();
            
                cbActive.Value = isActive;

                btnAdd.Text = "Update";

                Page.SetFocus(txtLocationCode);

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
                    bool a = IsValid;
                    objLead.AddLocation(txtLocationCode.Text, txtLocationName.Text, cbActive.Checked, Session["UserName"].ToString());
                    if (objLead.IsError == true)
                    {

                        lberror.Text = objLead.ErrorMsg.ToString();
                        popDiv.Visible = true;
                    }
                    else
                    {
                        lbSuccess.Text = " Location Successfully Saved.";
                        popDivv.Visible = true;
                        DataBind();
                        InitializeControls();
                    }
                }
                else
                {
                    objLead.UpdateLocation(Convert.ToInt32(Session["id"].ToString()), txtLocationCode.Text, txtLocationName.Text, cbActive.Checked, Session["UserName"].ToString());

                    if (objLead.IsError == true)
                    {

                        lberror.Text = "Error Occured";
                        popDiv.Visible = true;

                    }
                    else
                    {
                        lbSuccess.Text = " Location Successfully Updated.";
                        popDivv.Visible = true;
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