<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TechnicianDetails.aspx.cs" Inherits="HRM.EmployeePortal.ExecutiveDetails" MasterPageFile="~/Portal.Master"%>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        .auto-style1 {
             Width:100%;
            height: 30px;
            font-family:Verdana;
            text-align:left;
            
        }
hr.style14 { 
  border: 0; 
  height: 1px; 
  background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
  background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
  background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
  background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0); 
}
         </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <section class="content-header">
            <h1>Technician Details
           <%-- <small>Advanced form element</small>--%>
            </h1>
          
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
                                    <label for="txtEPFNo" id="Label4" class="auto-style1">Employee Code</label></div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtEPFNo" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="10">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Technician Code is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>
                           

                            </div>

                         <div class="col-md-8">

                                <div class="col-md-3">
                                    <label for="txtName" id="Label2" class="auto-style1">Technician's Name</label></div>
                                    <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtName" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="40">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Technician Name is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>
                             
                             </div>
                           
                            <div class="col-md-8">

                                <div class="col-md-3">
                                    <label for="txtContactNo" id="lblUserName" class="auto-style1">Contact No</label></div>
                                <div class="col-md-5">
                                     <dx:ASPxTextBox ID="txtContactNo" BackColor="#F5F5F5" Height="25px" runat="server" Width="100px">
                                        <MaskSettings Mask="0000000000" />
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Contact No is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                               
                                </div>


                            </div>
                            <div class="col-md-8">
                                <div class="col-md-3">
                                    <label for="txtLocation" id="Label1" class="auto-style1">Location</label></div>
                                 <div class="col-md-5">
                                   <dx:ASPxComboBox ID="txtLocation" runat="server" BackColor="#F5F5F5"  ValueType="System.String" DropDownStyle="DropDownList" Width="100%" Height="25px"
                                    ValueField="LocationId"  Theme="Default" TextFormatString="{0}" NullText=" <<Select Location>> " DataSourceID="dsLocation" >
                                     <Columns>  
                                        <dx:ListBoxColumn FieldName="LocationName"    />
                                     </Columns>
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                  </dx:ASPxComboBox>

                                  <asp:SqlDataSource ID="dsLocation" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                            SelectCommand="SELECT LocationId,LocationName FROM CRM_Location">
                                  </asp:SqlDataSource> 

                                </div>
                            </div>
                          
                                <div class="col-md-8">
                                <div class="col-md-3">
                                    <label for="txtLocation" id="Label3" class="auto-style1">Email</label></div>
                                 <div class="col-md-5">
                                  <dx:ASPxTextBox ID="txtEmail" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" ClientInstanceName="Email" MaxLength="30">
                                  <ValidationSettings SetFocusOnError="True" Display="Dynamic" ErrorTextPosition="Right">
                                        <RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                   </ValidationSettings>
                                   <InvalidStyle BackColor="LightPink" />
                                  </dx:ASPxTextBox>
                                </div>
                            </div>
                                  <div class="col-md-8">

                                <div class="col-md-3">
                                    <label for="txtDescriptio" id="Label5" class="auto-style1">Active</label></div>
                                <div class="col-md-5">
                                             <dx:ASPxCheckBox ID="cbActive" runat="server" Checked="true" ></dx:ASPxCheckBox>
                                </div>
</div>

                             <div class="col-md-12">
                               <div class="box-footer">
                         <div class="pull-right" style="margin-left: 3px">
                               <dx:ASPxButton ID="btnClear"  Width="100px" runat="server" CssClass="btn btn-danger" Paddings-Padding="1px" CausesValidation="False" Text="Cancel" OnClick="btnClear_Click">
                               </dx:ASPxButton> 
                          </div>
                          <div class="pull-right" style="margin-left: 3px">
                                <dx:ASPxButton ID="btnAdd" runat="server"   CssClass="btn btn-success"  Paddings-Padding="1px"  Width="100px" Text="Save" OnClick="btnAdd_Click">
                                </dx:ASPxButton>
                          </div>
                                
                                   </div>  
                     </div>

                            <div class="col-md-12">

                                     <dx:ASPxGridView ID="gvExecutive" runat="server" AutoGenerateColumns="False" Font-Size ="Small" DataSourceID="dsExecutive" CssClass="col-md-12"
                                        ClientIDMode="AutoID" EnableTheming="True" KeyFieldName="ExecutiveId" Theme="Metropolis" Width="100%">
                                        <SettingsPager PageSize="50">
                                        </SettingsPager>
                                        <SettingsSearchPanel Visible="true" HighlightResults="true" />
                                         <SettingsBehavior AllowFocusedRow="false" />
                                         <Settings VerticalScrollableHeight="200" VerticalScrollBarMode="Auto"/>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ExecutiveId" Caption="Id" VisibleIndex="1" CellStyle-CssClass="col-md-5"  Visible="false">
                                            </dx:GridViewDataTextColumn>
                                             <dx:GridViewDataTextColumn FieldName="EPFNo" Caption="Code" VisibleIndex="2" Width="100px" >
                                                 <CellStyle HorizontalAlign="Left" />
                                            </dx:GridViewDataTextColumn>
                                              <dx:GridViewDataTextColumn FieldName="Name" Caption="Technician Name" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ContactNo" Caption="Contact No" VisibleIndex="4" Width="120px" >
                                                <CellStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Designation" Caption="Designation" VisibleIndex="5" Visible="false" >
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="LocationName" Caption="Location"  VisibleIndex="7">
                                                <CellStyle HorizontalAlign="Left" />
                                            </dx:GridViewDataTextColumn>
                                             <dx:GridViewDataTextColumn FieldName="Email" Caption="Email" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataCheckColumn FieldName="Active" Caption="Active" Width="80px" VisibleIndex="8">
                                                <CellStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataCheckColumn>
                                           
                                          
                                            <dx:GridViewDataTextColumn Caption="Select" VisibleIndex="0" Width="100px">
                                                <CellStyle HorizontalAlign="Center" />
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
     
                    </div>
                                              </ContentTemplate>
                 </asp:UpdatePanel>
              </div>   
            </section>
     <asp:HiddenField ID="hfExecutiveId" runat="server" />
                           <asp:SqlDataSource ID="dsExecutive" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                           SelectCommand="CRM_GetExecutiveDetails" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="ExecutiveId" Type="Int32" />
                                <asp:SessionParameter Name="LocationId" SessionField="LocationId" Type="Int32" />
                            </SelectParameters>
                           </asp:SqlDataSource> 

    </asp:Content>