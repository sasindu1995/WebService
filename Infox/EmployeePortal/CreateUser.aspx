<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="HRM.EmployeePortal.CreateUser" MasterPageFile="~/Portal.Master" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        .auto-style1 {
             Width:100%;
            height: 30px;
            font-family:Verdana;
            text-align:left;
            
        }
         </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
            <h1> User Create
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
                                    <label for="txtUserName" id="lblUserName" class="auto-style1">User Name</label>
                                </div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtUserName" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" ReadOnly="false">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="User Name is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>
                            </div>
                            <div class="col-md-8">

                                <div class="col-md-3">
                                    <label id="lblPassword" runat="server" class="auto-style1">Password</label></div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtpw" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" Password="true" ReadOnly="false" ClientInstanceName="txtpw">
                                   <ClientSideEvents Validation="function(s, e) {e.isValid = (s.GetText().length>5)}" />
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="The password length should be more that 5 symbols" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Password is required" />
                                        </ValidationSettings>
                                         <InvalidStyle BackColor="LightPink"/>
                                    </dx:ASPxTextBox>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="col-md-3">
                                    <label id="lblRetypePassword" runat="server" class="auto-style1">Re-type Password</label></div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtpwRetype" BackColor="#F5F5F5" Height="25px" runat="server" Password="true" Width="100%" ReadOnly="false" ClientInstanceName="txtpwRetype" >
                                       <ClientSideEvents Validation="function(s, e) {e.isValid = (s.GetText() == txtpw.GetText());}" />
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="The password is incorrect" ErrorTextPosition="Right">
                                             <RequiredField IsRequired="true" ErrorText="Re-type Password is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink"/>
                                    </dx:ASPxTextBox>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="col-md-3">
                                    <label for="txtUserName" id="Label3" class="auto-style1">Login Type</label></div>
                                <div class="col-md-5">
                                    <dx:ASPxComboBox ID="cbLoginType" Height="25px" Width="100%" BackColor="#F5F5F5" runat="server" DropDownStyle="DropDownList" DataSourceID="sqldsLoginType"
                                        ValueField="UserTypeId" TextField="UserTypeName" ValueType="System.String" TextFormatString="{0}" NullText=" << Select Employee Login Type >> " >
                                        <Columns>
                                            <dx:ListBoxColumn FieldName="UserTypeName" Width="100px" />
                                        </Columns>
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Login Type is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="sqldsLoginType" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                        SelectCommand=" SELECT UserTypeId, UserTypeName,Active FROM CRM_UserTypes
                                            where Active not in ( select Active from CRM_UserTypes where Active ='False')"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-2">
                                    <button runat="server" class="bouton-image monBouton btn btn-success" onserverclick="bntuser_Click" style="width:80px;height:27px; padding-top:2px">Add New</button>
                                </div>
                            </div>
                             <div class="col-md-8">
                                <div class="col-md-3">
                                    <label id="Label1" runat="server" class="auto-style1">Location</label></div>
                                <div class="col-md-5">
                                   <dx:ASPxComboBox ID="dxLocation" Height="25px" Width="100%" BackColor="#F5F5F5" runat="server" DropDownStyle="DropDownList" DataSourceID="objdsLocation"
                                        ValueField="LocationId" TextField="LocationName" ValueType="System.String" TextFormatString="{0}" NullText=" << Select Location >> " >
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
                                                       WHERE CRM_Location.IsActive='True'">
                                     </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="col-md-3">
                                    <label for="txtUserName" id="Label2" class="auto-style1">Contact No</label>
                                </div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtContactNo" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" ReadOnly="false" MaxLength="10">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Contact No is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>
                            </div>
                                <div class="col-md-8">
                                <div class="col-md-3">
                                    <label for="txtDescriptio" id="Label4" class="auto-style1">Blocked User</label></div>
                                <div class="col-md-5">
                                             <dx:ASPxCheckBox ID="dxcheck" runat="server" Checked="false" ></dx:ASPxCheckBox>
                                </div>
                            </div>

                             <div class="col-md-12">
                               <div class="box-footer">
                         <div class="pull-right" style="margin-left: 3px">
                               <dx:ASPxButton ID="btnClear"  Width="100px"   runat="server" CssClass="btn btn-danger" Paddings-Padding="1px" CausesValidation="False" Text="Cancel" OnClick="btnClear_Click">
                               </dx:ASPxButton> 
                          </div>
                          <div class="pull-right" style="margin-left: 3px">
                                <dx:ASPxButton ID="btnAdd" runat="server"   CssClass="btn btn-success"  Paddings-Padding="1px"  Width="100px"  Text="Save" OnClick="btnAdd_Click">
                                </dx:ASPxButton>
                          </div>                                
                                   </div>  
                     </div>
                          <div class="col-md-12">
                                     <dx:ASPxGridView ID="gvUserDetails" runat="server" AutoGenerateColumns="False" Font-Size ="Small" DataSourceID="dsUserDetails" CssClass="col-md-12"
                                        ClientIDMode="AutoID" EnableTheming="True" KeyFieldName="UserId" Theme="Metropolis" Width="100%">                                        
                                        <SettingsPager PageSize="25">
                                        </SettingsPager>
                                        <SettingsSearchPanel Visible="true" HighlightResults="true" />
                                        <Columns>                                      
                                            <dx:GridViewDataTextColumn FieldName="UserTypeName" Caption="Login Type" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="UserName" Caption="User Name" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                              <dx:GridViewDataTextColumn FieldName="LocationName" Caption="Location" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                             <dx:GridViewDataTextColumn FieldName="UserContactNo" Caption="Contact No" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataCheckColumn FieldName="IsBlocked" Caption="Blocked" Width="80px" VisibleIndex="5">
                                                 <CellStyle HorizontalAlign="Center"></CellStyle>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataTextColumn FieldName="Answer"  Caption="Answer"  VisibleIndex="3" Visible="false">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Password" Caption="Password" VisibleIndex="4" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="UserId"  Caption="UserId " VisibleIndex="5" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Select" VisibleIndex="0" Width="100px">
                                                <DataItemTemplate>
                                                    <asp:LinkButton ID="lkSelect" runat="server" OnClick="lkSelect_Click">Select</asp:LinkButton>
                                                </DataItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                               <CellStyle HorizontalAlign="Center"/>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                          <Styles>
                                            <Header BackColor="WhiteSmoke" Font-Bold="true" HorizontalAlign="Center">                                    
                                            </Header>
                                            <Cell HorizontalAlign="Left"></Cell>
                                            <AlternatingRow BackColor="#F5F5F5">
                                            </AlternatingRow>
                                         </Styles>
                                    </dx:ASPxGridView>
                            </div>
                        </div>
                    </div>
                      <div class="box-body">
      <div class="row">
                            <div class="col-md-8">
                    <dx:ASPxPopupControl ID="changeAttPopUp"  runat="server" Width="450px" Height="190px"
        
        ClientInstanceName="popup" PopupElementID="popupArea" ShowOnPageLoad="True"  Theme="Moderno"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter"
        AllowDragging="True" AllowResize="false"  CloseAction="CloseButton"
        ScrollBars="None" HeaderText="Map" ShowFooter="true" FooterText="" PopupAnimationType="Fade">
                    <HeaderTemplate>
                       Create User Type 
                    </HeaderTemplate>
                    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" >

 
    <div>

    <table style="width:100%;" class="newFont">
        <tr>
                            <td>&nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
         </tr>
        <tr>
             
            <td class="auto-style1" style="font-size:13px;">User Type</td>
            <td >
            <dx:ASPxTextBox ID="dxtxtUserType" runat="server"  Height="30px" BackColor="#F5F5F5"  Width="200px"></dx:ASPxTextBox>
            </td>
          
            
        </tr>
         <tr>
            <td class="auto-style1" style="font-size:13px;" >Multiple Location allow</td>
             <td ><dx:ASPxCheckBox ID="cbMultiple" runat="server" Checked="false" ></dx:ASPxCheckBox></td>
           
        </tr>
        <tr>
            <td class="auto-style1" style="font-size:13px;" >Active</td>
             <td ><dx:ASPxCheckBox ID="cbActive" runat="server" Checked="true" ></dx:ASPxCheckBox></td>
           
        </tr>

        <tr>
            <td></td>
            <td class="auto-style1" ><asp:Label ID="lblerror" runat="server" ForeColor="Red" Visible="false"></asp:Label></td>
        </tr>
  
    </table>
        <div class="box-footer">


                                        <div class="pull-right" style="margin-left: 3px">
                                            <asp:Button ID="btnCancel" Width="100px" runat="server" CssClass="btn btn-info" Text="Cancel" OnClick="btnCancel_Click"  />
                                        </div>
                                        <div class="pull-right" style="margin-left: 3px">
                                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-info" Width="100px" Text="Save" OnClick="btnSave_Click"   />
                                        </div>

                                    </div>

                                        <dx:ASPxGridView ID="gvUserType" runat="server" AutoGenerateColumns="False" Font-Size ="Small" ClientIDMode="AutoID"
                                        EnableTheming="True" KeyFieldName="UserTypeId" Theme="Metropolis" Width="100%" >
                                           
                                        <SettingsPager PageSize="10">
                                        </SettingsPager>
                                        <SettingsSearchPanel Visible="false" HighlightResults="true" />
                                        <Columns>
                                           
                                             <dx:GridViewDataTextColumn FieldName="UserTypeId" Caption="" Visible="false" VisibleIndex="0" Width="140">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="UserTypeName" Caption="User Type Name" VisibleIndex="1" Width="140">
                                            </dx:GridViewDataTextColumn>
                                             <dx:GridViewDataCheckColumn FieldName="Active" Caption="Active" Width="30" VisibleIndex="3">
                                                  </dx:GridViewDataCheckColumn>
                                             <dx:GridViewDataCheckColumn FieldName="IsMultipleLocation" Caption="Multiple" Width="30" VisibleIndex="3">                                             
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataTextColumn Caption="Select" VisibleIndex="8" Width="80">
                                                <CellStyle HorizontalAlign="Center"></CellStyle>
                                                <DataItemTemplate>
                                                    <asp:LinkButton ID="lkSelectUser" runat="server" OnClick="lkSelectUser_Click">Select</asp:LinkButton>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                     


                                        </Columns>

                                          <Styles>
                                            <Header BackColor="WindowFrame" Font-Bold="true" HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow BackColor="#F5F5F5">
                                            </AlternatingRow>
                                         </Styles>

                                    </dx:ASPxGridView>
              
    
                            </div>

                        </dx:PopupControlContentControl>
                        </ContentCollection>
                </dx:ASPxPopupControl>  
                                </div>
                          </div>
                          
                </div>
                    </div>
                                   </ContentTemplate>
                 </asp:UpdatePanel>
              </div> 
            </section>
     <asp:HiddenField ID="hfUserTypeId" runat="server" />
           <asp:SqlDataSource ID="dsUserDetails" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                           SelectCommand="CRM_GetUserLoginDetails" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="EmployeeId" Type="Int64" />
                            </SelectParameters>
                           </asp:SqlDataSource> 
    </asp:Content>