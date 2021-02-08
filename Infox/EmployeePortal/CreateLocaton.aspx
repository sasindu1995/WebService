<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateLocaton.aspx.cs" Inherits="HRM.EmployeePortal.CreateLocaton" MasterPageFile="~/Portal.Master" %>

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
            <h1>Create Location
           <%-- <small>Advanced form element</small>--%>
            </h1>
          
        </section>
            <section class="content">
                  <div class='row'>
                      
           <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional"  >
                 <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                </Triggers>
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
                                    <label for="txtLocationCode" id="Label4" class="auto-style1">Location Code</label></div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtLocationCode" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="3">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Location Code is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>


                            </div>
                            <div class="col-md-8">

                                <div class="col-md-3">
                                    <label for="txtLocationName" id="lblUserName" class="auto-style1">Location Name</label></div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtLocationName" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="50">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Location Name is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>


                            </div>
                          
                                  <div class="col-md-8">

                                <div class="col-md-3">
                                    <label for="txtDescriptio" id="Label3" class="auto-style1">Active</label></div>
                                <div class="col-md-5">
                                             <dx:ASPxCheckBox ID="cbActive" runat="server" Checked="true"  ></dx:ASPxCheckBox>
                                </div>



                            </div>

                             <div class="col-md-12">
                               <div class="box-footer">
                         <div class="pull-right" style="margin-left: 3px">
                               <dx:ASPxButton ID="btnClear"  Width="100px" runat="server" CssClass="btn btn-danger" Paddings-Padding="1px" CausesValidation="False" Text="Cancel" OnClick="btnClear_Click">
                               </dx:ASPxButton> 
                          </div>
                          <div class="pull-right" style="margin-left: 3px">
                                <dx:ASPxButton ID="btnAdd" runat="server"    CssClass="btn btn-success"  Paddings-Padding="1px"  Width="100px"  Text="Save" OnClick="btnAdd_Click">
                             
                                </dx:ASPxButton>
                          </div>
                                
                                   </div>  
                     </div>
                            
                            <div class="col-md-12">

                                     <dx:ASPxGridView ID="gvLocation" runat="server" AutoGenerateColumns="False" Font-Size ="Small" DataSourceID="dsLocation" CssClass="col-md-12"
                                        ClientIDMode="AutoID" EnableTheming="True" KeyFieldName="LocationId" Theme="Metropolis" Width="100%">
                                        <SettingsPager PageSize="50">
                                        </SettingsPager>
                                        <SettingsSearchPanel Visible="true" HighlightResults="true" />
                                            <SettingsBehavior AllowFocusedRow="false" />

                                        <Columns>

                                       
                                            <dx:GridViewDataTextColumn FieldName="LocationId" Caption="LocationId" VisibleIndex="1" Visible="false">
                                            </dx:GridViewDataTextColumn>
                                             <dx:GridViewDataTextColumn FieldName="LocationCode" Caption="Code" VisibleIndex="2" width="100px">
                                                 <CellStyle HorizontalAlign="Left" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="LocationName" Caption="Location Name" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataCheckColumn FieldName="IsActive" Caption="Active"  VisibleIndex="4" width="80px">
                                                <CellStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataTextColumn Caption="Select" VisibleIndex="0" width="100px">
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
                                            <AlternatingRow BackColor="Transparent">
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
     <asp:HiddenField ID="hfLocationId" runat="server" />

      <asp:SqlDataSource ID="dsLocation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                          
         SelectCommand=" SELECT        [LocationId], [LocationCode], [LocationName], [IsActive]
                         FROM            dbo.CRM_Location ">
                   
                         
    </asp:SqlDataSource>


    </asp:Content>