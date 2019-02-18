<%@ page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.cinema.model.*"%>
<%@ page import="com.cinema.controller.*"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>瀏覽廳院</title>
</head>
<body>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1>瀏覽廳院</h1>

	<!-- 工作區開始 -->

	<%
		Map cinemaMap = (Map) application.getAttribute("cinemaMap");
		CinemaVO cinemaVO = (CinemaVO) (cinemaMap.get(request.getParameter("cinema_no")));
		request.setAttribute("cinemaVO", cinemaVO);
	%>

	<div class="container">
		<div class="row justify-content">
			<div class="col-5">
				<form action="CinemaServlet" method="post">
					<table>

						<tr>
							<th>廳院編號</th>
							<td>${cinemaVO.cinema_no}</td>
						</tr>
						<tr>
							<th>廳院名稱</th>
							<td><input type="text" name="cinema_name"
								value="${cinemaVO.cinema_name}"></td>
						</tr>
						<tr>
							<th>廳院容量</th>
							<td><P>${cinemaVO.cinema_size}</P></td>
						</tr>
						<tr>
							<th>廳院敘述</th>
							<td><input type="text" name="cinema_correct"
								value="${cinemaVO.cinema_correct}"></td>
						</tr>
						<tr>
							<th>廳院狀態</th>
							<td><input type="text" name="cinema_status"
								value="${cinemaVO.cinema_status}"></td>
						</tr>

					</table>
					<input type="hidden" name="cinema_size"
						value="${cinemaVO.cinema_size}"> <input type="hidden"
						name="cinema_no" value="${cinemaVO.cinema_no}"> <input
						type="hidden" name="cinema_type" value="${cinemaVO.cinema_type}">
					<input type="hidden" name="action" value="updateCinema"> <input
						type="submit" value="送出修改">
				</form>
			</div>
			<div class="col-7">
				<nav>
					<c:forEach var="var" items="${statusOfSitList}">
			
						${var.str}
						<div class="btn"
							style="background-color:${var.coller}; border-color:#000">
						</div>

					</c:forEach>


					<%
						List<List<Integer>> sitList = new ArrayList<List<Integer>>();
						String cinema_type = cinemaVO.getCinema_type();

						for (int i = 0; i < 20; i++) {
							List<Integer> list = new ArrayList<Integer>();
							for (int j = 0; j < 20; j++) {
								list.add(new Integer(cinema_type.indexOf(i * 20 + j)));
							}
							sitList.add(list);
						}
					%>
					<jsp:useBean id="statusOfSitList" scope="application"
						class="java.util.ArrayList" />
					<%
						int outerSize = sitList.size();
						for (int i = 0; i < outerSize; i++) {
							List<Integer> sitInnerList = sitList.get(i);
							int innerSize = sitInnerList.size();
							for (int j = 0; j < innerSize; j++) {
					%>

					<div class="btn"
						style="background-color:<%=((CinemaTool.statusOfSit) (statusOfSitList.get(sitInnerList.get(j)))).getColler()%>; border-color:#000">
					</div>

					<%
						}
					%>

					<br>

					<%
						}
					%>


				</nav>


			</div>
		</div>
	</div>

	<script>
		
	</script>

	<!-- 工作區結束 -->

	<jsp:include page="/BackHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script
		src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>