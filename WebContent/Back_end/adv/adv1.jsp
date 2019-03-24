<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adv.model.*"%>
<%@ page import="java.util.*"%>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	AdvVO advVO = (AdvVO) request.getAttribute("advVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<!doctype html>
<html lang="en">
<head>

<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS start-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Bootstrap CSS end-->



<title>JOIN廣告</title>
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets1/css/main.css" />







</head>
<body bgcolor='white' >

<jsp:include page="/BackHeaderFooter/Header.jsp" />










<!-- Header -->
			<header id="header">
				<div class="logo"><a href="#">${advVO.ad_name} 
				<br><br>
				<div>
				<font size="10px">活動期間: ${advVO.getAd_start().toString().substring(0,10)} ~ ${advVO.getAd_end().toString().substring(0,10)}</font>
				 </div>
<!-- 				<span>by TEMPLATED</span> -->
				</a></div>
			</header>

		<!-- Main -->
			<section id="main">
				<div class="inner">

				<!-- One -->
					<section id="one" class="wrapper style1">

						<div class="image fit flush">
<!-- 							<img src="images/pic02.jpg" alt="" /> -->
							<img id='${advVO.ad_no}' src='<%=request.getContextPath()%>/Front_end/adv/adv.do?ad_no=${advVO.ad_no}'  height='600'/>


						</div>
<!-- 						<header class="special"> -->
<%-- 						<h2>活動期間: ${advVO.getAd_start().toString().substring(0,10)} ~ ${advVO.getAd_end().toString().substring(0,10)}</h2> --%>
<!-- 							<h2>Fringilla Fermentum Tellus</h2> -->
<!-- 							<p>vehicula urna sed justo bibendum</p> -->
<!-- 						</header> -->
						<div class="content">
						
							 <div id="messagesArea" class="panel message-area"  ></div> 
						
						
<!-- 							<p>Curabitur eget semper ante. Morbi eleifend ultricies est, a blandit diam vehicula vel. Vestibulum porttitor nisi quis viverra hendrerit. Suspendisse vel volutpat nibh, vel elementum lacus. Maecenas commodo pulvinar dui, at cursus metus imperdiet vel. Vestibulum et efficitur urna. Duis velit nulla, interdum sed felis sit amet, facilisis auctor nunc. Cras luctus urna at risus feugiat scelerisque nec sed diam. </p> -->
<!-- 							<p>Nunc fringilla metus odio, at rutrum augue tristique vel. Nulla ac tellus a neque ullamcorper porta a vitae ipsum. Morbi est sapien, hendrerit quis mi in, aliquam bibendum orci. Vestibulum imperdiet nibh vitae maximus posuere. Aenean sit amet nibh feugiat, condimentum tellus eu, malesuada nunc. Mauris ac pulvinar turpis, sit amet pharetra est. Ut bibendum justo condimentum, vehicula ex vel, venenatis libero. Etiam vehicula urna sed justo bibendum, ac lacinia nunc pulvinar. Integer nec velit orci. Vestibulum pellentesque varius dapibus. Morbi ullamcorper augue est, sed luctus orci fermentum dictum. Nunc tincidunt, nisl consequat convallis viverra, metus nisl ultricies dui, vitae dapibus ligula urna sit amet nibh. Duis ut venenatis enim.</p> -->
								
						</div>
					</section>

				


		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
					</ul>
				</div>
				<div class="copyright">
					&copy; Untitled. All rights reserved. Images <a href="https://unsplash.com">Unsplash</a> Design <a href="https://templated.co">TEMPLATED</a>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets1/js/jquery.min.js"></script>
			<script src="assets1/js/jquery.poptrox.min.js"></script>
			<script src="assets1/js/skel.min.js"></script>
			<script src="assets1/js/util.js"></script>
			<script src="assets1/js/main.js"></script>







	
	



	<!-- 工作區結束 -->
	
	<jsp:include page="/BackHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->


</body>


<script>

// 	alert("!");
	var ad_cont = '<%= (advVO.getAd_cont()==null)? "" : advVO.getAd_cont()%>';
// 	alert(ad_cont);
	
	messagesArea.innerHTML = messagesArea.innerHTML + ad_cont;
	

</script>

</html>



