using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.BL;
using System.Data;
using DevExpress.Web.Rendering;
using DevExpress.Web;
using System.Drawing;
using HRM.EmployeePortal.ESMSWS;

namespace HRM.EmployeePortal
{
    public partial class LeadRegistration : System.Web.UI.Page
    {
        Lead objLead = new Lead();
        User objUser = new User();
       
        DataTable dtLead = new DataTable();
        DataTable dt = new DataTable();
        DataTable dtExCus = new DataTable();
        DataTable dtCus = new DataTable();

        public int namesCounter;
        public int Id;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null)
            {
                Response.Redirect("~/SessionTimeout.aspx?DoRedirect=" + System.Web.HttpContext.Current.Request.Url.AbsolutePath);
            }
            dtLead.Columns.Add("Id", typeof(int));
            dtLead.Columns.Add("ProductId", typeof(int));
            dtLead.Columns.Add("ProductName", typeof(string));
            dtLead.Columns.Add("ProductDescription", typeof(string));
            dtLead.Columns.Add("Quantity", typeof(string));
            dtLead.Columns.Add("Comment", typeof(string));
            dtLead.Columns.Add("LeadDetailId", typeof(int));

            ASPxPopupControl1.ShowOnPageLoad = false;
            popDiv.Visible = false;
            popDivv.Visible = false;
            popDivvv.Visible = false;

          
            if (!IsPostBack)
            {
                SetInitialRow();
                int i = 0;
                ViewState["recordIndex"] = i;
                PopulateForm(i);
                ViewState["Number"] = 0;
                ViewState["table"] = dtLead;
                InitializeControls();
                InitializeControls2();
                DataBind();
                dxcbLeadSource.SelectedIndex = 0;
                txtLocation.Value = Session["LocationId"];
                txtJobType.SelectedIndex = 0;
               
                if (Request.QueryString["LeadNo"] != null)
                {

                    Int32 LeadNo = Convert.ToInt32(Request.QueryString["LeadNo"].ToString());

                    ViewState["LeadNo"] = LeadNo;
                    getLeadDetails(LeadNo);


                }
                else
                {
                   
                    dtStartDate.Value = DateTime.Now;
                   

                }
                 
            }

        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {

            gvCustSearch.DataSource = (DataTable)Session["SearchEmpLeadReg"];
            gvCustSearch.DataBind();
            
        }



        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Column1", typeof(string)));
            dt.Columns.Add(new DataColumn("Column2", typeof(string)));
            dt.Columns.Add(new DataColumn("Column3", typeof(string)));
            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["Column1"] = string.Empty;
            dr["Column2"] = string.Empty;
            dr["Column3"] = string.Empty;
            dt.Rows.Add(dr);
            //dr = dt.NewRow();

