using DevExpress.Web.Rendering;
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
    public partial class ProductCart : System.Web.UI.Page
    {
        Lead objLead = new Lead();

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

                InitializeControls();

            }

        }


        public void InitializeControls()
        {
            txtItemCode.Text = string.Empty;
            txtItemName.Text = string.Empty;
            txtItemCode.IsValid = true;
            txtItemName.IsValid = true;
            txtItemDescription.Text = string.Empty;
            txtItemPrice.Text = string.Empty;

            btnAdd.Text = "Save";

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {

                if (btnAdd.Text == "Save")
                {
                    bool a = IsValid;
                    objLead.AddProduct(txtItemCode.Text, txtItemName.Text, txtItemPrice.Text, txtItemDescription.Text," ", cbActive.Checked);
                    if (objLead.IsError == true)
                    {

                        lberror.Text = objLead.ErrorMsg.ToString();
                        popDiv.Visible = true;
                    }
                    else
                    {
                        lbSuccess.Text = " Product Successfully Saved.";
                        popDivv.Visible = true;
                        DataBind();
                        InitializeControls();
                    }
                }
                else
                {
                    objLead.UpdateProduct(Convert.ToInt32(Session["id"].ToString()), txtItemCode.Text, txtItemName.Text, txtItemPrice.Text, txtItemDescription.Text, " ", cbActive.Checked);
                    if (objLead.IsError == true)
                    {

                        lberror.Text = objLead.ErrorMsg.ToString();
                        popDiv.Visible = true;

                    }
                    else
                    {
                        lbSuccess.Text = " Product Successfully Updated.";
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

        protected void lkSelect_Click(object sender, EventArgs e)
        {

            try
            {
                var gridView = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).Grid;
                var index = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).VisibleIndex;

                var processCode = gridView.GetRowValues(index, "Code").ToString();
                var activityDes = gridView.GetRowValues(index, "Name").ToString();
                var price = gridView.GetRowValues(index, "Price").ToString();
                var type = gridView.GetRowValues(index, "Description").ToString();
                var description = gridView.GetRowValues(index, "Remarks").ToString();
                bool isActive = Convert.ToBoolean(gridView.GetRowValues(index, "Active").ToString());

                hfitemId.Value = gridView.GetRowValues(index, "ItemId").ToString();

                Session["id"] = hfitemId.Value;

                txtItemCode.Text = processCode.ToString();
                txtItemName.Text = activityDes.ToString();
                txtItemPrice.Text = price.ToString();
                txtItemDescription.Text = type.ToString();
               // txtDescriptio.Text = description.ToString();
                cbActive.Value = isActive;

                btnAdd.Text = "Update";

                Page.SetFocus(txtItemCode);

            }
            catch
            {
            }
            
        }

        //protected void gvItem_SearchPanelEditorInitialize(object sender, DevExpress.Web.ASPxGridViewSearchPanelEditorEventArgs e)
        //{
        //    if (gvItem.SearchPanelFilter != null && gvItem.SearchPanelFilter.Length > 0 && gvItem.SearchPanelFilter[0] != '"')
        //        gvItem.SearchPanelFilter = "\"" + e.Value.ToString().Trim() + "\"";
        //}
    }
}