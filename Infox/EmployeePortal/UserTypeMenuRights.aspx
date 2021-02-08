<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTypeMenuRights.aspx.cs" Inherits="HRM.EmployeePortal.UserTypeMenuRights" MasterPageFile="~/Portal.Master" %>

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
        <h1>User's Menu Rights
           <%-- <small>Advanced form element</small>--%>
        </h1>
        <ol class="breadcrumb">
            <li><a href="ServiceRegistration.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <%--   <li><a href="#">Forms</a></li>--%>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class='row'>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class='col-md-12'>
                        <div class="alert alert-danger slide in" id="Div1" runat="server">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong><i class="icon fa fa-ban"></i>Alert! </strong>
                            <asp:Label ID="Label1" runat="server"></asp:Label>


                        </div>
                        <div class="alert alert-success alert-dismissable" id="Div2" runat="server">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong><i class="icon fa fa-check"></i>Alert! </strong>
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                        </div>


                        <div class="box box-default">
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="col-md-3">
                                            <label for="txtUserRole" id="lblUserName" class="auto-style1">User Type</label>
                                        </div>
                                        <div class="col-md-5">
                                            <dx:ASPxComboBox ID="txtUserRole" Height="25px" BackColor="#F5F5F5" runat="server" DropDownStyle="DropDownList" DataSourceID="SqlDsUserType" AutoPostBack="true"
                                                ValueField="UserTypeId" ValueType="System.String" TextFormatString="{0}" NullText=" << Select User Type >> " MaxLength="50" OnSelectedIndexChanged="txtUserRole_SelectedIndexChanged">
                                                <Columns>
                                                    <dx:ListBoxColumn FieldName="UserTypeName" Width="200px" />
                                                </Columns>
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                                    <RequiredField IsRequired="true" ErrorText="User Type is required" />
                                                </ValidationSettings>
                                                <InvalidStyle BackColor="LightPink" />
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDsUserType" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                                SelectCommand="SELECT [UserTypeId],[UserTypeName],[Active]  FROM  [CRM_UserTypes]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="col-md-3">
                                            <label for="dxUsers" id="Label3" class="auto-style1">Users</label>
                                        </div>
                                        <div class="col-md-5">
                                            <dx:ASPxComboBox ID="dxUsers" Height="25px" BackColor="#F5F5F5" runat="server" DropDownStyle="DropDownList" DataSourceID="objdsUser"
                                                ValueField="Id" TextField="UserName" ValueType="System.String" AutoPostBack="true" OnSelectedIndexChanged="dxUsers_SelectedIndexChanged"  TextFormatString="{0}" NullText=" << Select User >> ">
                                                <Columns>
                                                    <dx:ListBoxColumn FieldName="UserName" Width="200px" />
                                                </Columns>
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                                    <RequiredField IsRequired="true" ErrorText="Login Type is required" />
                                                </ValidationSettings>
                                                <InvalidStyle BackColor="LightPink" />
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="objdsUser" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                                SelectCommand="SELECT Id,CRM_Location.LocationName+'\'+CRM_User.UserName as UserName
                                                                   FROM CRM_User INNER JOIN 
                                                                   CRM_Location ON  [CRM_User].LocationId = CRM_Location.LocationId 
                                                                   WHERE ([UserTypeId] = @UserTypeId)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="txtUserRole" Name="UserTypeId" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-2">
                                            <label for="dxUsers" id="Label4" class="auto-style1">Location</label>
                                        </div>
                                        <div class="col-md-9">
                                            <dx:ASPxComboBox ID="dxLocation" Height="25px" BackColor="#F5F5F5" runat="server" DropDownStyle="DropDownList" DataSourceID="objdsLocation"
                                                ValueField="LocationId" TextField="LocationName" ValueType="System.String" TextFormatString="{0}" NullText=" << Select Location >> " AutoPostBack="true" OnSelectedIndexChanged="dxLocation_SelectedIndexChanged">
                                                <Columns>
                                                    <dx:ListBoxColumn FieldName="LocationName" Width="100px" />
                                                </Columns>
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                                    <RequiredField IsRequired="true" ErrorText="Login Type is required" />
                                                </ValidationSettings>
                                                <InvalidStyle BackColor="LightPink" />
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="objdsLocation" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                                SelectCommand="SELECT CRM_Location.LocationId, CRM_Location.LocationCode, CRM_Location.LocationName
                                                                        FROM   CRM_Location
                                                                        WHERE CRM_Location.IsActive='True'"></asp:SqlDataSource>
                                            <dx:ASPxCheckBoxList ID="cblLocation" Visible="false" Width="100%" runat="server" ValueType="System.String" RepeatColumns="6" Font-Names="Verdana"
                                                        RepeatDirection="Horizontal" Theme="Metropolis"></dx:ASPxCheckBoxList>
                                        </div>
                                    </div>
                                </div>
                               <div class="panel panel-default">
                                        <div class="panel-heading">NAVIGATION MENU</div>
                                         <div class="panel-body" style="padding-top:0px;">
                                            <div class="row">
                                    <div class="col-md-12">
                                        <ul class="messages_layout">
                                            <li>
                                                <div class="message_wrap">
                                                    <span class="arrow"></span>
                                                    <div class="info"  style="margin-top: 25px; padding-top:5px;">
                                                        <a class="name">ADMINISTRATION MENU</a> <span class="time"></span>
                                                        <div class="options_arrow">
                                                            <%-- <div class="dropdown pull-right"> <a class="dropdown-toggle " id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#"> <i class=" icon-caret-down"></i> </a>
                                                                <ul class="dropdown-menu " role="menu" aria-labelledby="dLabel">
                                                                    <li><a href="#"><i class=" icon-share-alt icon-large"></i> Reply</a></li>
                                                                    <li><a href="#"><i class=" icon-trash icon-large"></i> Delete</a></li>
                                                                    <li><a href="#"><i class=" icon-share icon-large"></i> Share</a></li>
                                                                </ul>
                                                                </div>--%>
                                                        </div>
                                                    </div>
                                                    <div class="text">
                                                        <dx:ASPxCheckBoxList ID="chadminAdd" Width="100%" runat="server" ValueType="System.String" Font-Names="Verdana"
                                                            RepeatColumns="6" RepeatDirection="Horizontal" Theme="Metropolis"></dx:ASPxCheckBoxList>
                                                    </div>
                                            </li>
                                            <br />
                                            <br />
                                            <li>
                                                <div class="message_wrap">
                                                    <span class="arrow"></span>
                                                    <di class="info"> <a class="name">MAIN NAVIGATION MENU</a> <span class="time"></span>
                                                            <div class="options_arrow">
                                                          <%-- <div class="dropdown pull-right"> <a class="dropdown-toggle " id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#"> <i class=" icon-caret-down"></i> </a>
                                                                <ul class="dropdown-menu " role="menu" aria-labelledby="dLabel">
                                                                    <li><a href="#"><i class=" icon-share-alt icon-large"></i> Reply</a></li>
                                                                    <li><a href="#"><i class=" icon-trash icon-large"></i> Delete</a></li>
                                                                    <li><a href="#"><i class=" icon-share icon-large"></i> Share</a></li>
                                                                </ul>
                                                                </div>--%>
                                                            </div>
                                                </div>
                                                <div class="text">
                                                    <dx:ASPxCheckBoxList ID="common" Width="100%" runat="server" ValueType="System.String" RepeatColumns="6" Font-Names="Verdana"
                                                        RepeatDirection="Horizontal" Theme="Metropolis"></dx:ASPxCheckBoxList>
                                                </div>
                                                <br />
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="box-footer">
                                        <div class="pull-right" style="margin-left: 3px">
                                            <dx:ASPxButton ID="btnClr" Width="100px" runat="server" CssClass="btn btn-danger" Paddings-Padding="1px" CausesValidation="False" Text="Cancel" OnClick="btnClr_Click">
                                            </dx:ASPxButton>
                                        </div>
                                        <div class="pull-right" style="margin-left: 3px">
                                            <dx:ASPxButton ID="btSaveExtarActivity" runat="server" CssClass="btn btn-success" Paddings-Padding="1px" Width="100px"  Text="Submit" OnClick="btSaveExtarActivity_Click">
                                            </dx:ASPxButton>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <div class="pull-right" style="margin-left: 3px">
                                            
                                        </div>
                                        <div class="pull-right" style="margin-left: 3px">
                                            
                                        </div>
                                    </div>
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
    <!-- /.content -->
    <%--    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"  id="MessageModal">
  <div class="modal-dialog modal-sm">
   <div class="modal-content">
      ...
    </div>
  </div>
</div>--%>
</asp:Content>
