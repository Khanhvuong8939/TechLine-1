<%-- 
    Document   : index
    Created on : Dec 16, 2017, 10:46:32 AM
    Author     : Tien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">      
        <link href="resource/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

        <link href="resource/themes/css/bootstrappage.css" rel="stylesheet"/>

        <!-- global styles -->
        <link href="resource/themes/css/flexslider.css" rel="stylesheet"/>
        <link href="resource/themes/css/main.css" rel="stylesheet"/>

        <!-- scripts -->
        <script src="resource/themes/js/jquery-1.7.2.min.js"></script>
        <script src="resource/bootstrap/js/bootstrap.min.js"></script>				
        <script src="resource/themes/js/superfish.js"></script>	
        <script src="resource/themes/js/jquery.scrolltotop.js"></script>
        <script src="resource/themes/js/login-register.js" type="text/javascript"></script>

    </head>
    <body>		
        <div id="top-bar" class="container">
            <div class="row">
                <div class="span4">
                    <form method="POST" class="search_form">
                        <input type="text" class="input-block-level search-query" Placeholder="eg. Sony">
                    </form>
                </div>
                <div class="span8">
                    <div class="account pull-right">
                        <ul class="user-menu">	
                            <li><a class="btn" href="admin/home.jsp">Go Admin Page</a></li>
                            <%
                                if (session.getAttribute("user") == null) {
                            %>
                            <li><a class="btn" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">Log in</a></li>
                                <%
                                    }
                                %>
                                <%
                                    if (session.getAttribute("user") != null) {
                                %>
                            <a href="${role=="admin"?"admin/indexadmin.jsp":"AccountServlet?action=accountDetail"}">Xin chào, <%= session.getAttribute("user")%></a></li>                                                              
                            <li><a class="btn" href="AccountServlet?action=Logout">Log out</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--Phần dialog box Login-->
        <div class="modal fade login" id="loginModal">
            <div class="modal-dialog login animated">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Login with</h4>
                    </div>
                    <div class="modal-body">  
                        <div class="box">
                            <div class="content">
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form method="post" action="AccountServlet">
                                        <input id="username" class="input-xlarge" pattern="[A-Za-z0-9@a-z.com]{2,30}" type="text" name="username" required="true"><br/>
                                        <input id="password" class="input-xlarge" pattern="[A-Za-z0-9]{2,30}" type="password"  name="password" required="true"><br/>
                                        <input class="btn btn-inverse" style="width:285px;" type="submit" name="action" value="Login" onclick="checkLogin();">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="content registerBox" style="display:none;">
                                <div class="form">
                                    <form method="post" action="register.html">
                                        <b style="color: red;" id="note1"></b>
                                        <input id="email" class="form-control" type="text" placeholder="Username" name="username" onBlur="checkEmail()" required="true"><br/>
                                        <b style="color: red;" id="note2"></b>
                                        <input id="Regispassword" class="form-control" pattern="[A-Za-z0-9]{6,20}" type="password" placeholder="Password" name="password" required="true"><br/>
                                        <input id="Regispassword_confirmation" class="form-control" pattern="[A-Za-z0-9]{6,20}" type="password" placeholder="Repeat Password" name="password_confirmation" required="true" onBlur="checkPass()"><br/>
                                        <input class="btn btn-default btn-register" id="btnRegister" value="Create account" name="action" type="submit">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                            <span>Looking to 
                                <a href="javascript: showRegisterForm();">Đăng Ký</a>
                                ?</span>
                        </div>
                        <div class="forgot register-footer" style="display:none">
                            <span>Already have an account?</span>
                            <a href="javascript: showLoginForm();">Login</a>
                        </div>
                    </div>        
                </div>
            </div>
        </div>
        <!--Kết thúc dialog box Login-->
        <div id="wrapper" class="container">
            <section class="navbar main-menu">
                <div class="navbar-inner main-menu">				
                    <a href="index.html" class="logo pull-left"><img src="resource/themes/images/logo.png" class="site_logo" alt=""></a>
                    <nav id="menu" class="pull-right">
                        <ul>
                            <li><a href="categoryDetail.jsp">Woman</a>					
                                <ul>
                                    <li><a href="typeDetail.jsp">Lacinia nibh</a></li>									
                                    <li><a href="typeDetail.jsp">Eget molestie</a></li>
                                    <li><a href="typeDetail.jsp">Varius purus</a></li>									
                                </ul>
                            </li>															
                            <li><a href="categoryDetail.jsp">Man</a></li>			
                            <li><a href="categoryDetail.jsp">Sport</a>
                                <ul>									
                                    <li><a href="typeDetail.jsp">Gifts and Tech</a></li>
                                    <li><a href="typeDetail.jsp">Ties and Hats</a></li>
                                    <li><a href="typeDetail.jsp">Cold Weather</a></li>
                                </ul>
                            </li>							
                            <li><a href="categoryDetail.jsp">Hangbag</a></li>
                            <li><a href="categoryDetail.jsp">Best Seller</a></li>
                            <li><a href="categoryDetail.jsp">Top Seller</a></li>
                        </ul>
                    </nav>
                </div>
            </section>
            <section  class="homepage-slider" id="home-slider">
                <div class="flexslider">
                    <ul class="slides">
                        <li>
                            <img src="resource/themes/images/carousel/banner-1.jpg" alt="" />
                        </li>
                        <li>
                            <img src="resource/themes/images/carousel/banner-2.jpg" alt="" />
                            <div class="intro">
                                <h1>Mid season sale</h1>
                                <p><span>Up to 50% Off</span></p>
                                <p><span>On selected items online and in stores</span></p>
                            </div>
                        </li>
                    </ul>
                </div>			
            </section>
            <section class="header_text">
                We stand for top quality templates. Our genuine developers always optimized bootstrap commercial templates. 
                <br/>Don't miss to use our cheap abd best bootstrap templates.
            </section>
            <section class="main-content">
                <div class="row">
                    <div class="span12">													
                        <div class="row">
                            <div class="span12">
                                <h4 class="title">
                                    <span class="pull-left"><span class="text"><span class="line">News <strong>Products</strong></span></span></span>
                                    <span class="pull-right">
                                        <a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
                                    </span>
                                </h4>
                                <div id="myCarousel" class="myCarousel carousel slide">
                                    <div class="carousel-inner">
                                        <div class="active item">
                                            <ul class="thumbnails">												
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <span class="sale_tag"></span>
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/ladies/1.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Ut wisi enim ad</a><br/>
                                                        <a href="products.html" class="category">Commodo consequat</a>
                                                        <p class="price">$17.25</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <span class="sale_tag"></span>
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/ladies/2.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Quis nostrud exerci tation</a><br/>
                                                        <a href="products.html" class="category">Quis nostrud</a>
                                                        <p class="price">$32.50</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/ladies/3.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Know exactly turned</a><br/>
                                                        <a href="products.html" class="category">Quis nostrud</a>
                                                        <p class="price">$14.20</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/ladies/4.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">You think fast</a><br/>
                                                        <a href="products.html" class="category">World once</a>
                                                        <p class="price">$31.45</p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item">
                                            <ul class="thumbnails">
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/ladies/5.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Know exactly</a><br/>
                                                        <a href="products.html" class="category">Quis nostrud</a>
                                                        <p class="price">$22.30</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/ladies/6.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Ut wisi enim ad</a><br/>
                                                        <a href="products.html" class="category">Commodo consequat</a>
                                                        <p class="price">$40.25</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/ladies/7.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">You think water</a><br/>
                                                        <a href="products.html" class="category">World once</a>
                                                        <p class="price">$10.45</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/ladies/8.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Quis nostrud exerci</a><br/>
                                                        <a href="products.html" class="category">Quis nostrud</a>
                                                        <p class="price">$35.50</p>
                                                    </div>
                                                </li>																																	
                                            </ul>
                                        </div>
                                    </div>							
                                </div>
                            </div>						
                        </div>
                        <br/>
                        <div class="row">
                            <div class="span12">
                                <h4 class="title">
                                    <span class="pull-left"><span class="text"><span class="line">Discount <strong>Products</strong></span></span></span>
                                    <span class="pull-right">
                                        <a class="left button" href="#myCarousel-2" data-slide="prev"></a><a class="right button" href="#myCarousel-2" data-slide="next"></a>
                                    </span>
                                </h4>
                                <div id="myCarousel-2" class="myCarousel carousel slide">
                                    <div class="carousel-inner">
                                        <div class="active item">
                                            <ul class="thumbnails">												
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <span class="sale_tag"></span>
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/cloth/bootstrap-women-ware2.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Ut wisi enim ad</a><br/>
                                                        <a href="products.html" class="category">Commodo consequat</a>
                                                        <p class="price">$25.50</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/cloth/bootstrap-women-ware1.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Quis nostrud exerci tation</a><br/>
                                                        <a href="products.html" class="category">Quis nostrud</a>
                                                        <p class="price">$17.55</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/cloth/bootstrap-women-ware6.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Know exactly turned</a><br/>
                                                        <a href="products.html" class="category">Quis nostrud</a>
                                                        <p class="price">$25.30</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/cloth/bootstrap-women-ware5.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">You think fast</a><br/>
                                                        <a href="products.html" class="category">World once</a>
                                                        <p class="price">$25.60</p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item">
                                            <ul class="thumbnails">
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/cloth/bootstrap-women-ware4.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Know exactly</a><br/>
                                                        <a href="products.html" class="category">Quis nostrud</a>
                                                        <p class="price">$45.50</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/cloth/bootstrap-women-ware3.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Ut wisi enim ad</a><br/>
                                                        <a href="products.html" class="category">Commodo consequat</a>
                                                        <p class="price">$33.50</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/cloth/bootstrap-women-ware2.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">You think water</a><br/>
                                                        <a href="products.html" class="category">World once</a>
                                                        <p class="price">$45.30</p>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="product-box">
                                                        <p><a href="productDetail.jsp"><img src="resource/themes/images/cloth/bootstrap-women-ware1.jpg" alt="" /></a></p>
                                                        <a href="productDetail.jsp" class="title">Quis nostrud exerci</a><br/>
                                                        <a href="products.html" class="category">Quis nostrud</a>
                                                        <p class="price">$25.20</p>
                                                    </div>
                                                </li>																																	
                                            </ul>
                                        </div>
                                    </div>							
                                </div>
                            </div>						
                        </div>
                        <div class="row feature_box">						
                            <div class="span4">
                                <div class="service">
                                    <div class="responsive">	
                                        <img src="resource/themes/images/feature_img_2.png" alt="" />
                                        <h4>MODERN <strong>DESIGN</strong></h4>
                                        <p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>									
                                    </div>
                                </div>
                            </div>
                            <div class="span4">	
                                <div class="service">
                                    <div class="customize">			
                                        <img src="resource/themes/images/feature_img_1.png" alt="" />
                                        <h4>FREE <strong>SHIPPING</strong></h4>
                                        <p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="span4">
                                <div class="service">
                                    <div class="support">	
                                        <img src="resource/themes/images/feature_img_3.png" alt="" />
                                        <h4>24/7 LIVE <strong>SUPPORT</strong></h4>
                                        <p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
                                    </div>
                                </div>
                            </div>	
                        </div>		
                    </div>				
                </div>
            </section>
            <section class="our_client">
                <h4 class="title"><span class="text">Manufactures</span></h4>
                <div class="row">					
                    <div class="span2">
                        <a href="#"><img alt="" src="resource/themes/images/clients/14.png"></a>
                    </div>
                    <div class="span2">
                        <a href="#"><img alt="" src="resource/themes/images/clients/35.png"></a>
                    </div>
                    <div class="span2">
                        <a href="#"><img alt="" src="resource/themes/images/clients/1.png"></a>
                    </div>
                    <div class="span2">
                        <a href="#"><img alt="" src="resource/themes/images/clients/2.png"></a>
                    </div>
                    <div class="span2">
                        <a href="#"><img alt="" src="resource/themes/images/clients/3.png"></a>
                    </div>
                    <div class="span2">
                        <a href="#"><img alt="" src="resource/themes/images/clients/4.png"></a>
                    </div>
                </div>
            </section>
            <section id="footer-bar">
                <div class="row">
                    <div class="span3">
                        <h4>Navigation</h4>
                        <ul class="nav">
                            <li><a href="./index.html">Homepage</a></li>  
                            <li><a href="./about.html">About Us</a></li>
                            <li><a href="./contact.html">Contac Us</a></li>
                            <li><a href="./cart.html">Your Cart</a></li>
                            <li><a href="./register.html">Login</a></li>							
                        </ul>					
                    </div>
                    <div class="span4">
                        <h4>My Account</h4>
                        <ul class="nav">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Order History</a></li>
                            <li><a href="#">Wish List</a></li>
                            <li><a href="#">Newsletter</a></li>
                        </ul>
                    </div>
                    <div class="span5">
                        <p class="logo"><img src="resource/themes/images/logo.png" class="site_logo" alt=""></p>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the  Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
                        <br/>
                        <span class="social_icons">
                            <a class="facebook" href="#">Facebook</a>
                            <a class="twitter" href="#">Twitter</a>
                            <a class="skype" href="#">Skype</a>
                            <a class="vimeo" href="#">Vimeo</a>
                        </span>
                    </div>					
                </div>	
            </section>
            <section id="copyright">
                <span>Copyright 2013 bootstrappage template  All right reserved.</span>
            </section>
        </div>
        <script src="resource/themes/js/common.js"></script>
        <script src="resource/themes/js/jquery.flexslider-min.js"></script>
        <script type="text/javascript">
                                            $(function() {
                                                $(document).ready(function() {
                                                    $('.flexslider').flexslider({
                                                        animation: "fade",
                                                        slideshowSpeed: 4000,
                                                        animationSpeed: 600,
                                                        controlNav: false,
                                                        directionNav: true,
                                                        controlsContainer: ".flex-container" // the container that holds the flexslider
                                                    });
                                                });
                                            });
        </script>
    </body>
</html>