            //Store the DataTable in ViewState
            ViewState["CurrentTable"] = dt;

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }




        private void AddNewRowToGrid()
        {
            int rowIndex = 0;

            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        //extract the TextBox values
                        CheckBox box1 = (CheckBox)GridView1.Rows[rowIndex].Cells[1].FindControl("TextBox1");
                        ASPxComboBox box2 = (ASPxComboBox)GridView1.Rows[rowIndex].Cells[2].FindControl("CmbCustomers");
                        TextBox box3 = (TextBox)GridView1.Rows[rowIndex].Cells[3].FindControl("TextBox3");


                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;

                        dtCurrentTable.Rows[i - 1]["Column1"] = box1.Checked;
                        dtCurrentTable.Rows[i - 1]["Column2"] = box2.Text;
                        dtCurrentTable.Rows[i - 1]["Column3"] = box3.Text;

                        rowIndex++;
                    }
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["CurrentTable"] = dtCurrentTable;

                    GridView1.DataSource = dtCurrentTable;
                    GridView1.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }

            //Set Previous Data on Postbacks
            SetPreviousData();
        }
        private void SetPreviousData()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        CheckBox box1 = (CheckBox)GridView1.Rows[rowIndex].Cells[1].FindControl("TextBox1");
                        ASPxComboBox box2 = (ASPxComboBox)GridView1.Rows[rowIndex].Cells[2].FindControl("CmbCustomers");
                        TextBox box3 = (TextBox)GridView1.Rows[rowIndex].Cells[3].FindControl("TextBox3");

                        if(dt.Rows[i]["Column1"].ToString() =="True")
                        box1.Checked =true;
                        else
                            box1.Checked = false;
                        box2.Text = dt.Rows[i]["Column2"].ToString();
                        box3.Text = dt.Rows[i]["Column3"].ToString();

                        rowIndex++;
                    }
                }
            }
        }
        private void getLeadDetails(Int32 LeadNo)
        {
            int location = Convert.ToInt32(txtLocation.Value);
            dt = objLead.getLeadDetailsInfo(Convert.ToInt32(LeadNo), Convert.ToInt32(location));
            if (dt.Rows.Count > 0)
            {

                txtLeadNo.Text = Convert.ToString(dt.Rows[0]["LeadNo"]);
                dxcbLeadSource.Text = Convert.ToString(dt.Rows[0]["LeadSources"]);
                txtContactNo.Text = Convert.ToString(dt.Rows[0]["ContactNo"]);
                txtContactNo2.Text = Convert.ToString(dt.Rows[0]["ContactNo2"]);
                txtName.Text = Convert.ToString(dt.Rows[0]["FirstName"]);
                txtName2.Text = Convert.ToString(dt.Rows[0]["SecondName"]);
                txtAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                cbMR.Text = Convert.ToString(dt.Rows[0]["NameTitle"]);
                txtSpecialInstruction.Text = Convert.ToString(dt.Rows[0]["SpecialInstruction"]);
                txtEmail1.Text = Convert.ToString(dt.Rows[0]["Email1"]);
                txtEmail2.Text = Convert.ToString(dt.Rows[0]["Email2"]);
              
                dtLead = (DataTable)ViewState["table"];
                if (txtContactNo2.Text != string.Empty)
                {
                    CBChange.Visible = true;
                    
                }
                else
                {
                    CBChange.Visible = false;
                }

                if (cbMR.Text == "Com." || cbMR.Text == "Site." || dt.Rows.Count > 1)
                {
                    btnADDCOM.Visible = true;
                    btnNEXTCOM.Visible = true;
                    btnPRVICOM.Visible = true;
                }
                else
                {
                    btnADDCOM.Visible = false;
                    btnNEXTCOM.Visible = false;
                    btnPRVICOM.Visible = false;
                }

                for (int a = 0; a < dt.Rows.Count; a++)
                {
                    namesCounter = Convert.ToInt32(ViewState["Number"]) + 1;
                    ViewState["Number"] = namesCounter;
                    DataRow dtrow = dtLead.NewRow();

                    dtrow[a] = namesCounter;
                    dtrow["Id"] = namesCounter;
                    dtrow["ProductName"] = Convert.ToString(dt.Rows[a]["ProductName"]);
                    dtrow["ProductId"] = Convert.ToString(dt.Rows[a]["ItemId"]);
                    dtrow["ProductDescription"] = Convert.ToString(dt.Rows[a]["ProductDescription"]);
                    dtrow["Quantity"] = Convert.ToString(dt.Rows[a]["Quantity"]);
                    dtrow["Comment"] = Convert.ToString(dt.Rows[a]["Comment"]);
                    dtrow["LeadDetailId"] = Convert.ToString(dt.Rows[a]["LeadDetailId"]);
                    dtStartDate.Value = Convert.ToDateTime(dt.Rows[a]["CreatedDate"]);
                    dtLead.Rows.Add(dtrow);

                }
            }
            ViewState["table"] = dtLead;
          //  gvProductDetails.DataSource = dtLead;
           // gvProductDetails.DataBind();

            btnSave.Text = "Update";
    
        }

        public void InitializeControls()
        {
            txtContactNo.IsValid = true;
            txtContactNo2.Text = string.Empty;
            txtLeadNo.Text = string.Empty;
            dxcbLeadSource.SelectedIndex = 0;
            txtContactNo.Text = string.Empty;
            cbMR.Text = "0";
            txtName.Text = string.Empty;
            txtName2.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtSpecialInstruction.Text = string.Empty;
            InitializeControls2();
            dxcbLeadSource.IsValid = true;
            txtContactNo.IsValid = true;
            txtName.IsValid = true;
            txtContactNo2.IsValid = true;
            dtLead.Clear();
            btnSave.Text = "Save";
            popDiv.Visible = false;
            CBChange.Visible = false;
            txtOwner.SelectedIndex = -1;
            txtLocation.Value = Session["LocationId"];
            txtEmail1.Text = string.Empty;
            txtEmail2.Text = string.Empty;
            txtinquiry.Text = string.Empty;
            txtInquiryComment.Text = string.Empty;
            memoRemark.Text = string.Empty;
            txtOwner.Enabled = true;
            txtJobType.SelectedIndex = 0;
            btnADDCOM.Visible = false;
            btnNEXTCOM.Visible = false;
            btnPRVICOM.Visible = false;
        }

        public void InitializeControls2()
        {           
            dxcbLeadSource.IsValid = true;
            txtContactNo.IsValid = true;
            txtName.IsValid = true;
            txtContactNo2.IsValid = true;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

                    InitializeControls2();
                  
        }

        protected void txtContactNo_TextChanged(object sender, EventArgs e)
        {
            if (CBChange.Checked == false)
            {
                Lead objLead = new Lead();
                dtLead = objLead.GetCustomerDetail(txtContactNo.Text);
                if (dtLead.Rows.Count > 0)
                {
                    txtContactNo.Text = dtLead.Rows[0]["ContactNo"].ToString();
                    txtContactNo2.Text = dtLead.Rows[0]["ContactNo2"].ToString();
                    txtName.Text = dtLead.Rows[0]["FirstName"].ToString();
                    txtName2.Text = dtLead.Rows[0]["SecondName"].ToString();
                    cbMR.Text = dtLead.Rows[0]["NameTitle"].ToString();
                    txtAddress.Text = dtLead.Rows[0]["Address"].ToString();
                    txtEmail1.Text = dtLead.Rows[0]["Email1"].ToString();
                    txtEmail2.Text = dtLead.Rows[0]["Email2"].ToString();
                    Session["CustomerId"] = dtLead.Rows[0]["CustomerId"].ToString(); 
                    if (cbMR.Text == "Com." || cbMR.Text == "Site." || dtLead.Rows.Count > 1)
                    {
                        btnADDCOM.Visible = true;
                        btnNEXTCOM.Visible = true;
                        btnPRVICOM.Visible = true;
                    }
                    else
                    {
                        btnADDCOM.Visible = false;
                        btnNEXTCOM.Visible = false;
                        btnPRVICOM.Visible = false;
                    }
                    if (txtContactNo2.Text != String.Empty)
                    {
                        CBChange.Visible = true;
                    }
                    else
                    {
                        CBChange.Visible = false;
                    }
                }
            }
          
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {         
            try
            {
                if (btnSave.Text == "Save")
                {
                    if (txtContactNo.Text == String.Empty)
                    {
                        lberror.Text = "Customer Contact Number Required"; 
                        popDiv.Visible = true;
                    }
                    else if (txtName.Text == String.Empty)
                    {
                        lberror.Text = "Customer Name Required";
                        popDiv.Visible = true;
                    }
                    else if (txtAddress.Text == String.Empty)
                    {                        
                        lberror.Text = "Customer Address Required";
                        popDiv.Visible = true;
                    }
                    else if (txtinquiry.Text == String.Empty)
                    {
                        lberror.Text = "Inquiry Details Required";
                        popDiv.Visible = true;
                    }
                    else
                    {                       
                            AddLeadCustomer();
                            AddLead();
                           // AddDetails((DataTable)(ViewState["table"]));

                            if (txtOwner.Value != null)
                            {
                                AssignLead();
                                SendSMS();
                            }
                            else
                            {
                                SendSMS1();
                            }
                            if (objLead.IsError == true)
                            {
                                lberror.Text = objLead.ErrorMsg.ToString();
                                popDiv.Visible = true;
                            }

                            else
                            {
                                ASPxPopupControl1.ShowOnPageLoad = true;
                                lbSuccess.Text = " Service Registration Successfully Saved.";
                                popDivv.Visible = true;
                                InitializeControls();
                                ViewState["table"] = "";                                
                            }          
                    }
                }
                else
                {
                    UpdateLeadCustomer();
                    UpdateLead();
                   // UpdateLeadProduct((DataTable)(ViewState["table"]));
                    if (objLead.IsError == true)
                    {
                        lberror.Text = objLead.ErrorMsg.ToString();
                        popDiv.Visible = true;
                    }

                    else
                    {

                        lbSuccess.Text = " Updated Service Details Registration Successfully Saved.";
                        popDivv.Visible = true;
                        InitializeControls();
                    }
                }
                }

          
            catch (Exception ex)
            {
                lberror.Text = ex.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
            }
        }

        private void SendSMS()
        {
            int location = Convert.ToInt32(txtLocation.Value);
            bool Internet = System.Net.NetworkInformation.NetworkInterface.GetIsNetworkAvailable();

            if (Internet == true)
            {
                dtExCus = objUser.GetLeadOwnertosendSMS(Session["LeadNo"].ToString(), Convert.ToInt32(location),Convert.ToInt32(txtOwner.Value.ToString()));

                #region  send msg to exceutive
                if (dtExCus.Rows.Count > 0)
                {
                    string ExecutiveNo = Convert.ToString(dtExCus.Rows[0]["ExecutiveNo"]);
                    string ExecutiveName = Convert.ToString(dtExCus.Rows[0]["Name"]);
                    string LeadNo = Convert.ToString(dtExCus.Rows[0]["LeadNo"]);
                    string CustoomerName = Convert.ToString(dtExCus.Rows[0]["CustomerName"]);
                    string CustoomerNo = Convert.ToString(dtExCus.Rows[0]["ContactNo"]);
                    string InquiryDetails = Convert.ToString(dtExCus.Rows[0]["InquiryDetails"]);
                    string CustoomerAddress = Convert.ToString(dtExCus.Rows[0]["Address"]);
                    string type = Convert.ToString(dtExCus.Rows[0]["type"]);


                    ESMSWS.user user = new ESMSWS.user();
                    ESMSWS.alias alias = new ESMSWS.alias();
                    user.username = "esmsusr_1ouv";
                    user.password = "1kfavt6";
                    alias.alias1 = "ELCARDO";

                    smsMessage msg = new smsMessage();

                    msg.sender = alias;
                    msg.message =   "Dear " + ExecutiveName + ", " + Environment.NewLine + "You have been assigned " + type + " Job No: " + LeadNo +
                                    " & Inquiry about " + InquiryDetails + "." + Environment.NewLine + "Customer: " + CustoomerName + "," + Environment.NewLine +
                                    "Address: " + CustoomerAddress + "." + Environment.NewLine + "Tel : " + CustoomerNo + Environment.NewLine +
                                    "Thank you." + Environment.NewLine + " " + Environment.NewLine + "Elcardo Service Provider.";
                    msg.recipients = new string[] { ExecutiveNo };


                    EnterpriseSMSWSClient client = new EnterpriseSMSWSClient();
                    createGroupResponse dd = new createGroupResponse();
                    dd.ToString();

                    session s = client.createSession(user);
                    client.sendMessages(s, msg);
                    #endregion

                    #region cust sms
                    dtExCus = objUser.GetLeadCustomertosendSMS(Session["LeadNo"].ToString(), Convert.ToInt32(location), Convert.ToInt32(txtOwner.Value.ToString()));
                    if (dtExCus.Rows.Count > 0)
                        {
                            {
                                string CustomerName = Convert.ToString(dtExCus.Rows[0]["CustomerName"]);
                                string CustomerNo = Convert.ToString(dtExCus.Rows[0]["ContactNo"]);
                                string LeadNos = Convert.ToString(dtExCus.Rows[0]["LeadNo"]);
                                string EXName = Convert.ToString(dtExCus.Rows[0]["Name"]);
                                string ExecutiveNu = Convert.ToString(dtExCus.Rows[0]["ExecutiveNo"]);
                                string types = Convert.ToString(dtExCus.Rows[0]["type"]);
                                string InquiryDetail = Convert.ToString(dtExCus.Rows[0]["InquiryDetails"]);
                                msg.sender = alias;
                                msg.message = "Dear Valued Customer, " + Environment.NewLine +
                                              "Thank you for contacting Elcardo. Your " + types + " Job No: " + LeadNos +
                                              " & Inquiry about " + InquiryDetails + " has been assigned to " + EXName + ". " + Environment.NewLine +
                                              "We will get in touch with you soon."
                                              + Environment.NewLine + " " + Environment.NewLine + "Elcardo Your Most Trusted Service Provider.";
                                msg.recipients = new string[] { CustomerNo };
                                client.sendMessages(s, msg);
                            }
                        }
                    #endregion
                }

                lbSuccess.Text = "Assiging Technician Successfully Saved.";
                popDivv.Visible = true;
            }
            else
            {
                lbwarning.Text = "You're not connected to the Network and the Technician message was not sent. Assigning data saved successfully.";
                popDivvv.Visible = true;
            }
        }

        private void SendSMS1()
        {
            int location = Convert.ToInt32(txtLocation.Value);
            bool Internet = System.Net.NetworkInformation.NetworkInterface.GetIsNetworkAvailable();

            if (Internet == true)
            {
                dtCus = objUser.GetLeadCustomerOnlySMS(Session["LeadNo"].ToString(), Convert.ToInt32(location));

                #region  send msg to Customer
                if (dtCus.Rows.Count > 0)
                {
                    string CustomerName = Convert.ToString(dtCus.Rows[0]["CustomerName"]);
                    string CustomerNo = Convert.ToString(dtCus.Rows[0]["ContactNo"]);
                    string LeadNo = Convert.ToString(dtCus.Rows[0]["LeadNo"]);
                    string Type = Convert.ToString(dtCus.Rows[0]["Type"]);
                    string InquiryDetail = Convert.ToString(dtCus.Rows[0]["InquiryDetails"]);

                    ESMSWS.user user = new ESMSWS.user();
                    ESMSWS.alias alias = new ESMSWS.alias();
                    user.username = "esmsusr_1ouv";
                    user.password = "1kfavt6";
                    alias.alias1 = "ELCARDO";

                    smsMessage msg = new smsMessage();

                    msg.sender = alias;
                    msg.message = "Dear Valued Customer, " + Environment.NewLine +
                                  "Thank you for contacting Elcardo. Your " + Type + " Job No: " + LeadNo +
                                  " & Inquiry about " + InquiryDetail + " on process." + Environment.NewLine +
                                  "We will get in touch with you soon."
                                  + Environment.NewLine + " " + Environment.NewLine + "Elcardo Your Most Trusted Service Provider.";
                    msg.recipients = new string[] { CustomerNo };

                    EnterpriseSMSWSClient client = new EnterpriseSMSWSClient();
                    createGroupResponse dd = new createGroupResponse();
                    dd.ToString();

                    session s = client.createSession(user);
                    client.sendMessages(s, msg);
                }

                #endregion

                lbSuccess.Text = "Job Successfully Saved.";
                popDivv.Visible = true;
            }
            else
            {
                lbwarning.Text = "You're not connected to the Network and the Customer message was not sent. Job data saved successfully.";
                popDivvv.Visible = true;
            }
        }
        
        //private void AddDetails(DataTable  tbl)
        //{
        //    try
        //    {

        //        objLead.AddDetails(Session["LeadNo"].ToString(), tbl, Session["UserName"].ToString(), Convert.ToInt32(Session["LocationId"].ToString()));

        //        long CustomerId = Convert.ToInt64(objLead.CustomerId);

        //        Session["CustomerId"] = CustomerId;
        //    }
        //    catch (Exception ex)
        //    {
        //        lberror.Text = ex.ToString();
        //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
        //    }
        //}

        //private void UpdateLeadProduct(DataTable tbl)
        //{
        //    try
        //    {
        //        objLead.UpdateLeadProduct(txtLeadNo.Text, tbl, Session["UserName"].ToString(), Convert.ToInt32(Session["LocationId"].ToString()));

        //        long CustomerId = Convert.ToInt64(objLead.CustomerId);

        //        Session["CustomerId"] = CustomerId;
        //    }
        //    catch (Exception ex)
        //    {
        //        lberror.Text = ex.ToString();
        //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
        //    }
        //}

        private void AddLeadCustomer()
        {
            try
            {
                if (cbMR.Text == "Com." || cbMR.Text == "Site.")
                {
                    objLead.AddLeadCustomerCOM(txtContactNo.Text, txtContactNo2.Text, txtName.Text, txtName2.Text, cbMR.Text.Trim(), txtEmail1.Text, txtEmail2.Text, txtAddress.Text, txtSpecialInstruction.Text, Session["UserName"].ToString());

                    long CustomerId = Convert.ToInt64(objLead.CustomerId);

                    Session["CustomerId"] = CustomerId;
                }
                else
                {
                    objLead.AddLeadCustomer(txtContactNo.Text, txtContactNo2.Text, txtName.Text, txtName2.Text, cbMR.Text.Trim(), txtEmail1.Text, txtEmail2.Text, txtAddress.Text, txtSpecialInstruction.Text, Session["UserName"].ToString());

                    long CustomerId = Convert.ToInt64(objLead.CustomerId);

                    Session["CustomerId"] = CustomerId;
                }
            }
            catch (Exception ex)
            {
                lberror.Text = ex.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
            }
        }

        private void UpdateLeadCustomer()
        {
            try
            {
                objLead.UpdateLeadCustomer(txtLeadNo.Text, txtContactNo.Text, txtContactNo2.Text, txtName.Text, txtName2.Text, cbMR.Text.Trim(), txtEmail1.Text, txtEmail2.Text, txtAddress.Text, Session["UserName"].ToString());

                long CustomerId = Convert.ToInt64(objLead.CustomerId);

                Session["CustomerId"] = CustomerId;
            }
            catch (Exception ex)
            {
                lberror.Text = ex.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
            }
        }

        private void UpdateLead()
        {
            try
            {
               
                //DataTable isquation = objLead.getQuationLead(Convert.ToInt32( txtLeadNo.Text));           
                //if(isquation.Rows.Count >0)
                //{                 
                //    objLead.UpdateLeadfalse(txtLeadNo.Text, Convert.ToInt64(Session["CustomerId"].ToString()), dxcbLeadSource.Text.Trim(), txtSpecialInstruction.Text, Convert.ToDateTime(dtStartDate.Value), cbQuotation.Checked, Session["UserName"].ToString());
                //}

                //if (cbQuotation.Checked == false && isquation.Rows.Count==0)
                //{
                    objLead.UpdateLead(txtLeadNo.Text, Convert.ToInt64(Session["CustomerId"].ToString()), dxcbLeadSource.Text.Trim(), txtSpecialInstruction.Text, Convert.ToDateTime(dtStartDate.Value),  Session["UserName"].ToString());
                
            }
            catch (Exception ex)
            {
                lberror.Text = ex.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
            }
        }

        private void AddLead()
        {
            try
            {
                int location = Convert.ToInt32(txtLocation.Value);
                dtLead = objLead.GetLeadCode(location);
                string CRMLocationLeadNo = dtLead.Rows[0]["CRMLeadLocationID"].ToString();
                string CRMLeadID = dtLead.Rows[0]["CRMLeadID"].ToString();


                   Label5.InnerText = CRMLocationLeadNo;
                   Session["LeadNo"] = CRMLeadID;
                   objLead.AddLead(CRMLeadID, CRMLocationLeadNo,Session["LocationId"].ToString(), Convert.ToInt64(Session["CustomerId"].ToString()), dxcbLeadSource.Text.Trim(), txtinquiry.Text,
                        txtInquiryComment.Text, memoRemark.Text, Convert.ToDateTime(dtStartDate.Value), false, Convert.ToInt32(location), 
                        txtJobType.Value.ToString(), Session["UserName"].ToString());
                    Session["LeadIdForAssign"] = Convert.ToInt32(objLead.LeadId);
                    
               
            }
            catch (Exception ex)
            {
                lberror.Text = ex.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
            }
        }

        private void AssignLead() {
            try
            {
                int location = Convert.ToInt32(txtLocation.Value);
                objUser.AssingLeads(Session["LeadNo"].ToString(), Convert.ToInt32(Session["LeadIdForAssign"]), Convert.ToInt64(Session["CustomerId"].ToString()),
                    Convert.ToInt32(txtOwner.Value), "", Convert.ToDateTime(dtStartDate.Value.ToString()), "1", "2", true, Session["UserName"].ToString(), Convert.ToInt32(location), 0, 0,false);
                            
         
            }
            catch (Exception ex)
            {
                lberror.Text = ex.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
            }
            
        }

        protected void btnClear1_Click(object sender, EventArgs e)
        {
            InitializeControls();
            ViewState["table"] = "";
         
            Response.Redirect("ServiceRegistration.aspx");
           
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            confirmpopup.ShowOnPageLoad = true;

               ASPxButton btn = (ASPxButton)sender;
                GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
                object[] values = (object[])container.Grid.GetRowValues(container.VisibleIndex, new string[] { "Id", "ProductName", "Quantity", "ProductDescription", "Comment" });



                Session["id"] = values[0].ToString();
                txtContactNo2.IsValid = true;
        }

        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            int LeadDetailId = 0;
            int location = Convert.ToInt32(txtLocation.Value);

                for (int i = ((DataTable)ViewState["table"]).Rows.Count - 1; i >= 0; i--)
                {
                    string Id = Session["id"].ToString();
                    DataRow dr = ((DataTable)ViewState["table"]).Rows[i];

                    if(dr["LeadDetailId"].ToString().Length>0)
                     LeadDetailId = Convert.ToInt32(dr["LeadDetailId"].ToString());

                    if (Id != "")
                    {
                        if (dr["id"].ToString() == Session["id"].ToString())
                            dr.Delete();

                        ((DataTable)ViewState["table"]).AcceptChanges();

                        dtLead = (DataTable)ViewState["table"];
                        objLead.DeleteLeadProduct(LeadDetailId, txtLeadNo.Text, Convert.ToInt32(location));

                        ViewState["table"] = dtLead;
                     
                       
                    }
                    confirmpopup.ShowOnPageLoad = false;
                }
                Session["id"] = string.Empty;
               

        }

        protected void btnDeleteNo_Click(object sender, EventArgs e)
        {
            confirmpopup.ShowOnPageLoad = false;
        }

        //protected void txtContactNo2_Validation(object sender, ValidationEventArgs e)
        //{ 
        //    e.IsValid = true;
        //}

        protected void btnOk_Click1(object sender, EventArgs e)
        {
            ASPxPopupControl1.ShowOnPageLoad = false;
            dxcbLeadSource.Value = "1";
        }

        protected void PopulateForm(int i)
        {
            if (i != 0)
            {

                ViewState["recordIndex"] = i;
                System.Data.DataRow row = dtLead.Rows[0].Table.Rows[i];
                txtContactNo.Text = row["ContactNo"].ToString();
                txtContactNo2.Text = row["ContactNo2"].ToString();
                txtName.Text = row["FirstName"].ToString();
                txtName2.Text = row["SecondName"].ToString();
                cbMR.Text = row["NameTitle"].ToString();
                txtAddress.Text = row["Address"].ToString();
               // txtSpecialInstruction.Text = row["Remark"].ToString();
            }
            else
            {

            }
 
       }
                
        protected void CBChange_CheckedChanged(object sender, EventArgs e)
        {
            if (CBChange.Checked == false)
            {
               string Contact1 = txtContactNo.Text;
               string Contact2 = txtContactNo2.Text;
               txtContactNo.Text = Contact2;
               txtContactNo2.Text = Contact1;
            }
            else
            {
                string Contact1 = txtContactNo.Text;
                string Contact2 = txtContactNo2.Text;
                txtContactNo.Text = Contact2;
                txtContactNo2.Text = Contact1;
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                int location = Convert.ToInt32(txtLocation.Value);
                DataTable dt = objUser.GetCustomersForSearch(Convert.ToInt32(location));
                Session["SearchEmpLeadReg"] = dt;
                gvCustSearch.DataSource = dt;
                gvCustSearch.DataBind();
                ScriptManager.RegisterStartupScript(this, GetType(), "show()", "show();", true);
            }
            catch (Exception ex)
            {

            }
        }

        protected void lkSelect_Click(object sender, EventArgs e)
        {
            var gridView = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).Grid;
            var index = ((GridViewTableDataRow)(((LinkButton)sender).Parent.Parent.Parent.Parent)).VisibleIndex;


            var phoneNU = gridView.GetRowValues(index, "ContactNo").ToString();
            var phoneNU2 = gridView.GetRowValues(index, "ContactNo2").ToString();
            var name = gridView.GetRowValues(index, "FirstName").ToString();
            var name2 = gridView.GetRowValues(index, "SecondName").ToString();
            var Address = gridView.GetRowValues(index, "Address").ToString();
            var Remark = gridView.GetRowValues(index, "Remark").ToString();
            var Email1 = gridView.GetRowValues(index, "Email1").ToString();
            var Email2 = gridView.GetRowValues(index, "Email2").ToString();
            var NameTitle = gridView.GetRowValues(index, "NameTitle").ToString();

            hfCustomerId.Value = gridView.GetRowValues(index, "CusID").ToString();
            Session["CustomerId"] = hfCustomerId.Value;


            txtContactNo.Text = phoneNU.ToString();
            txtContactNo2.Text = phoneNU2.ToString();
            txtName.Text = name.ToString();
            txtName2.Text = name2.ToString();
            txtAddress.Text = Address.ToString();
            txtSpecialInstruction.Text = Remark.ToString();
            txtEmail1.Text = Email1.ToString();
            txtEmail2.Text = Email2.ToString();
            cbMR.Value = NameTitle.ToString();

            if (txtContactNo2.Text != string.Empty)
            {
                CBChange.Visible = true;

            }
            else
            {
                CBChange.Visible = false;
            }

            if (cbMR.Text == "Com." || cbMR.Text == "Site." || dtLead.Rows.Count > 1)
            {
                btnADDCOM.Visible = true;
                btnNEXTCOM.Visible = true;
                btnPRVICOM.Visible = true;
            }
            else
            {
                btnADDCOM.Visible = false;
                btnNEXTCOM.Visible = false;
                btnPRVICOM.Visible = false;
            }
        }

        protected void lkSearchLeads_Click(object sender, EventArgs e)
        {
            
            GetLead();
            ScriptManager.RegisterStartupScript(this, GetType(), "show()", "show();", true);
        }

        private void GetLead()
        {
            try
            {
                int location = Convert.ToInt32(txtLocation.Value);
                DataTable dt = objUser.GetCustomersForSearch(Convert.ToInt32(location));
                Session["SearchEmpLeadReg"] = dt;
                gvCustSearch.DataSource = dt;
                gvCustSearch.DataBind();
                ScriptManager.RegisterStartupScript(this, GetType(), "show()", "show();", true);

            }
            catch (Exception ex)
            {

            }
        }

        protected void txtOwner_TextChanged(object sender, EventArgs e)
        {
            //Remarks.Enabled = true;
        }

        protected void gvProductDetails_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Caption == "Select")
            {
                if (Request.QueryString["LeadNo"] != null)
                {
                    e.Cell.Enabled = false;
                }
            }
        }

        protected void txtLocation_TextChanged(object sender, EventArgs e)
        {
            if (txtLocation.Value.ToString() == Session["LocationId"].ToString())
            {
                txtOwner.Enabled = true;
            }
            else
            {
                txtOwner.SelectedIndex = -1;
                txtOwner.Enabled = false;
               

            }
        }

        protected void btnPRVICOM_Click(object sender, EventArgs e)
        {
            Lead objLead = new Lead();
            dtLead = objLead.GetCustomerDetail(txtContactNo.Text);
            int i = (int)ViewState["recordIndex"];
            i = i - 1;

            if (i >= 0)
            {

                ViewState["recordIndex"] = i;
                System.Data.DataRow row = dtLead.Rows[0].Table.Rows[i];
                txtContactNo.Text = row["ContactNo"].ToString();
                txtContactNo2.Text = row["ContactNo2"].ToString();
                txtName.Text = row["FirstName"].ToString();
                txtName2.Text = row["SecondName"].ToString();
                cbMR.Text = row["NameTitle"].ToString();
                txtAddress.Text = row["Address"].ToString();
            }
        }

        protected void btnNEXTCOM_Click(object sender, EventArgs e)
        {
            Lead objLead = new Lead();
            dtLead = objLead.GetCustomerDetail(txtContactNo.Text);

            int i = (int)ViewState["recordIndex"];
            i = i >= dtLead.Rows[0].Table.Rows.Count - 1 ? 0 : i + 1;
            PopulateForm(i);
        }

        protected void btnADDCOM_Click(object sender, EventArgs e)
        {
            txtName.Text = string.Empty;
            txtContactNo2.Text = string.Empty;
            txtName2.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtSpecialInstruction.Text = string.Empty;
            txtEmail1.Text = string.Empty;
        }

        protected void btnUpdateCust_Click(object sender, EventArgs e)
        {
            try
            {
                objLead.UpdateCustomer(Session["CustomerId"].ToString(), txtContactNo.Text, txtContactNo2.Text, txtName.Text, txtName2.Text, cbMR.Text.Trim(), txtEmail1.Text, txtEmail2.Text, txtAddress.Text, Session["UserName"].ToString());
                lbSuccess.Text = "Customer details Updated Successfully.";
                popDivv.Visible = true;
            }
            catch (Exception ex)
            {
                lberror.Text = ex.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Error();", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }

        protected void GSave_Click(object sender, EventArgs e)
        {
          
           
             try
            {
                
                for (int i=0; i < ((DataTable)ViewState["CurrentTable"]).Rows.Count; i++)
                {
                    DataTable dt1 = new DataTable();
                    dt1 = ((DataTable)ViewState["CurrentTable"]);

                    bool Column1 = Convert.ToBoolean(dt1.Rows[i]["Column1"]);
                    string Column2 = dt1.Rows[i]["Column2"].ToString();
                    string Column3 = dt1.Rows[i]["Column3"].ToString();
                    objUser.creategrid(Column1, Column2, Column3);
                    
                    //objLead.AddGrid(TextBox1.Text, Convert.ToInt32(location));

                    //    ViewState["table"] = dtLead;
                    //if (dr["LeadDetailId"].ToString().Length > 0)
                    //    LeadDetailId = Convert.ToInt32(dr["LeadDetailId"].ToString());

                    //if (Id != "")
                    //{
                    //    if (dr["id"].ToString() == Session["id"].ToString())
                    //        dr.Delete();

                    //    ((DataTable)ViewState["table"]).AcceptChanges();

                    //    dtLead = (DataTable)ViewState["table"];
                    //    objLead.DeleteLeadProduct(LeadDetailId, txtLeadNo.Text, Convert.ToInt32(location));

                    //    ViewState["table"] = dtLead;


                    //}
                    //confirmpopup.ShowOnPageLoad = false;
                }
            }
            catch
            {
            }
        }

        }
    }
