<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@ page import="com.movieinfo.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<head>
	<%
		MovieInfoService movieinfosvc = new MovieInfoService();
		List<MovieInfoVO> lista = movieinfosvc.getAll();
	    List<MovieInfoVO> list = new ArrayList<MovieInfoVO>();
	    java.util.Date now = new java.util.Date();
	    java.sql.Date sqlDate = new java.sql.Date(now.getTime());
	    for(MovieInfoVO movVO:lista){
	    	if(sqlDate.after(movVO.getMovie_in()) && sqlDate.before(movVO.getMovie_out())){
	    		list.add(movVO);
	    	}
	    }
	    pageContext.setAttribute("list",list);
	    System.out.print(list.size());
	
	%>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>揪影-揪團看電影</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">
    <style>
    	.moviein_pic{
    		width:300px;
    		height:500px;
    	}
    </style>

</head>

<body>
    <!-- Preloader Start -->
    <div id="preloader">
        <div class="yummy-load"></div>
    </div>

    <!-- Background Pattern Swither -->
    <div id="pattern-switcher">
        Join Us!!
    </div>
    <div id="patter-close">
        <i class="fa fa-times" aria-hidden="true"></i>
    </div>

    <!-- ****** Top Header Area Start ****** -->
    <div class="top_header_area">
        <div class="container">
            <div class="row">
                <div class="col-5 col-sm-6">
                    <!--  Top Social bar start -->
                    <div class="top_social_bar">
                        <a href="https://www.facebook.com/profile.php?id=100000279160092"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                    </div>
                </div>
                <!--  Login Register Area -->
                <div class="col-7 col-sm-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">
                            <div class="login" >
                                <a href="#">Sign in</a>
                            </div>
                            <div class="register">
                                <a href="#">Sign up</a>
                            </div>
                        </div>
                        <!-- Search Button Area -->
<!--                         <div class="search_button"> -->
<!--                             <a class="searchBtn" href="#"><i class="fa fa-search" aria-hidden="true"></i></a> -->
<!--                         </div> -->
                        <!-- Search Form -->
