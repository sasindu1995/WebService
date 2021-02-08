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
    public partial class ExecutiveDetails : System.Web.UI.Page
    {
        Lead objLead = new Lead();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null)
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
            txtEPFNo.Text = string.Empty;
            txtName.Text = string.Empty;
            txtContactNo.Text = string.Empty;
            txtLocation.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtEPFNo.IsValid = true;
            txtName.IsValid = true;
            txtContactNo.IsValid = true;
            txtLocation.IsValid = true;
            txtEmail.IsValid = true;
            btnAdd.Text = "Save";
          
        }

        protected void lkSelect_Click(object sender, EventArgs e)
        {

            try
            {
                var gridView = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).Grid;
                var index = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).VisibleIndex;

                var epfno = gridView.GetRowValues(index, "EPFNo").ToString();
                var name = gridView.GetRowValues(index, "Name").ToString();
                var contactno = gridView.GetRowValues(index, "ContactNo").ToString();
                var location = gridView.GetRowValues(index, "LocationName").ToString();
                var email = gridView.GetRowValues(index, "Email").ToString();
                var active = gridView.GetRowValues(index, "Active").ToString();

                hfExecutiveId.Value = gridView.GetRowValues(index, "ExecutiveId").ToString();

                Session["id"] = hfExecutiveId.Value;

                txtEPFNo.Text = epfno.ToString();
                txtName.Text = name.ToString();
                txtContactNo.Text = contactno.ToString();
                txtLocation.Text = location.ToString();
                txtEmail.Text = email.ToString();
                cbActive.Checked = Convert.ToBoolean(active);
                btnAdd.Text = "Update";

                Page.SetFocus(txtEPFNo);


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
                    objLead.AddExecutive(txtEPFNo.Text, txtName.Text, txtContactNo.Text, "", Convert.ToInt32(txtLocation.Value), txtEmail.Text, cbActive.Checked);
                    if (objLead.IsError == true)
                    {

                        lberror.Text = objLead.ErrorMsg.ToString();
                        popDiv.Visible = true;
                    }
                    else
                    {
                        lbSuccess.Text = " Executive Details Successfully Saved.";
                        popDivv.Visible = true;
                        DataBind();
                        InitializeControls();
                    }
                }
                else
                {
                    objLead.UpdateExecutive(Convert.ToInt32(Session["id"].ToString()), txtEPFNo.Text, txtName.Text, txtContactNo.Text, "", Convert.ToInt32(txtLocation.Value), txtEmail.Text, cbActive.Checked);

                    if (objLead.IsError == true)
                    {

                        lberror.Text = "Error Occured";
                        popDiv.Visible = true;

                    }
                    else
                    {
                        lbSuccess.Text = " Executive Details Successfully Updated.";
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

        //protected void gvExecutive_SearchPanelEditorInitialize(object sender, DevExpress.Web.ASPxGridViewSearchPanelEditorEventArgs e)
        //{
        //    if (gvExecutive.SearchPanelFilter != null && gvExecutive.SearchPanelFilter.Length > 0 && gvExecutive.SearchPanelFilter[0] != '"')
        //        gvExecutive.SearchPanelFilter = "\"" + e.Value.ToString().Trim() + "\"";
        //}

        
    }
}