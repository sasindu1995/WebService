<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HRM.EmployeePortal.Login" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta charset="utf-8">

    <title></title>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="Content/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="Content/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="Content/style.css" rel="stylesheet" type="text/css">
<link href="Content/signin.css" rel="stylesheet" type="text/css">
<link href="Styles/signin.css" rel="stylesheet" type="text/css">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">    
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">

</head>
<body>
<div class="login-logo"></div>
<div class="login-logo-text">Service Management <b>Login</b></div>

<div class="row">
    <div class="col-md-6 login-right">

    </div>
    <div class="col-md-6 login-left">
            <form id="form1" runat="server" class="login-center">
        <!-- /navbar -->

        <div class="account-container">


            <div class="content clearfix">
                <form action="#" method="post">

                    <div>
                        <section class="container-fluid logo txt-center">
                            <img src="Images/Service - logo.png" />
                        </section>
                    </div>
                    <div class="login-fields">
                        <p class="login-welcome">
                            <asp:Label ID="lbMessage" runat="server" Text="Welcome, Please provide your details"></asp:Label>
                        </p>
                        <div class="field">
                            <label for="username">Username</label>
                            <asp:TextBox ID="txtUserName" runat="server" placeholder="Username" CssClass="login username-field" 
                                OnTextChanged="txtUserName_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <%--<input type="text" id="username" name="username" value="" placeholder="Username" class="login username-field" />--%>
                        </div>
                        <!-- /field -->

                        
                        <div class="field">
                            <label for="dxDdType">Location:</label>
                            <dx:ASPxComboBox ID="dxdDCompany" CssClass="companyCmb" runat="server" DropDownStyle="DropDownList"
                                ValueField="LocationId" Theme="Default" TextFormatString="{0}" NullText="Please Select Location">
                                <Columns>
                                    <dx:ListBoxColumn FieldName="LocationName" Width="100px" />
                                </Columns>
                            </dx:ASPxComboBox>
                            <%--		<input type="password" id="password" name="password" value="" placeholder="Password" class="login password-field"/>--%>
                        </div>
                        <div class="field">
                            <label for="password">Password:</label>
                            <asp:TextBox ID="txtpass" runat="server" placeholder="Password" CssClass="login password-field" TextMode="Password" required></asp:TextBox>
                            <%--		<input type="password" id="password" name="password" value="" placeholder="Password" class="login password-field"/>--%>
                        </div>
                        <div class="txt-forgot-password">
                            <a href="#">Forgot your password?</a>
                        </div>
            

                        <!-- /password -->

                    </div>
                    <!-- /login-fields -->

                    <div class="login-actions">

                        <%--<span class="login-checkbox">
					<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">Keep me signed in</label>
				</span>--%>
                        <asp:Button ID="btSignIn" runat="server" Text="Login" CssClass="login-btn" OnClick="btSignIn_Click" />
                    </div>
                    <!-- .actions -->
                </form>
            </div>
            <!-- /content -->
        </div>
        <!-- /account-container -->



        <div class="login-extra" style="display: none;">
            <%--<a href="Register.aspx">Registor</a>|<a href="#">Lost Password</a>--%>
        </div>
        <!-- /login-extra -->

    </form>
    </div>
</div>


    <%--<script src="js/jquery-1.7.2.min.js"></script>--%>
    <script src="Scripts/jquery-1.7.2.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>

    <script src="Scripts/signin.js"></script>
</body>
</html>