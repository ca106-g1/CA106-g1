<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.sessions.model.*"%>
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
<title>瀏覽場次</title>
</head>
<body>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1>瀏覽場次</h1>

	<!-- 工作區開始 -->
	
	<%
	
	List<SessionsVO> list;
	
	if("all".equals(request.getParameter("action"))){
		list = (List<SessionsVO>)application.getAttribute("sessionList_all");
	}else{
		list = (List<SessionsVO>)application.getAttribute("sessionList_effect");
	}
	
	pageContext.setAttribute("list", list);
	
	%>
	
	
	
<table>
	<tr>
	<th>場次編號</th>
	<th>電影編號</th>
	<th>廳院編號</th>
	<th>開始時間</th>
	<th>剩餘座位數量</th>
	<th>查看座位</th>
	<th>刪除場次</th>
	</tr>
<c:forEach var="sessionsVO" items="${list}">

<tr>

	<td>${sessionsVO.sessions_no}</td>
	<td>${sessionsVO.movie_no}</td>
	<td>${sessionsVO.cinema_no}</td>
	<td>${sessionsVO.sessions_start}</td>
	<td>${sessionsVO.sessions_remaining}</td>
	<td><a class = "btn btn-primary" href="<%=request.getContextPath()%>/Back_end/cinema/updateCinema.jsp?cinema_no=${cinemaVO.cinema_no}">設定</a></td>
	
</tr>
</c:forEach>
	</table>


	<!-- 工作區結束 -->
	
	<jsp:include page="/BackHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>