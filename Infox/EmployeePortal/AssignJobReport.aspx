<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignJobReport.aspx.cs" Inherits="HRM.EmployeePortal.AssignJobReport" MasterPageFile="~/Portal.Master" %>

<%@ Register Assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function init(s) {
            var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
            var createFrameElement = s.printHelper.createFrameElement;

            s.printHelper.createFrameElement = function (name) {
                var frameElement = createFrameElement.call(this, name);
                if (isChrome) {
                    frameElement.addEventListener("load", function (e) {
                        if (frameElement.contentDocument.contentType !== "text/html")
                            frameElement.contentWindow.print();
                    });
                }
                return frameElement;
            }
        }
    </script>
    <style type="text/css">
        .style1 {
            width: 100px;
        }

        .style3 {
            width: 173px;
        }

        .style4 {
            width: 74px;
        }

        .style5 {
            width: 66px;
        }

        .style6 {
            width: 66px;
            height: 26px;
        }

        .style7 {
            height: 26px;
        }

        .auto-style1 {
            Width: 100%;
            height: 30px;
            font-family: Verdana;
            text-align: left;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <section class="content-header">
            <h1>Assigned Job Details Report
           <%-- <small>Advanced form element</small>--%>
            </h1>
        </section>

        <section class="content">
        <div class='row'>
            <div class='col-md-12'>
                <div class="alert alert-danger slide in" id="popDiv" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong><i class="icon fa fa-ban"></i>Alert! </strong>
                    <asp:Label ID="lberror" runat="server"></asp:Label>


                </div>
                <div class="alert alert-success alert-dismissable" id="popDivv" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong><i class="icon fa fa-check"></i>Alert! </strong>
                    <asp:Label ID="lbSuccess" runat="server"></asp:Label>
                </div>

                <div class="alert alert-warning" id="popDivvv" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong><i class="icon fa fa-check"></i>Alert! </strong>
                    <asp:Label ID="lbwarning" runat="server"></asp:Label>
                </div>
            </div>
        </div>
            <div class="box box-default">
                <div class="box-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                             <div class='row' style="margin-bottom: 10px">
                        <div class="col-md-12">
                             <div class="col-md-2">
                                <asp:Label ID="Label3" runat="server" class="auto-style1" Text="Location" />
                            </div>
                            <div class="col-md-2">
                             <dx:ASPxComboBox ID="dxdDCompany" CssClass="companyCmb" AutoPostBack="true" runat="server"  DropDownStyle="DropDownList" OnSelectedIndexChanged="dxdDCompany_SelectedIndexChanged"
                                ValueField="LocationId" Theme="Default" TextFormatString="{0}" NullText="Please Select Location">
                                <Columns>
                                    <dx:ListBoxColumn FieldName="LocationName" Width="100px" />
                                </Columns>
                            </dx:ASPxComboBox>
                            </div>
                            </div>
                                 </div>

                            <div class='row' style="margin-bottom: 5px">
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                        <asp:Label ID="Label2" runat="server" class="auto-style1" Text="Job No" />
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxComboBox ID="ddlJobNo" runat="server" Width="100%"  BackColor="#F5F5F5" Height="25px"
                                            TextField="LocationCode" ValueField="LeadName" Skin="Windows7" NullText=" Search by Job No ">
                                        </dx:ASPxComboBox>
                                    </div>
                                
                                    <div class="col-md-2">
                                        <asp:Label ID="Label7" runat="server" class="auto-style1" Text="Customer's Contact" />
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxComboBox ID="ddlCustomerNo" runat="server" Width="100%" DataSourceID="sqldsCustomerNo" BackColor="#F5F5F5" Height="25px"
                                            TextField="ContactNo" ValueField="ContactNo" Skin="Windows7" NullText=" Search by Customer No ">
                                        </dx:ASPxComboBox>
                                    </div>
                                    <asp:SqlDataSource ID="sqldsCustomerNo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand=" Select Distinct(ContactNo) as ContactNo From   CRM_AssignLeade Inner Join
                                        CRM_Customer On CRM_Customer.CustomerId=CRM_AssignLeade.CustomerId">
                                        <SelectParameters>
                                            <%--<asp:SessionParameter Name="LocationId" SessionField="LocationId" Type="Int32" />--%>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div class="col-md-2">
                                        <asp:Label ID="Label8" runat="server" class="auto-style1" Text="Customer's Name" />
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxComboBox ID="ddlCustomer" runat="server" Width="100%" DataSourceID="sqldsCustomer" BackColor="#F5F5F5" Height="25px"
                                            TextField="FirstName" ValueField="FirstName" Skin="Windows7" NullText=" Search by Customer ">
                                        </dx:ASPxComboBox>
                                    </div>
                                    <asp:SqlDataSource ID="sqldsCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand=" Select Distinct(FirstName) as FirstName From   CRM_AssignLeade Inner Join
                                        CRM_Customer On CRM_Customer.CustomerId=CRM_AssignLeade.CustomerId">
                                        <SelectParameters>
                                            <%-- <asp:SessionParameter Name="LocationId" SessionField="LocationId" Type="Int32" />--%>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class='row' style="margin-bottom: 5px">
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                        <asp:Label ID="Label4" runat="server" class="auto-style1" Text="Technician's Name" />
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxComboBox ID="ddlQuotation" runat="server" Width="100%" BackColor="#F5F5F5" Height="25px"
                                            TextField="Name" ValueField="ExecutiveId" Skin="Windows7" NullText=" Search by Technician ">
                                        </dx:ASPxComboBox>
                                    </div>
                                

                                    <div class="col-md-2">
                                        <asp:Label ID="Label5" runat="server" class="auto-style1" Text="User's Name" />
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxComboBox ID="ddlUser" runat="server" Width="100%" DataSourceID="sqldsUser" BackColor="#F5F5F5" Height="25px"
                                            TextField="UserName" ValueField="UserName" Skin="Windows7" NullText=" Search by User ">
                                        </dx:ASPxComboBox>
                                    </div>
                                    <asp:SqlDataSource ID="sqldsUser" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand=" SELECT CRM_User.UserName FROM CRM_User  WHERE IsBlocked= 0 AND CRM_User.LocationId=@LocationId ">
                                        <SelectParameters>
                                            <asp:SessionParameter SessionField="LocationId" Name="LocationId" Type="Int32" DefaultValue="0" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <div class="col-md-2">
                                        <asp:Label ID="Label6" runat="server" class="auto-style1" Text="Status" />
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxComboBox ID="ddlStatus" runat="server" Width="100%" DataSourceID="sqldsStatus" BackColor="#F5F5F5" Height="25px"
                                            TextField="LeadStatus" ValueField="Status" Skin="Windows7" NullText=" Search by Status ">
                                        </dx:ASPxComboBox>
                                    </div>
                                    <asp:SqlDataSource ID="sqldsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand=" Select Distinct(Status) as Status,CRM_LeadStatus.LeadStatus From CRM_AssignLeade Inner Join
                                                CRM_LeadStatus On CRM_LeadStatus.LeadStatusId=CRM_AssignLeade.Status">
                                        <SelectParameters>
                                            <%-- <asp:SessionParameter Name="LocationId" SessionField="LocationId" Type="Int32" />--%>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class='row' style="margin-bottom: 5px">
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                        <asp:Label ID="Label11" runat="server" class="auto-style1" Text="From Date" />
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxDateEdit ID="dxFromDate" runat="server" Height="25px" BackColor="#F5F5F5" Width="100%" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" NullText=" Search by From Date ">
                                        </dx:ASPxDateEdit>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Label ID="Label12" runat="server" class="auto-style1" Text="To Date" />
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxDateEdit ID="dxToDate" runat="server" Height="25px" BackColor="#F5F5F5" Width="100%" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" NullText=" Search by To Date ">
                                        </dx:ASPxDateEdit>
                                    </div>
                                </div>
                            </div>

                            <div class='row' style="margin-bottom: 5px">
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                        <asp:Label ID="Label1" runat="server" class="auto-style1" Text="Report Name" />
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxComboBox ID="cbReport" runat="server" DropDownStyle="DropDownList" NullText=" Select Report " BackColor="Transparent"
                                            ValueType="System.String" TextFormatString="{0}" Width="100%" OnTextChanged="cbReport_TextChanged" AutoPostBack="true">
                                            <Items>
                                                <dx:ListEditItem Text="Assigned Job Details Report" Value="1" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </div>
                                    <div class="col-md-2">
                                    </div>
                                    <div class="col-md-2">
                                    </div>
                                </div>
                            </div>
                            <div class='row' style="margin-bottom: 10px; margin-top: 10px">
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                    </div>
                                    <div class="col-md-5">
                                        <asp:Button ID="btnView" runat="server" class="btn btn-success" Text="View" OnClick="btnView_Click" Width="60px"  />
                                        <asp:Button ID="btnClear" runat="server" class="btn btn-warning" Text="Clear" OnClick="btnClear_Click" Width="60px" />
                                        <asp:Button ID="btnReset" runat="server" class="btn btn-danger" Text="Reset" OnClick="btnReset_Click" Width="60px" />
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                    <div class="col-md-2">
                                    </div>
                                </div>
                            </div>

                            <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" Theme="Office2010Blue" OnLoad="ASPxDocumentViewer1_Load" Height="750px">

                                <SettingsParametersPanelCaption HorizontalAlign="Left" Position="Left" />
                                <StylesViewer>
                                    <Paddings Padding="40px"></Paddings>
                                </StylesViewer>
                                <StylesReportViewer>
                                    <Paddings Padding="10px"></Paddings>
                                </StylesReportViewer>
                                <StylesParametersPanelParameterEditors>
                                    <CaptionCell Width="40px">
                                    </CaptionCell>
                                </StylesParametersPanelParameterEditors>

                            </dx:ASPxDocumentViewer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
