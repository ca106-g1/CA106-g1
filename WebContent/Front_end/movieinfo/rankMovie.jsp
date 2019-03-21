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

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
  img, #level{
  	width:50px;
  	hight:50px;
  }
  
  img, #pic{
  	width:135px;
  	hight:200px;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>
<jsp:include page="/FrontHeaderFooter/Header.jsp" />
		<h1></h1><br>
		
<!-- 工作區開始 -->

		<div class="container">
		<div class="row justify-content">
			<div class="col-1"></div>
			<div class="col-4">

<table id="table-1">
	<tr><td>
		 <h3>電影簡介</h3>
		 <h4><a href="<%=request.getContextPath()%>/Front_end/Home.jsp"><img src="<%=request.getContextPath()%>/Back_end/movieinfo/images/eatPopcorn.gif" width="125" height="72" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>電影封面</th>
		<th>電影名稱</th>
		<th>電影種類</th>
		<th>電影分級</th>
		<th>電影導演</th>
		<th>電影演員</th>
		<th>電影片長</th>
	</tr>
	
	<tr>
			<!-- 新增movie_pic			 -->
			<c:set var="movie_pic" value="${movieinfoVO.movie_pic}"></c:set>
			<%
				byte b[]= (byte[])pageContext.getAttribute("movie_pic");
				String encode = null;
				if(b != null){
					encode = Base64.encode(b);
			%>
			<td><img id="pic" src="data:image/jpg;base64,<%=encode%>"></td>
			<%}else{%><td></td><%}%>
			
			<td>${movieinfoVO.movie_name}</td>
			

<!-- 新增movie_level -->			
			<c:set var="movie_level" value="${movieinfoVO.movie_level}"></c:set>
			<%
				byte c[]= (byte[])pageContext.getAttribute("movie_level");
				String encode1 = null;
				if(c != null){
					encode1 = Base64.encode(c);
			%>
			<td><img id="level" src="data:image/jpg;base64,<%=encode1%>"></td>
			<%}else{%><td></td><%}%>
			<td>${movieinfoVO.movie_director}</td>
			<td>${movieinfoVO.movie_cast}</td> 
			<td>${movieinfoVO.movie_length}</td>
	</tr>
</table>
			</div>
		</div>
	</div>

<!-- 工作區結束 -->
		
		<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
		<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS end-->
</body>
</html>