<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.movieinfo.model.*"%>
<%@ page import="java.util.Optional"%>
<%@ page import="com.moviegenre.model.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	
MovieInfoService movieInfoService = new MovieInfoService();

java.sql.Date date_in = java.sql.Date.valueOf(request.getParameter("year_in"));
java.sql.Date date_out = java.sql.Date.valueOf(request.getParameter("year_out"));
  Optional<MovieInfoVO> op = movieInfoService
		  .getAll()
		  .stream()
		  .filter(vo -> vo.getMovie_in().after(date_in))
		  .filter(vo -> vo.getMovie_out().before(date_out))
		  .findFirst(); 
  MovieInfoVO movieinfoVO = null;
  if(op.isPresent()){
	  movieinfoVO = op.get();
  }
  pageContext.setAttribute("movieinfoVO",movieinfoVO);
  
//   	MovieInfoService movieinfoSvc = new MovieInfoService();
// 	MovieGenreService moviegenreSvc = new MovieGenreService();
// 	pageContext.setAttribute("msc",moviegenreSvc);
  
  
  
  
//   MovieGenreService moviegenreSvc = new MovieGenreService();
//   pageContext.setAttribute("msc",moviegenreSvc);
%>

<html>
<head>
		<!-- Bootstrap CSS start-->
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
		<!-- Bootstrap CSS end-->
<title>listoneMovieInfo</title>



</head>
<body bgcolor='white'>
		<h1></h1><br>
		
<!-- 工作區開始 -->

		<div class="container">
		<div class="row justify-content">
			<div class="col-1"></div>
			<div class="col-4">



<table>
	
	<p>快做完了</p>
	
</table>
			</div>
		</div>
	</div>

<!-- 工作區結束 -->
		
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
		<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS end-->
</body>
</html>