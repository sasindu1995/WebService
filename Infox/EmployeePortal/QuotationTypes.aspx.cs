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
    public partial class QuotationTypes : System.Web.UI.Page
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
            txtQuotationCode.Text = string.Empty;
            txtQuotationTypeName.Text = string.Empty;
            txtQuotationCode.IsValid = true;
            txtQuotationTypeName.IsValid = true;

            btnAdd.Text = "Save";

        }

        protected void lkSelect_Click(object sender, EventArgs e)
        {
            try
            {
                var gridView = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).Grid;
                var index = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).VisibleIndex;

                var quotationcode = gridView.GetRowValues(index, "QuotationCode").ToString();
                var quotationtypename = gridView.GetRowValues(index, "QuotationTypeName").ToString();
                bool isActive = Convert.ToBoolean(gridView.GetRowValues(index, "IsActive").ToString());

                hfQuotationId.Value = gridView.GetRowValues(index, "QuotationId").ToString();

                Session["id"] = hfQuotationId.Value;

                txtQuotationCode.Text = quotationcode.ToString();
                txtQuotationTypeName.Text = quotationtypename.ToString();

                cbActive.Value = isActive;

                btnAdd.Text = "Update";

                Page.SetFocus(txtQuotationCode);

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
                    objLead.AddQuotationTypes(txtQuotationCode.Text, txtQuotationTypeName.Text, cbActive.Checked, Session["UserName"].ToString());
                    if (objLead.IsError == true)
                    {

                        lberror.Text = objLead.ErrorMsg.ToString();
                        popDiv.Visible = true;
                    }
                    else
                    {
                        lbSuccess.Text = " Quotation Type Successfully Saved.";
                        popDivv.Visible = true;
                        DataBind();
                        InitializeControls();
                    }
                }
                else
                {
                    objLead.UpdateQuotationtypes(Convert.ToInt32(Session["id"].ToString()), txtQuotationCode.Text, txtQuotationTypeName.Text, cbActive.Checked, Session["UserName"].ToString());

                    if (objLead.IsError == true)
                    {

                        lberror.Text = "Error Occured";
                        popDiv.Visible = true;

                    }
                    else
                    {
                        lbSuccess.Text = "  Quotation Type Successfully Updated.";
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