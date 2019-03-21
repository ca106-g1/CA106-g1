<%@page import="com.movieinfo.model.MovieInfoVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.sessions.model.*"%>
<%@ page import="com.cinema.model.*"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS start-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Bootstrap CSS end-->
<title>瀏覽場次</title>
<style>
table {
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 2px;
	text-align: center;
	hight: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1>瀏覽場次</h1>

	<!-- 工作區開始 -->

	<jsp:useBean id="sessionsSvc" scope="page" class="com.sessions.model.SessionsService" />
	<jsp:useBean id="movieInfoSvc" scope="page"	class="com.movieinfo.model.MovieInfoService" />
	<jsp:useBean id="cinemaSvc" class="com.cinema.model.CinemaService" scope="page" />

	<%
		List<SessionsVO> list;

		if ("all".equals(request.getParameter("action"))) {

			list = sessionsSvc.getAll();

		} else {
			list = new ArrayList<SessionsVO>();

			long time = System.currentTimeMillis();

			sessionsSvc.getAll().stream().filter(sessionsVO -> sessionsVO.getSessions_start().getTime() > time)
					.forEach(sessionsVO -> list.add(sessionsVO));

		}

		pageContext.setAttribute("list", list);
	%>


	<div class="container-fluid">
		<div class="row justify-content">
			<div class="col-6">
					<table>
						<tr>
							<th>場次編號</th>
							<th style="width: 160px;">電影名稱</th>
							<th style="width: 80px;">廳院名稱</th>
							<th style="width: 120px;">開始時間</th>
							<th style="width: 80px;">剩餘座位</th>
							<th style="width: 80px;">查看座位</th>
						</tr>
						<%@ include file="/File/page1.file"%>
						<c:forEach var="sessionsVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">

							<tr>

								<td>${sessionsVO.sessions_no}</td>
								<td>${movieInfoSvc.getOneMovieInfo(sessionsVO.movie_no).movie_name }</td>
								<td>${cinemaSvc.getOneCin(sessionsVO.cinema_no).cinema_name}</td>
								<td>${sessionsVO.sessions_start.toString().substring(0,16)}</td>
								<td>${sessionsVO.sessions_remaining}</td>
								<td><div class="btn btn-primary aabb" data-sessions_no="${sessionsVO.sessions_no}">查看</div></td>

							</tr>

						</c:forEach>
					</table>
					<%@ include file="/File/page2.file"%>
			</div>
			<div class="col-6">
				<div style="height:50px">
				</div>
				<iframe id="iframe" src="<%=request.getContextPath()%>/Back_end/sessions/checkOneSessions.jsp?sessions_no=SESSIONS00000017" style="width: 800px; border-width: 0px; height:450px">
				</iframe>
				<nav class="row justify-content">
					<div class="col-12">
						<c:forEach var="var" items="${statusOfSitList}">
								${var.str}
								<div 
									class="btn disabled "
									data-sitType = "${var.type}"
									data-sitStr = "${var.str}"
									id = "type${var.type}"
									style="background-color:${var.coller}; border-color:#000; margin-right:10px">
								</div>
						</c:forEach>
					</div>
				</nav>
			</div>
		</div>
	</div>
	
	
	<!-- 工作區結束 -->

	<jsp:include page="/BackHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js" ></script>
		
		
		<!-- js開始 -->
	<script>
	
	$(document).ready(init);
	function init(){
		$('.aabb').click(function(e){
			var sessions_no = $(this).attr('data-sessions_no');
			var lastIndex = $('#iframe').attr('src').lastIndexOf('=');
			var src = $('#iframe').attr('src').substring(0,lastIndex+1) + sessions_no;
			$('#iframe').attr('src',src);
		})
	}
	
	</script>	
		
		<!-- js結束 -->
		
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>