using Common.BL;
using DevExpress.LookAndFeel;
using DevExpress.XtraPrinting.Preview;
using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRM.EmployeePortal
{
    public partial class AssignJobReport : System.Web.UI.Page
    {
        AssignJobsReport AssignJobsReport = new AssignJobsReport();
        User objUser = new User();
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    popDiv.Visible = false;
        //    popDivv.Visible = false;
        //    popDivvv.Visible = false;

        //    if (Session["UserName"] == null || Session["UserName"].ToString() == "" || Session["LocationId"] == null)
        //    {
        //        Response.Redirect("~/SessionTimeout.aspx?DoRedirect=" + System.Web.HttpContext.Current.Request.Url.AbsolutePath);
        //    }
        //    if (!IsPostBack)
        //    {
        //        dxFromDate.Value = DateTime.Now;
        //        dxToDate.Value = DateTime.Now;       
        //    }
        //    DataTable tbGetLocation = objUser.CheckMultipleLocation(Convert.ToInt32(Session["UserType"]));
        //    if (tbGetLocation.Rows.Count > 0)
        //    {
        //        bool isAllowMultiple = Convert.ToBoolean(tbGetLocation.Rows[0]["IsMultipleLocation"].ToString());
        //        if (isAllowMultiple)
        //        {
        //            fillLocation();

        //        }
        //        else
        //        {
        //            fillJobs(Convert.ToInt32(Session["LocationId"].ToString()));
        //            Label6.Visible = false;
        //            dxdDCompany.Visible = false;
        //        }

        //    }
        //    if (dxdDCompany.Visible == true && dxdDCompany.SelectedIndex >=0)
        //    {
        //        fillJobs(Convert.ToInt32( dxdDCompany.Value));
        //    }
        //}
        //public void fillLocation()
        //{
        //    DataTable User = objUser.GetUserLoginLocation(Session["UserName"].ToString());
        //    dxdDCompany.DataSource = User;
        //    dxdDCompany.TextField = "LocationName";
        //    dxdDCompany.ValueField = "LocationId";
        //    dxdDCompany.DataBind();
        //}
        //public void fillJobs(int locatonID)
        //{

        //    var pages = objUser.GetLocationAssignJobs(locatonID);
        //    ddlJobNo.DataSource = pages;
        //    ddlJobNo.TextField = "LocationCode";
        //    ddlJobNo.ValueField = "LeadName";
        //    ddlJobNo.DataBind();
        //}

        //public void fillExcecutive(int locatonID)
        //{
        //    ddlQuotation.DataSource = null;
        //    var pages = objUser.GetLocationExcecutive(locatonID);
        //    ddlQuotation.DataSource = pages;
        //    ddlQuotation.TextField = "Name";
        //    ddlQuotation.ValueField = "ExecutiveId";
        //    ddlQuotation.DataBind();
        //}
        protected void ASPxDocumentViewer1_Load(object sender, EventArgs e)
        {
            AssignJobsReport AssignJobsReport = new AssignJobsReport();
            
                int ReportNum = Convert.ToInt32(cbReport.Value);
                if (ReportNum == 1)
                {
                    if (cbReport.Value != null)
                    {
                        string user = "0";
                        if (ddlUser.SelectedIndex != -1)
                            user = ddlUser.Value.ToString();

                        DateTime fmDate = Convert.ToDateTime(dxFromDate.Value);
                        DateTime toDate = Convert.ToDateTime(dxToDate.Value);
                        if (dxdDCompany.Visible)
                            AssignJobsReport.Parameters["LocationId"].Value = dxdDCompany.Value.ToString();
                        else
                            AssignJobsReport.Parameters["LocationId"].Value = Session["LocationId"].ToString();
                        AssignJobsReport.Parameters["FromDate"].Value = fmDate;
                        AssignJobsReport.Parameters["ToDate"].Value = toDate;
                        AssignJobsReport.Parameters["TechnicianId"].Value = Convert.ToInt32(ddlQuotation.Value);
                        AssignJobsReport.Parameters["user"].Value = user;
                        AssignJobsReport.Parameters["CustomerId"].Value = Convert.ToInt32(ddlCustomer.Value);
                        AssignJobsReport.Parameters["Status"].Value = Convert.ToInt32(ddlStatus.Value);
                        AssignJobsReport.Parameters["JobNo"].Value = Convert.ToInt32(ddlJobNo.Value);
                        AssignJobsReport.Parameters["ContactNo"].Value = Convert.ToInt32(ddlCustomerNo.Value);
                        ASPxDocumentViewer1.Report = AssignJobsReport;
                        ASPxDocumentViewer1.DataBind();
                    }
                }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ddlCustomer.Text = string.Empty;
            ddlCustomerNo.Text = string.Empty;
            ddlJobNo.Text = string.Empty;
            ddlStatus.Text = string.Empty;
            ddlUser.Text = string.Empty;
            ddlQuotation.Text = string.Empty;
            dxFromDate.Value = DateTime.Now;
            dxToDate.Value = DateTime.Now;
        }

        protected void cbReport_TextChanged(object sender, EventArgs e)
        {
            btnView.Enabled = true;
            btnClear.Enabled = true;
            btnReset.Enabled = true;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlCustomer.Text = string.Empty;
            ddlCustomerNo.Text = string.Empty;
            ddlJobNo.Text = string.Empty;
            ddlStatus.Text = string.Empty;
            ddlUser.Text = string.Empty;
            ddlQuotation.Text = string.Empty;
            cbReport.Text = string.Empty;
            dxFromDate.Value = DateTime.Now;
            dxToDate.Value = DateTime.Now;
            btnView.Enabled = false;
            btnClear.Enabled = false;
            btnReset.Enabled = false;

        }

        //protected void dxdDCompany_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ddlQuotation.SelectedIndex = -1;
        //    ddlJobNo.SelectedIndex = -1;
        //    fillJobs(Convert.ToInt32(dxdDCompany.Value));
        //    fillExcecutive(Convert.ToInt32(dxdDCompany.Value));
        //}
    }
}