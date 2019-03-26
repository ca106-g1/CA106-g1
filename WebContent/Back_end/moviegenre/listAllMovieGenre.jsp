<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.moviegenre.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    MovieGenreService moviegenreSvc = new MovieGenreService();
    List<MovieGenreVO> list = moviegenreSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
	<head>
	
		<!-- Bootstrap CSS start-->
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
		<!-- Bootstrap CSS end-->
		
		<title>listAllMovieGenre</title>
		
		<style>
		  table#table-1 {
			background-color: #00caca;
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
		  
		  table {
			width: 800px;
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
	
		<jsp:include page="/BackHeaderFooter/Header.jsp" />
		
		<!-- 工作區開始 -->

	<div class="container">
		<div class="row justify-content">
			<div class="col-12">
<!-- BT -->

<div class="card">
	<div class="card-header">
		<h4>電影種類瀏覽</h4>
	</div>
	<div class="card-body">
		<div class="table-responsive">
		<%@ include file="page1.file" %> 
			<table class="table table-striped mb-0">
				<tr>
					<th>電影種類編號</th>
					<th>電影種類名稱</th>
					<th colspan="2">編輯</th>
				</tr>
				
				<c:forEach var="MovieGenreVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				
				<tr>
					<td>${MovieGenreVO.genre_no}</td>
					<td>${MovieGenreVO.genre_name}</td>
					
					<td>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_end/moviegenre/moviegenre.do" style="margin-bottom: 0px;">
					     <button type="submit" class="btn btn-primary">修改</button>
<!-- 					     <input type="submit" value="修改"> -->
					     <input type="hidden" name="genre_no"  value="${MovieGenreVO.genre_no}">
					     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
					</td>
					
					<td>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_end/moviegenre/moviegenre.do" style="margin-bottom: 0px;">
					     <button type="submit" class="btn btn-danger">刪除</button>
<!-- 					     <input type="submit" value="刪除"> -->
					     <input type="hidden" name="genre_no"  value="${MovieGenreVO.genre_no}">
					     <input type="hidden" name="action" value="delete"></FORM>
					</td>
				</tr>
			</c:forEach>
			</table>
			<%@ include file="page2.file" %>
		</div>
	</div>
</div>
</div>
</div>
</div>


<!-- 工作區結束 -->
		
		<jsp:include page="/BackHeaderFooter/Footer.jsp" />
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
		<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS end-->
	</body>
</html>