<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRegistration.aspx.cs" Inherits="HRM.EmployeePortal.LeadRegistration" MasterPageFile="~/Portal.Master" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function onValidation(s, e) {

            e.isValid = true;
            //if (s.GetValue().trim().length == 0) {


            //}
        }
    </script>

    <style type="text/css">
        .auto-style1 {
            Width: 100%;
            height: 30px;
            font-family: Verdana;
            text-align: left;
        }

        @media (min-width: 768px) {
            .modal-xl {
                width: 100%;
                max-width: 90%;
            }
        }
        #ContentPlaceHolder1_GridView1 {
            width:100%;
            margin-bottom:30px;
            margin-top:10px;
        }
        th {
            text-align:center;
        }
    </style>
    <script>
        function show() {
            $('#exampleModal').modal('toggle');
        }
        function close() {
            document.getElementById('exampleModal').className = 'hiddendiv';
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <section class="content-header">
            <h1>Service Registration 
           <%-- <small>Advanced form element</small>--%>
            </h1>
            <ol class="breadcrumb">
                <%-- <li><a href="Default.aspx"><i class="fa fa-dashboard"></i>Home</a></li>--%>

                <li>
                    <asp:LinkButton ID="lkSearchLeads" runat="server" OnClick="lkSearchLeads_Click" Visible="true" ForeColor="#fd6600" Font-Bold="true"
                        Font-Size="16px" font-family="Verdana">Search Customer</asp:LinkButton>
                </li>
                <%--   <li><a href="#">Forms</a></li>--%>
            </ol>
        </section>
        <section class="content">
            <div class='row'>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
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

                            <div class="box box-default">


                                <div class="row">
                                 <dx:ASPxComboBox ID="CmbCustomers" runat="server" Width="285px" DropDownWidth="550"
        DropDownStyle="DropDownList" DataSourceID="SqlDataSource1" ValueField="Id"
        ValueType="System.String" TextFormatString="{0}" EnableCallbackMode="true" IncrementalFilteringMode="StartsWith"
        CallbackPageSize="30">
        <Columns>
            <dx:ListBoxColumn FieldName="Type" Width="80px" />
            <dx:ListBoxColumn FieldName="Description" Width="100PX" />
            <dx:ListBoxColumn FieldName="Active" Width="70px" />
           
        </Columns>
    </dx:ASPxComboBox>
                                     </div>

                                <div class="box-body">
                                         <div>
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Button" OnClick="Button1_Click" />
            
    <asp:GridView ID="GridView1" runat="server" ShowFooter="true" AutoGenerateColumns="false" >
        <Columns>
        <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
        <asp:TemplateField HeaderText="Header 1">
            <ItemTemplate>
                <asp:CheckBox ID="TextBox1" CssClass="text-muted" runat="server"></asp:CheckBox>
            </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Header 2">
            <ItemTemplate>
             <dx:ASPxComboBox ID="CmbCustomers" runat="server" Width="100%" DropDownWidth="550"
        DropDownStyle="DropDownList" DataSourceID="SqlDataSource1" ValueField="Id" CssClass="form-control"
        ValueType="System.String" TextFormatString="{0}" EnableCallbackMode="true" IncrementalFilteringMode="StartsWith"
        CallbackPageSize="30">
        <Columns>
            <dx:ListBoxColumn FieldName="Type" Width="80px"  />
            <dx:ListBoxColumn FieldName="Description" Width="100PX" />
            <dx:ListBoxColumn FieldName="Active" Width="70px" />
           
        </Columns>
    </dx:ASPxComboBox>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Header 3">
            <ItemTemplate>
                 <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
            </ItemTemplate>

            <FooterStyle HorizontalAlign="Right" />
            <FooterTemplate>
             <%--<asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" />--%>
            </FooterTemplate>
        </asp:TemplateField>

        </Columns>
    </asp:GridView>
                           <dx:ASPxButton ID="GSave" runat="server" CssClass="btn btn-success" Paddings-Padding="1px" Width="100px" Text="Save" OnClick="GSave_Click" >
                                     </dx:ASPxButton>
        </div>

                                    <div class="row">
                                        <div class="col-md-1">
                                            <label for="txtLeadNo" id="lblLeadNo" class="auto-style1">Job No</label>
                                        </div>
                                        <div class="col-md-3">
                                            <dx:ASPxTextBox ID="txtLeadNo" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="10" ReadOnly="true" HorizontalAlign="Center">
                                            </dx:ASPxTextBox>
                                        </div>
                                        <div class="col-md-1">
                                            <label for="dxcbLeadSource" id="lblLeadSource" class="auto-style1">Source</label>
                                        </div>
                                        <div class="col-md-3">
                                            <dx:ASPxComboBox ID="dxcbLeadSource" Height="25px" BackColor="#F5F5F5" Width="100%" runat="server" DropDownStyle="DropDownList"
                                                ValueType="System.String" TextFormatString="{0}" MaxLength="50">
                                                <Items>
                                                    <dx:ListEditItem Text="By Calling" Value="1"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="By Mailing" Value="2"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="By Walking" Value="3"></dx:ListEditItem>
                                                </Items>
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                                    <RequiredField IsRequired="true" ErrorText="Lead Source is required" />
                                                </ValidationSettings>
                                                <InvalidStyle BackColor="LightPink" />
                                            </dx:ASPxComboBox>
                                        </div>
                                        <div class="col-md-1">
                                            <label for="dtStartDate" id="Label3" class="auto-style1">Date</label>
                                        </div>
                                        <div class="col-md-3">
                                            <dx:ASPxDateEdit ID="dtStartDate" runat="server" Height="25px" BackColor="#F5F5F5" Width="100%" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" HorizontalAlign="Center">
                                            </dx:ASPxDateEdit>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <label for="txtContactNo" id="Label4" class="auto-style1">Location</label>
                                        </div>
                                        <div class="col-md-3">
                                            <dx:ASPxComboBox ID="txtLocation" BackColor="#F5F5F5" Height="25px" required="" Width="100%" runat="server" DropDownStyle="DropDownList" DataSourceID="SqlDsLocation"
                                                ValueField="LocationId" TextField="Name" ValueType="System.String" TextFormatString="{0}" NullText=" << Select Location >> " MaxLength="50" OnTextChanged="txtLocation_TextChanged"
                                                AutoPostBack="true">
                                                <Columns>
                                                    <dx:ListBoxColumn FieldName="Name" Width="100px" />
                                                </Columns>
                                            </dx:ASPxComboBox>
                                        </div>
                                        <div class="col-md-1">
                                            <label for="txtContactNo" id="Label7" class="auto-style1">Technician</label>
                                        </div>
                                        <div class="col-md-3">
                                            <dx:ASPxComboBox ID="txtOwner" BackColor="#F5F5F5" Height="25px" required="" Width="100%" runat="server" DropDownStyle="DropDownList" DataSourceID="SqlDsActivity"
                                                ValueField="ExecutiveId" TextField="Type" ValueType="System.String" TextFormatString="{0}" NullText=" << Job Assigning Technician >> " MaxLength="50"
                                                AutoPostBack="true" OnTextChanged="txtOwner_TextChanged">
                                                <Columns>
                                                    <dx:ListBoxColumn FieldName="Name" Width="100px" />
                                                </Columns>
                                            </dx:ASPxComboBox>
                                        </div>
                                        <div class="col-md-1">
                                            <label for="txtJobType" id="Label6" class="auto-style1">Type</label>
                                        </div>
                                        <div class="col-md-3">
                                            <dx:ASPxComboBox ID="txtJobType" Height="25px" BackColor="#F5F5F5" Width="100%" runat="server" DropDownStyle="DropDownList"
                                                ValueType="System.String" TextFormatString="{0}" MaxLength="50">
                                                <Items>
                                                    <dx:ListEditItem Text="Repair" Value="Repair"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Service" Value="Service"></dx:ListEditItem>
                                                </Items>
                                            </dx:ASPxComboBox>
                                        </div>
                                        <%--<div class="col-md-1">
                                            <label for="txtContactNo2" id="Label8" class="auto-style1">Remarks</label>
                                        </div>
                                        <div class="col-md-5">
                                            <dx:ASPxTextBox ID="Remarks" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="1000" Enabled="false">
                                            </dx:ASPxTextBox>
                                        </div>--%>
                                    </div>

                                    <div class="panel panel-default">
                                        <div class="panel-heading">Customer Details</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <label for="txtContactNo" id="lblContactNo" class="auto-style1">Contact No 1</label>
                                                </div>
                                                <div class="col-md-2">
                                                    <dx:ASPxTextBox ID="txtContactNo" ClientSideEvents-Validation="onValidation" BackColor="#F5F5F5" Height="25px" runat="server" Width="150px"
                                                        AutoPostBack="true" OnTextChanged="txtContactNo_TextChanged">
                                                        <MaskSettings Mask="0000000000" />
                                                        <ValidationSettings CausesValidation="True">
                                                        </ValidationSettings>
                                                        <InvalidStyle BackColor="LightPink" />
                                                    </dx:ASPxTextBox>
                                                </div>
                                                <div class="col-md-2">
                                                    <dx:ASPxButton ID="btnPRVICOM" runat="server" RenderMode="Link" Visible="false" ImagePosition="Left" OnClick="btnPRVICOM_Click">
                                                        <Image Url="Images/PRI4.png" Width="15px" Height="15px"></Image>
                                                    </dx:ASPxButton>

                                                    <dx:ASPxButton ID="btnNEXTCOM" runat="server" RenderMode="Link" Paddings-PaddingRight="5px" Visible="false" ImagePosition="Left" OnClick="btnNEXTCOM_Click">
                                                        <Image Url="Images/NEXT9.png" Width="15px" Height="15px"></Image>
                                                    </dx:ASPxButton>

                                                    <dx:ASPxButton ID="btnADDCOM" runat="server" RenderMode="Link" Visible="false" ImagePosition="Left" OnClick="btnADDCOM_Click">
                                                        <Image Url="Images/ADD8.png" Width="15px" Height="15px"></Image>
                                                    </dx:ASPxButton>
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="txtContactNo2" id="Label1" class="auto-style1">Contact No 2</label>
                                                </div>
                                                <div class="col-md-2">
                                                    <dx:ASPxTextBox ID="txtContactNo2" ClientSideEvents-Validation="onValidation" BackColor="#F5F5F5" Height="25px" runat="server" Width="150px">
                                                        <MaskSettings Mask="0000000000" />
                                                    </dx:ASPxTextBox>
                                                </div>
                                                <div class="col-md-2">
                                                    <dx:ASPxCheckBox ID="CBChange" runat="server" Text="Change Contact" Checked="false" OnCheckedChanged="CBChange_CheckedChanged" AutoPostBack="true" Visible="false"></dx:ASPxCheckBox>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-1">
                                                    <label for="txtName" id="lblName" class="auto-style1">Customer</label>
                                                </div>
                                                <div class="col-md-1">
                                                    <dx:ASPxComboBox ID="cbMR" Height="25px" BackColor="#F5F5F5" Width="60px" runat="server" DropDownStyle="DropDownList"
                                                        ValueType="System.String" TextFormatString="{0}">
                                                        <Items>
                                                            <dx:ListEditItem Text="Mr." Value="0"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Mrs." Value="1"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Miss." Value="2"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Dr." Value="3"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Rev." Value="4"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Rev.Fr." Value="5"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Prof." Value="6"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Arch." Value="7"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Com." Value="8"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Site." Value="9"></dx:ListEditItem>
                                                            <dx:ListEditItem Text="Ven." Value="10"></dx:ListEditItem>
                                                        </Items>
                                                    </dx:ASPxComboBox>
                                                </div>
                                                <div class="col-md-4">
                                                    <dx:ASPxTextBox ID="txtName" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="150">
                                                    </dx:ASPxTextBox>
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="txtName2" id="Label2" class="auto-style1">Customer Name 2</label>
                                                </div>
                                                <div class="col-md-4">
                                                    <dx:ASPxTextBox ID="txtName2" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="150">
                                                    </dx:ASPxTextBox>
                                                </div>


                                            </div>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <label for="txtAddress" id="Label9" class="auto-style1">Email Address 1</label>
                                                </div>
                                                <div class="col-md-4">
                                                    <dx:ASPxTextBox ID="txtEmail1" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="350">
                                                    </dx:ASPxTextBox>
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="txtSpecialInstruction" id="Label10" class="auto-style1">Email Address 2</label>
                                                </div>
                                                <div class="col-md-4">
                                                    <dx:ASPxTextBox ID="txtEmail2" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="200">
                                                    </dx:ASPxTextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <label for="txtAddress" id="lblAddress" class="auto-style1">Address</label>
                                                </div>
                                                <div class="col-md-4">
                                                    <dx:ASPxMemo ID="txtAddress" BackColor="#F5F5F5" Height="35px" runat="server" Width="100%" MaxLength="350">
                                                    </dx:ASPxMemo>
                                                </div>
                                                <div class="col-md-2">
                                                    <label for="txtSpecialInstruction" id="lblSpecialInstruction" class="auto-style1">Remark</label>
                                                </div>
                                                <div class="col-md-4">
                                                    <dx:ASPxMemo ID="txtSpecialInstruction" BackColor="#F5F5F5" Height="35px" runat="server" Width="100%" MaxLength="200">
                                                    </dx:ASPxMemo>
                                                </div>
                                            </div>
<%--                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="box-footer">
                                                        <div class="pull-right" style="margin-left: 3px">
                                                        </div>
                                                        <div class="pull-right" style="margin-left: 25px; height: 20px;">
                                                            <dx:ASPxButton ID="btnUpdateCust" runat="server" Visible="false" CssClass="btn btn-success" Paddings-Padding="1px" Width="100px" Text="Update" OnClick="btnUpdateCust_Click">
                                                            </dx:ASPxButton>
                                                        </div>
                                                        <div class="pull-right" style="margin-left: 3px">
                                                            <asp:Label ID="Label8" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">Inquiry Details</div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label for="txtinquiry" id="lblInquiry" class="auto-style1">Inquiry Detail</label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <dx:ASPxTextBox ID="txtinquiry" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="350">
                                                        </dx:ASPxTextBox>
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                    <div class="col-md-4">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label for="txtInquiryComment" id="Label16" class="auto-style1">Comment</label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <dx:ASPxMemo ID="txtInquiryComment" BackColor="#F5F5F5" Height="35px" runat="server" Width="100%" MaxLength="350">
                                                        </dx:ASPxMemo>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <label for="memoRemark" id="Label17" class="auto-style1">Remark</label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <dx:ASPxMemo ID="memoRemark" BackColor="#F5F5F5" Height="35px" runat="server" Width="100%" MaxLength="200">
                                                        </dx:ASPxMemo>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="box-footer">
                                                    <div class="pull-right" style="margin-left: 3px">
                                                        <dx:ASPxButton ID="btnClear1" Width="100px" runat="server" CssClass="btn btn-danger" Paddings-Padding="1px" Text="Cancel" OnClick="btnClear1_Click">
                                                        </dx:ASPxButton>
                                                    </div>
                                                    <div class="pull-right" style="margin-left: 25px; height: 20px;">
                                                        <dx:ASPxButton ID="btnSave" runat="server" CssClass="btn btn-success" Paddings-Padding="1px" Width="100px" Text="Save" OnClick="btnSave_Click">
                                                        </dx:ASPxButton>
                                                    </div>
                                                    <div class="pull-right" style="margin-left: 3px">
                                                        <asp:Label ID="lblResult" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>

                                <dx:ASPxPopupControl ID="confirmpopup" runat="server" HeaderText="Confirm Message" Height="100px" PopupHorizontalAlign="WindowCenter" Width="300px" PopupVerticalAlign="WindowCenter" Theme="Moderno">
                                    <HeaderTemplate>
                                        Confirm Message
                                    </HeaderTemplate>
                                    <ContentCollection>
                                        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">




                                            <table style="width: 100%;">
                                                <tr>
                                                    <td class="auto-style10" colspan="3">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style10" colspan="3" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif; font-style: normal;">Are you sure you want to Delete?</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style10">&nbsp;</td>
                                                    <td></td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td class="auto-style7">
                                                        <asp:Button ID="Button1" runat="server" Height="30px" Width="120px" Text="Yes" OnClick="btnDelete_Click1" CssClass="btn btn-block btn-success btn-large" />
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Button ID="Button3" runat="server" Height="30px" Width="120px" Text="No" OnClick="btnDeleteNo_Click" CssClass="btn btn-block btn-warning btn-large" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style7">&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>




                                        </dx:PopupControlContentControl>


                                    </ContentCollection>
                                </dx:ASPxPopupControl>

                                <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Confirm Message" Height="100px" PopupHorizontalAlign="WindowCenter" HeaderStyle-HorizontalAlign="Center" Font-Bold="true" Width="200px" PopupVerticalAlign="WindowCenter" Theme="Moderno">
                                    <HeaderTemplate>
                                        Job No
                                    </HeaderTemplate>

                                    <ContentCollection>
                                        <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">

                                            <table style="width: 100%;">
                                                <tr>
                                                    <td class="auto-style10" colspan="3" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif; font-style: normal; text-align: center">
                                                        <label id="Label5" runat="server"></label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td class="auto-style7">
                                                        <asp:Button ID="Ok1" runat="server" Height="30px" Width="50px" Text="OK" OnClick="btnOk_Click1" CssClass="btn btn-block btn-success btn-large" Font-Size="Small" />
                                                    </td>
                                                </tr>
                                            </table>

                                        </dx:PopupControlContentControl>


                                    </ContentCollection>
                                </dx:ASPxPopupControl>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </section>
        <asp:HiddenField ID="hfLeadDetailId" runat="server" />

    </div>
    <div class="col-md-12">
    <div class="modal fade bs-example-modal-xl" style="width: 100%" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">Customer List</h4>
                </div>
                <div class="modal-body">
                    <dx:ASPxGridView ID="gvCustSearch" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" EnableTheming="True" KeyFieldName="CustomerId" Theme="Metropolis"
                        PopupHorizontalAlign="WindowCenter" Width="100%" PopupVerticalAlign="WindowCenter">
                        <SettingsPager PageSize="15">
                        </SettingsPager>
                        <SettingsSearchPanel Visible="true" HighlightResults="true" />
                        <Columns>

                            <dx:GridViewDataTextColumn FieldName="FirstName" SortOrder="Ascending" Caption="Customer Name 1" VisibleIndex="1" Width="20%">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SecondName" Caption="Customer Name 2" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ContactNo" Caption="Contact No 1" VisibleIndex="2" Width="10%">
                                <CellStyle HorizontalAlign="Center" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ContactNo2" Caption="Contact No 2" VisibleIndex="5" Width="10%">
                                <CellStyle HorizontalAlign="Center" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Address" Caption="Contact Address" VisibleIndex="3" Width="30%">
                                <CellStyle HorizontalAlign="Left" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Email1" Caption="Email Address" VisibleIndex="3" Visible="false">
                                <CellStyle HorizontalAlign="Left" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Email2" Caption="Email Address" VisibleIndex="3" Visible="false">
                                <CellStyle HorizontalAlign="Left" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Remark" Caption="Remark" VisibleIndex="3" Visible="false">
                                <CellStyle HorizontalAlign="Left" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NameTitle" Caption="Name Title" VisibleIndex="7" Visible="false" Width="100">
                                <CellStyle HorizontalAlign="Center" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CusID" Caption="CustomerId" VisibleIndex="8" Width="100" Visible="false">
                                <CellStyle HorizontalAlign="Center" />
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Select" VisibleIndex="0" Width="5%">
                                <CellStyle HorizontalAlign="Center" />
                                <DataItemTemplate>
                                    <asp:LinkButton ID="lkSelect" runat="server" OnClick="lkSelect_Click">Select</asp:LinkButton>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>


                        </Columns>
                        <Styles>
                            <Header BackColor="WhiteSmoke" Font-Bold="true" HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F5F5F5">
                            </AlternatingRow>
                        </Styles>
                    </dx:ASPxGridView>

                </div>
                <div class="modal-footer">


                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <%--  <button type="button" class="btn btn-primary">Send message</button>--%>
                </div>
            </div>
        </div>
    </div>
        </div>
    <asp:SqlDataSource ID="SqlDsActivity" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [ExecutiveId], [EPFNo], [Name] as Name FROM [CRM_ExecutiveDetails] INNER JOIN
                          CRM_Location ON CRM_ExecutiveDetails.LocationId = CRM_Location.LocationId  WHERE Active= '1' AND CRM_ExecutiveDetails.LocationId=@LocationId ">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtLocation" Name="LocationId" Type="Int32" DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT Id, [Type], [Description], [Active] FROM [CRM_ActivityType]  WHERE Active='1'"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDsLocation" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT LocationId,LocationName as Name FROM CRM_Location WHERE IsActive= '1'"></asp:SqlDataSource>
    <asp:HiddenField ID="hfCustomerId" runat="server" />
</asp:Content>
