<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="HRM.EmployeePortal.ChangePassword" MasterPageFile="~/Portal.Master" %>


<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            Width: 100%;
            height: 30px;
            font-family: Verdana;
            text-align: left;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>Change Password
           <%-- <small>Advanced form element</small>--%>
        </h1>
        <ol class="breadcrumb">
            <li><a href="ServiceRegistration.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
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
                        <div class="box box-default">
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-8">

                                        <div class="col-md-3">
                                            <label for="txtLoginType" id="Label2" class="auto-style1">Login Type</label>
                                        </div>
                                        <div class="col-md-5">
                                            <dx:ASPxTextBox ID="txtLoginType" BackColor="#F5F5F5" Height="25px" runat="server" ReadOnly="True" Width="100%"></dx:ASPxTextBox>
                                        </div>



                                    </div>
                                    <div class="col-md-8">

                                        <div class="col-md-3">
                                            <label for="txtUserName" id="lblUserName" class="auto-style1">User Name</label>
                                        </div>
                                        <div class="col-md-5">
                                            <dx:ASPxTextBox ID="txtUserName" runat="server" Height="25px" Width="100%">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                                    <RequiredField IsRequired="true" ErrorText="User Name is required" />
                                                </ValidationSettings>
                                                <InvalidStyle BackColor="LightPink" />
                                            </dx:ASPxTextBox>
                                        </div>



                                    </div>
                                    <div class="col-md-8">

                                        <div class="col-md-3">
                                            <label for="txtCurrentPw" id="Label1" class="auto-style1">Current Password</label>
                                        </div>
                                        <div class="col-md-5">
                                            <dx:ASPxTextBox ID="txtCurrentPw" runat="server" Password="true" Height="25px" Width="100%">
                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                                    <%--<RequiredField IsRequired="true" ErrorText="Current Password is required" />--%>
                                                </ValidationSettings>
                                                <InvalidStyle BackColor="LightPink" />
                                            </dx:ASPxTextBox>
                                            <asp:HiddenField ID="hfPassword" runat="server" />
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Button ID="radbtnChange" CausesValidation="false" runat="server" ButtonType="LinkButton" CssClass="btn btn-success" Text="Change Password" BorderStyle="None" OnClick="radbtnChange_Click" />

                                        </div>



                                    </div>

                                    <asp:Panel ID="Password" runat="server" Width="100%" Visible="false">
                                        <div class="col-md-8">
                                            <div class="col-md-3">
                                                <label for="txtCurrentPw" id="Label3" class="auto-style1">New Password</label>
                                            </div>
                                            <div class="col-md-5">
                                                <dx:ASPxTextBox ID="txtNewPassword" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" Password="true" ClientInstanceName="txtNewPassword">
                                                    <ClientSideEvents Validation="function(s, e) {e.isValid = (s.GetText().length>5)}" />
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="The password lengt should be more that 5 symbols" ErrorTextPosition="Right">
                                                    </ValidationSettings>
                                                    <InvalidStyle BackColor="LightPink" />
                                                </dx:ASPxTextBox>

                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="col-md-3">
                                                <label for="txtCurrentPw" id="Label4" class="auto-style1">Confirm Password</label>

                                            </div>

                                            <div class="col-md-5">
                                                <dx:ASPxTextBox ID="radtxtConfirmPassword" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" Password="true" ClientInstanceName="radtxtConfirmPassword">
                                                    <ClientSideEvents Validation="function(s, e) {e.isValid = (s.GetText() == txtNewPassword.GetText());}" />
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="The password is incorrect" ErrorTextPosition="Right">
                                                    </ValidationSettings>
                                                    <InvalidStyle BackColor="LightPink" />
                                                </dx:ASPxTextBox>
                                            </div>
                                        </div>



                                    </asp:Panel>

                                    <div class="col-md-8">
                                        <div class="col-md-3">
                                            <label for="txtCurrentPw" id="Label5" class="auto-style1">Security Question</label>

                                        </div>

                                        <div class="col-md-5">
                                            <dx:ASPxTextBox ID="radtxtSecurityQuestion" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                                    <RequiredField IsRequired="true" ErrorText=" Security Question is required" />
                                                </ValidationSettings>
                                                <InvalidStyle BackColor="LightPink" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="col-md-3">
                                            <label for="radtxtAnswer" id="Label6" class="auto-style1">Answer</label>
                                        </div>
                                        <div class="col-md-5">
                                            <dx:ASPxTextBox ID="radtxtAnswer" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                                    <RequiredField IsRequired="true" ErrorText="Answer is required" />
                                                </ValidationSettings>
                                                <InvalidStyle BackColor="LightPink" />
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="box-footer" style="border-bottom: 300px solid #ffffff;">

                                            <div class="pull-right" style="margin-left: 3px">
                                                <dx:ASPxButton ID="btClear" Width="100px" runat="server" CssClass="btn btn-danger" Paddings-Padding="1px" CausesValidation="False" Text="Cancel" OnClick="btClear_Click">
                                                </dx:ASPxButton>
                                            </div>
                                            <div class="pull-right" style="margin-left: 3px">
                                                <dx:ASPxButton ID="btSaveExtarActivity" runat="server" CssClass="btn btn-success" Paddings-Padding="1px" Width="100px" Text="Submit" OnClick="btSaveExtarActivity_Click">
                                                </dx:ASPxButton>
                                            </div>





                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>
