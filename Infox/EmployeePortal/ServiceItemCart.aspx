<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceItemCart.aspx.cs" Inherits="HRM.EmployeePortal.ProductCart" MasterPageFile="~/Portal.Master" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <script type="text/javascript">
    
        function EnterEvent(e) {
            
            if (e.keyCode == 13) {
             
                document.getElementById("<%=btnAdd.ClientID %>").click();
            }
        }

</script>
    <style type="text/css">
        .auto-style1 {
             Width:100%;
            height: 30px;
            font-family:Verdana;
            text-align:left;
            
        }
         </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" DefaultButton="btnAdd" >
    
     <section class="content-header">
            <h1>Service Item Cart
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
                                    <label for="txtItemName" id="Label4" class="auto-style1">Item Code</label></div>
                                <div class="col-md-2">
                                    <dx:ASPxTextBox ID="txtItemCode" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="10">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Item Code is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>


                            </div>
                            <div class="col-md-8">

                                <div class="col-md-3">
                                    <label for="txtItemName" id="lblUserName" class="auto-style1">Item Name</label></div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtItemName" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="50">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Item Name is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>


                            </div>
                            <div class="col-md-8">

                                <div class="col-md-3">
                                    <label for="txtItemPrice" id="Label2" class="auto-style1">Item Price (LKR)</label></div>
                                <div class="col-md-5">
                                    <dx:ASPxTextBox ID="txtItemPrice" BackColor="#F5F5F5" Height="25px" runat="server" Width="100%" MaxLength="50">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Right">
                                            <RequiredField IsRequired="true" ErrorText="Item Price is required" />
                                        </ValidationSettings>
                                        <InvalidStyle BackColor="LightPink" />
                                    </dx:ASPxTextBox>
                                </div>


                            </div>
                            <div class="col-md-8">

                                <div class="col-md-3">
                                    <label for="txtItemDescription" id="Label1" class="auto-style1">Description</label></div>
                                <div class="col-md-5">
                                  <dx:ASPxTextBox ID="txtItemDescription" onkeypress="return EnterEvent(event)" BackColor="#F5F5F5" Height="35px" runat="server" Width="100%" MaxLength="50">
                                        
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
                                <dx:ASPxButton ID="btnAdd" runat="server"    CssClass="btn btn-success"  Paddings-Padding="1px"  Width="100px" Text="Save" OnClick="btnAdd_Click">
                             
                                </dx:ASPxButton>
                          </div>
                                
                                   </div>  
                     </div>                            
                            <div class="col-md-12">
                                     <dx:ASPxGridView ID="gvItem" runat="server" AutoGenerateColumns="False" Font-Size ="Small" DataSourceID="dsItem" CssClass="col-md-12"
                                        ClientIDMode="AutoID" EnableTheming="True" KeyFieldName="ItemId" Theme="Metropolis" Width="100%">
                                        <SettingsPager PageSize="50">
                                        </SettingsPager>
                                         <Settings VerticalScrollableHeight="240" VerticalScrollBarMode="Auto"/>
                                        <SettingsSearchPanel Visible="true" HighlightResults="true" />
                                            <SettingsBehavior AllowFocusedRow="false" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ItemId" Caption="Item Id" VisibleIndex="1" CellStyle-CssClass="col-md-5"  Visible="false">
                                            </dx:GridViewDataTextColumn>
                                             <dx:GridViewDataTextColumn FieldName="Code" Caption="Code" VisibleIndex="2" width="10%">
                                                 <CellStyle HorizontalAlign="Left" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Name" Caption="Item Name" VisibleIndex="3" width="35%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Price" Caption="Price" VisibleIndex="5" CellStyle-HorizontalAlign="Right" width="10%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Description" Caption="Description" VisibleIndex="4" width="35%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Remarks"  Caption="Remarks"  VisibleIndex="5" Visible="false">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataCheckColumn FieldName="Active" Caption="Active"  width="5%" VisibleIndex="6">
                                                <CellStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataCheckColumn>
                                           
                                          
                                            <dx:GridViewDataTextColumn Caption="Select" VisibleIndex="0"  width="5%">
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
     <asp:HiddenField ID="hfitemId" runat="server" />
            <asp:SqlDataSource ID="dsItem" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                           SelectCommand="CRM_GetItemDetails" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="itemId" Type="Int64" />
                            </SelectParameters>
                           </asp:SqlDataSource> 

    </asp:Content>