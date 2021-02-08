using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HRM.Portal.BLL;
using System.Data;
using System.Drawing;
using HRM.HR.BLL;
using System.Web.Configuration;
using System.IO;



namespace HRM.EmployeePortal
{
    public partial class MyInformation : System.Web.UI.Page
    {

        PortalEmployee objEmployee = new PortalEmployee();
        DataTable dt = new DataTable();
        HRM.Leave.BLL.Leave objLeave = new Leave.BLL.Leave();
        HRM.Leave.BLL.MksLeave objLeave1 = new Leave.BLL.MksLeave();
        Email objEmail = new Email();
        string FileName = string.Empty;
        string ImageFilepath = string.Empty;


        protected void Page_Load(object sender, EventArgs e)
        {
          
            Session["SearchEmployeeId"] = string.Empty;
           
           // hfCompanyId.Value = Session["CompanyId"].ToString();
            if (!IsPostBack)
            {
                getEmployee();
            }

        }

        private void getEmployee()
        {

            hfEmployeeId.Value = Convert.ToString(Session["EmployeeId"]);
           
            dt = objEmployee.GetPortalEmployeeInfo(Convert.ToInt32(hfEmployeeId.Value));

            ViewState["Employee"] = dt;
            lblFullName.Text = Convert.ToString(dt.Rows[0]["FullName"]);
            lblEPFNo.Text = Convert.ToString(dt.Rows[0]["EmployeeCode"]);
            lblFirstName.Text = Convert.ToString(dt.Rows[0]["FullName"]);
            lblEmail.Text = Convert.ToString(dt.Rows[0]["Email"]);
            lblHomTP.Text = Convert.ToString(dt.Rows[0]["HomeContactNo"]);
            lblMobile.Text = Convert.ToString(dt.Rows[0]["MobileNo"]);
            lblAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
            lblDB.Text = (Convert.ToDateTime(dt.Rows[0]["DateOfBirth"])).ToShortDateString();

            lblGender.Text = Convert.ToString(dt.Rows[0]["Gender"]);
            lblMarital.Text = Convert.ToString(dt.Rows[0]["MaritalStatus"]);
            lblNic.Text = Convert.ToString(dt.Rows[0]["NIC"]);
            lblEmaContact.Text = Convert.ToString(dt.Rows[0]["EmergencyContactPerson"]);
            lblEmaContact.Text = Convert.ToString(dt.Rows[0]["EmergencyContactNoMobile"]);
            lblRelation.Text = Convert.ToString(dt.Rows[0]["RelationshipOfContactPerson"]);
            FileName = dt.Rows[0]["Image"].ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }


    }
}