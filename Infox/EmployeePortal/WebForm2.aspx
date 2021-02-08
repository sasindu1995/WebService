<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="HRM.EmployeePortal.WebForm2" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html lang="zxx" class="shop">
<head>

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Disapamock - Login</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Responsive HTML5 Template">
    <meta name="author" content="Disapamock">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

    <!-- Web Fonts  -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="vendor/animate/animate.min.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="css/theme.css">
    <link rel="stylesheet" href="css/theme-elements.css">

    <!-- Current Page CSS -->
    <link rel="stylesheet" href="vendor/rs-plugin/css/settings.css">
    <link rel="stylesheet" href="vendor/rs-plugin/css/layers.css">
    <link rel="stylesheet" href="vendor/rs-plugin/css/navigation.css">

    <!-- Skin CSS -->
    <link rel="stylesheet" href="css/skins/default.css">

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

</head>
<body>
    <div class="body">
        <div role="main" class="main wr-login">
            <div class="container-fluid">
                <div class="row height100vh">
                    <div class="col-md-7 p-0">
                        <div class="bg-dark-5 h-100 py-5 login-bg appear-animation position-relative" data-appear-animation="fadeInRightShorter">
                            <div class="header-logo text-center mb-4 appear-animation" data-appear-animation="fadeInRightShorter">
                                <a href="index.html">
                                    <img alt="logo" height="60" src="img/logo-small-light.png">
                                </a>
                            </div>
                            <h2 class="text-color-light text-center text-6 appear-animation" data-appear-animation="fadeInRightShorter">The easiest way to show your portfolio<br /> and share with others</h2>
                            <div class="mobile-show"><a class="tp-caption slider-scroll-button" href="#login" data-hash="" data-hash-offset="0"></a></div>
                        </div>
                    </div>
                        <div class="col-md-5 p-5 height100vh-mobile" id="login">
                            <div class="h-100 d-flex align-items-center">
                                <div class="wr-registerForm appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="200">
                                    <div class="wr-login-form">
                                        <!-- Login partial layout - START -->
                                        <span class="top-sub-title text-4 font-weight-bold">Sign In</span>
                                        <h2 class="font-weight-bold text-8 mb-5">Welcome Back</h2>
                                        <form id="shopLoginRegister" action="#" method="post">
                                            <div class="alert">
                                                Invalid Username or Password
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-lg-12">
                                                    <label class="text-color-dark" for="">Username</label>
                                                    <input type="text"  runat="server" value="" class="form-control bg-light-5 border-0 rounded" name="name" id="userName" required>
                                                    <p class="text-danger" style="display:none;">Please Enter Username</p>
                                                </div>
                                                <div class="form-group col-lg-12">
                                                    <label class="text-color-dark" for="">Password</label>
                                                    <input type="password" value="" class="form-control bg-light-5 border-0 rounded" name="username" id="Password1" required>
                                                    <p class="text-danger" style="display:none;">Please Enter Password</p>
                                                </div>
                                            </div>
                                            <div class="form-row mb-3">
                                                <div class="form-group col">
                                                    <div class="form-check checkbox-custom checkbox-default">
                                                        <input class="form-check-input" type="checkbox" id="signInRemember">
                                                        <label class="form-check-label" for="signInRemember">
                                                            Remember me
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group col text-right">
                                                    <a href="#" id="headerRecover" class="forgot-pw text-color-dark d-block">Forgot password?</a>
                                                </div>
                                            </div>
                                            <div class="form-row mb-5">
                                                <div class="col-12 text-left">
                                                    <button type="submit" class="btn btn-primary btn-4 btn-fs-4 mb-2 btn-rounded btn-block">Sign In</button>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <p class="col text-center p-0">
                                                    Don't have have an account? <a href="register.html" class="text-primary">SignUp</a>
                                                </p>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- Login partial layout - END -->
                                    <!-- Password recovery - START -->
                                    <div class="recover-form" style="display:none;">
                                        <span class="top-sub-title text-4 font-weight-bold">Members</span>
                                        <h2 class="font-weight-bold text-8 mb-5">Reset my Password</h2>

                                        <ul class="nav nav-tabs nav-tabs-default registerForm-as" id="tabDefault" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="default-portfolio-tab" data-toggle="tab" href="#default-portfolio" role="tab" aria-controls="default-portfolio" aria-expanded="true">
                                                    <h4>Email</h4>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="default-process-tab" data-toggle="tab" href="#default-process" role="tab" aria-controls="default-process">
                                                    <h4>Mobile</h4>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="tabDefaultContent">
                                            <div class="tab-pane fade pt-4 pb-4 show active" id="default-portfolio" role="tabpanel" aria-labelledby="default-portfolio-tab">
                                                <form action="/" id="frmResetPassword" method="post">
                                                    <div class="form-row mb-4">
                                                        <div class="form-group col mb-2">
                                                            <input type="email" value="" maxlength="100" class="form-control bg-light-5 border-0 rounded" name="email" id="resetPasswordEmail" placeholder="E-mail" required>
                                                        </div>
                                                    </div>
                                                    <div class="row align-items-center">
                                                        <div class="col">
                                                            <a href="#" id="headerRecoverCancel" class="text-color-primary pl-0">Have an account?</a>
                                                        </div>
                                                        <div class="col text-right">
                                                            <button type="submit" class="btn btn-primary btn-4 btn-fs-4 mb-2 btn-rounded btn-block">Submit</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="tab-pane fade pt-4 pb-4" id="default-process" role="tabpanel" aria-labelledby="default-process-tab">
                                                <form action="/" id="Form1" method="post">
                                                    <div class="form-row mb-4">
                                                        <div class="form-group col mb-2">
                                                            <input type="number" value="" maxlength="100" class="form-control bg-light-5 border-0 rounded" id="Number1" placeholder="Mobile Number" required>
                                                        </div>
                                                    </div>
                                                    <div class="row align-items-center">
                                                        <div class="col">
                                                            <a href="#" id="A1" class="text-color-primary pl-0">Have an account?</a>
                                                        </div>
                                                        <div class="col text-right">
                                                            <button type="submit" class="btn btn-primary btn-4 btn-fs-4 mb-2 btn-rounded btn-block">Submit</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                        
                                    </div><!-- Password recovery - END -->


                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>

    <!-- Vendor -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/jquery.appear/jquery.appear.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="vendor/common/common.min.js"></script>
    <script src="vendor/jquery.gmap/jquery.gmap.min.js"></script>

    <!-- Theme Base, Components and Settings -->
    <script src="js/theme.js"></script>

    <!-- Current Page Vendor and Views -->
    <script src="vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
    <script src="vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

    <!-- Theme Initialization Files -->
    <script src="js/theme.init.js"></script>

</body>
</html>