<!--                         <div class="search-hidden-form"> -->
<!--                             <form action="#" method="get"> -->
<!--                                 <input type="search" name="search" id="search-anything" placeholder="Search Anything..."> -->
<!--                                 <input type="submit" value="" class="d-none"> -->
<!--                                 <span class="searchBtn"><i class="fa fa-times" aria-hidden="true"></i></span> -->
<!--                             </form> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Top Header Area End ****** -->

    <!-- ****** Header Area Start ****** -->
    <header class="header_area">
        <div class="container">
            <div class="row">
                <!-- Logo Area Start -->
                <div class="col-12">
                    <div class="logo_area text-center">
                        <a href="<%=request.getContextPath()%>/Front_end/Home/Home.jsp" class="yummy-logo">Join Theater</a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-nav" aria-controls="yummyfood-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i> Menu</button>
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="yummyfood-nav">
                            <ul class="navbar-nav" id="yummy-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/Front_end/Home/Home.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Movie Info</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/movieinfo/upComingListAll.jsp">Soon Be On</a>
                                        <a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/movieinfo/listAllMovieInfo.jsp">In Theaters</a>
                                        <a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/movieinfo/rankMovieList.jsp">Top Ten</a>
                                    </div>
                                </li>
					<!--電影資訊 -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Buy Tickets</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="#">Special Offer</a>
                                        <a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/ticketorder_/prompt.jsp">Ticket Info</a>
                                        <a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/ticketorder_/choiseSessions.jsp">Buy Tickets</a>
                                    </div>
                                </li>
        			<!--訂票功能 -->
                                <li class="nav-item">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/Front_end/newsinfo/listAllNewsInfo.jsp">Movie News</a>
                                </li>
					<!--影視新聞 -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Member</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/mem/member_regestinfomation.jsp">Sign Up</a>
                                        <a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/mem/member_regestinfomation2.jsp">Member Notice</a>
                                    </div>
                                </li>
 					<!--會員功能 -->
                                <li class="nav-item">
                                    <a class="nav-link" href="#">About</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ****** Header Area End ****** -->

    <!-- ****** Welcome Post Area Start ****** -->
    <section class="welcome-post-sliders owl-carousel">

		<c:forEach var="movieinfoVO" items="${list}">
			
	        <!-- Single Slide -->
	        <div class="welcome-single-slide">
	            <!-- Post Thumb -->
	            <c:set var="mimg" value="${movieinfoVO.movie_pic}" />
	            <%
	            	byte b[] = (byte[])pageContext.getAttribute("mimg");
	            	String movie_pic = Base64.encode(b);
	            %>
	            <a href="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do?action=getOne_For_Display_Front&movie_no=${movieinfoVO.movie_no}"><img class="moviein_pic" src="data:image/jpg;base64,<%=movie_pic%>"></a>
	            <!-- Overlay Text -->
	            <div class="project_title">
	                <div class="post-date-commnents d-flex">
	                    <a href="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do?action=getOne_For_Display_Front&movie_no=${movieinfoVO.movie_no}">${movieinfoVO.movie_in}</a>
	                </div>
	                <a href="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do?action=getOne_For_Display_Front&movie_no=${movieinfoVO.movie_no}">
	                    <h5>${movieinfoVO.movie_name}</h5>
	                </a>
	            </div>
	        </div>	

		</c:forEach>
        

    </section>
    <!-- ****** Welcome Area End ****** -->

    <!-- ****** Categories Area Start ****** -->
    <section class="categories_area clearfix" id="about">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory wow fadeInUp" data-wow-delay=".3s">
                        <img src="img/catagory-img/.png" alt="">
                        <div class="catagory-title">
                            <a href="<%=request.getContextPath()%>/Front_end/movieinfo/listAllMovieInfo.jsp">
                                <h5>Movie Info</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory wow fadeInUp" data-wow-delay=".6s">
                        <img src="img/catagory-img/.jpg" alt="" >
                        <div class="catagory-title">
                            <a href="<%=request.getContextPath()%>/Front_end/ticketorder_/choiseSessions.jsp">
                                <h5>Showtimes</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory wow fadeInUp" data-wow-delay=".9s">
                        <img src="img/catagory-img/.png" alt="">
                        <div class="catagory-title">
                            <a href="<%=request.getContextPath()%>/Front_end/newsinfo/listAllNewsInfo.jsp">
                                <h5>Movie News</h5>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ****** Categories Area End ****** -->

    
    <!-- ****** Instagram Area Start ****** -->
    <div class="instargram_area owl-carousel section_padding_100_0 clearfix" id="portfolio">

        <!-- Instagram Item -->
        <div class="instagram_gallery_item">
            <!-- Instagram Thumb -->
            <img src="img/instagram-img/1.jpg" alt="">
            <!-- Hover -->
            <div class="hover_overlay">
                <div class="yummy-table">
                    <div class="yummy-table-cell">
                        <div class="follow-me text-center">
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Follow me</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- ****** Our Creative Portfolio Area End ****** -->

    <!-- ****** Footer Social Icon Area Start ****** -->
    <div class="social_icon_area clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="footer-social-area d-flex">
                        <div class="single-icon">
                            <a href="https://www.facebook.com/profile.php?id=100000279160092"><i class="fa fa-facebook" aria-hidden="true"></i><span>facebook</span></a>
                        </div>
                        <div class="single-icon">
                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i><span>Twitter</span></a>
                        </div>
                        <div class="single-icon">
                            <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i><span>GOOGLE+</span></a>
                        </div>
                        <div class="single-icon">
                            <a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i><span>linkedin</span></a>
                        </div>
                        <div class="single-icon">
                            <a href="https://www.instagram.com/illilliili/"><i class="fa fa-instagram" aria-hidden="true"></i><span>Instagram</span></a>
                        </div>
                        <div class="single-icon">
                            <a href="#"><i class="fa fa-vimeo" aria-hidden="true"></i><span>VIMEO</span></a>
                        </div>
                        <div class="single-icon">
                            <a href="https://www.youtube.com/channel/UClhecf7eOGHwbKW5e7l_pTA"><i class="fa fa-youtube-play" aria-hidden="true"></i><span>YOUTUBE</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Footer Social Icon Area End ****** -->

    <!-- ****** Footer Menu Area Start ****** -->
    <footer class="footer_area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="footer-content">
                        <!-- Logo Area Start -->
                        <div class="footer-logo-area text-center">
                            <a href="<%=request.getContextPath()%>/Front_end/Home/Home.jsp" class="yummy-logo">Join Theater</a>
                        </div>
                        <!-- Menu Area Start -->
                        <nav class="navbar navbar-expand-lg">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-footer-nav" aria-controls="yummyfood-footer-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i> Menu</button>
                            <!-- Menu Area Start -->
                            <div class="collapse navbar-collapse justify-content-center" id="yummyfood-footer-nav">
                                <ul class="navbar-nav">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="<%=request.getContextPath()%>/Front_end/Home/Home.jsp">Home <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Features</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Categories</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Archive</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Contact</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Copywrite Text -->
                    <div class="copy_right_text text-center">
                        <p>Copyright @2019 All rights reserved | This web is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="#" target="_blank">CA106-G1</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- ****** Footer Menu Area End ****** -->

    <!-- Jquery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins JS -->
    <script src="js/others/plugins.js"></script>
    <!-- Active JS -->
    <script src="js/active.js"></script>
</body>

</html>