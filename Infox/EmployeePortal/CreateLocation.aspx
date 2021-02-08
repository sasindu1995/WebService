<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateLocation.aspx.cs" Inherits="HRM.EmployeePortal.CreateLocation" MasterPageFile="~/Portal.Master" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    
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
                                    <label for="txtItemName" id="Label4" class="auto-style1">Location Code</label></div>
                                <div class="col-md-2">
                                    <dx:ASPxTextBox ID="txtItemCode" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="10">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Product Code is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>


                            </div>
                            <div class="col-md-8">

                                <div class="col-md-3">
                                    <label for="txtItemName" id="lblUserName" class="auto-style1">Location Name</label></div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtItemName" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="50">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Product Name is required" />
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
                               <dx:ASPxButton ID="btnClear"  Width="80px" Height="20px" runat="server" CssClass="btn btn-info" Paddings-Padding="3px" CausesValidation="False" Text="Cancel" OnClick="btnClear_Click">
                               </dx:ASPxButton> 
                          </div>
                          <div class="pull-right" style="margin-left: 3px">
                                <dx:ASPxButton ID="btnAdd" runat="server"    CssClass="btn btn-info"  Paddings-Padding="3px"  Width="80px" Height="20px" Text="Save" OnClick="btnAdd_Click">
                             
                                </dx:ASPxButton>
                          </div>
                                
                                   </div>  
                     </div>
                            
                            <div class="col-md-12">

                                     <dx:ASPxGridView ID="gvLocation" runat="server" AutoGenerateColumns="False" Font-Size ="Small" DataSourceID="dsLocation" CssClass="col-md-12"
                                        ClientIDMode="AutoID" EnableTheming="True" KeyFieldName="LocationId" Theme="MetropolisBlue" Width="100%">
                                        <SettingsPager PageSize="10">
                                        </SettingsPager>
                                        <SettingsSearchPanel Visible="true" HighlightResults="true" />
                                        <Columns>

                                            <dx:GridViewDataTextColumn FieldName="ItemId" Caption="Item Id" VisibleIndex="1" CellStyle-CssClass="col-md-5"  Visible="false">
                                            </dx:GridViewDataTextColumn>
                                             <dx:GridViewDataTextColumn FieldName="Code" Caption="Product Code" VisibleIndex="2" width="50px">
                                                 <CellStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Name" Caption="Product Name" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Description" Caption="Description" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Remarks"  Caption="Remarks"  VisibleIndex="5" Visible="false">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataCheckColumn FieldName="Active" Caption="Active" Width="30px" VisibleIndex="5">
                                                <CellStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataCheckColumn>
                                           
                                          
                                            <dx:GridViewDataTextColumn Caption="Select" VisibleIndex="6" width="100px">
                                                <CellStyle HorizontalAlign="Center" />
                                                <DataItemTemplate>
                                                    <asp:LinkButton ID="lkSelect" runat="server" OnClick="lkSelect_Click">Select</asp:LinkButton>
                                                </DataItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                               <CellStyle HorizontalAlign="Center"/>
                                            </dx:GridViewDataTextColumn>

                                        </Columns>
                                          <Styles>
                                            <Header BackColor="WindowFrame" Font-Bold="true" HorizontalAlign="Center">
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
     <asp:HiddenField ID="hfitemId" runat="server" />
            <asp:SqlDataSource ID="dsItem" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             SelectCommand="CRM_GetItemDetails" SelectCommandType="StoredProcedure">
                 <SelectParameters>
                       <asp:Parameter DefaultValue="0" Name="itemId" Type="Int64" />
                 </SelectParameters>
             </asp:SqlDataSource> 

    </asp:Content>