<%@ Page Title="" Language="C#" MasterPageFile="~/Portal.Master" AutoEventWireup="true"
    CodeBehind="MyInformation.aspx.cs" Inherits="HRM.EmployeePortal.MyInformation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <asp:HiddenField ID="hfEmployeeId" runat="server" />
    <asp:HiddenField ID="hfCompanyId" runat="server" />
    <style>
        .lblClass {
            background-color: #eee;
            opacity: 1;
        }
    </style>


                        <div class="box-body">
                        <div class=" row ">
                            <div class="col-md-6 ">
                                <div class="box-body box-profile ">
                                   <asp:HiddenField ID="hFimageURL" runat="server" />
                                      <asp:Image ID="imgEmployee"  class="profile-user-img img-responsive img-circle "  runat="server" 
                                    Width="90px" Height="110px" />
                                    <h3 class="profile-username text-center ">
                            <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label></h3>
                                    <p class="text-muted text-center "><asp:Label ID="lblDesignation" runat="server" Text=""></asp:Label></p>
                                    <p class="text-muted text-center ">Employee NO :  <asp:Label ID="lblEPFNo" runat="server" Text=""></asp:Label></p>
                                   
                                </div>

                            </div>
                            <div class="col-md-6 ">
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="lblFirstName" class="col-sm-3 control-label">First Name</label>
                                            <div class="col-sm-9">                                               
                                                <asp:Label ID="lblFirstName" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="lblLastName" class="col-sm-3 control-label">Last Name</label>
                                            <div class="col-sm-9">
                                                <asp:Label ID="lblLastName" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                             <div class="form-group">
                                            <label for="lblNameWithInitials" class="col-sm-3 control-label">Name with initials</label>
                                            <div class="col-sm-9">
                                                <asp:Label ID="lblNameWithInitials" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                                <div class="form-group">
                                            <label for="lblGender" class="col-sm-3 control-label">Gender</label>
                                            <div class="col-sm-9">
                                                 <asp:Label ID="lblGender" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                 


                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class=" row">
                            <div class="col-md-6 ">

                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="lblEcontactNu" class="col-sm-3 control-label">Contact Number</label>
                                            <div class="col-sm-9">
                                               <asp:Label ID="lblContactNu" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="lblHomTP" class="col-sm-3 control-label">Home T.P</label>
                                            <div class="col-sm-9">
                                              <asp:Label ID="lblHomTP" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="lblEmail" class="col-sm-3 control-label">Office Email</label>
                                            <div class="col-sm-9">
                                                <asp:Label ID="lblEmail" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="lblNic" class="col-sm-3 control-label">NIC/Passport</label>
                                            <div class="col-sm-9">
                                                <asp:Label ID="lblNic" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                            <div class="form-group">
                                            <label for="lblDB" class="col-sm-3 control-label">Date of Birth</label>
                                            <div class="col-sm-9">
                                                  <asp:Label ID="lblDB" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 ">
                                <div class="form-horizontal">
                                    <div class="box-body">
                                                                                
                                                        <div class="form-group">
                                            <label for="lblMarital" class="col-sm-3 control-label"> Marital Status</label>
                                            <div class="col-sm-9">
                                                 <asp:Label ID="lblMarital" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                
                                        <div class="form-group">
                                            <label for="lblAddress" class="col-sm-3 control-label">Address</label>
                                            <div class="col-sm-9">
                                                <asp:Label ID="lblAddress" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                      <div class="form-group">
                                            <label for="" class="col-sm-3 control-label">Emaergency Contact Persion</label>
                                            <div class="col-sm-9">
                                                <asp:Label ID="lblMobile" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label for="lblRelation" class="col-sm-3 control-label">RelationShip</label>
                                            <div class="col-sm-9">
                                                <asp:Label ID="lblRelation" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>lblMobile
                                        <div class="form-group">
                                            <label for="lblEmaContact" class="col-sm-3 control-label">Emaergency Contact</label>
                                            <div class="col-sm-9">
                                            
                                                 <asp:Label ID="lblEmaContact" class="form-control lblClass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
            </div>
      <div class="box-footer">
                   <div class="pull-right">
                      <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Update" OnClick="Button1_Click" />
                                  
                           </div>
                        </div>
     </asp:Content>