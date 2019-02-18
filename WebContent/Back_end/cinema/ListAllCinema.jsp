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
<body>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1>瀏覽廳院</h1>

	<!-- 工作區開始 -->
	<table>
	<tr>
	<th>廳院編號</th>
	<th>廳院名稱</th>
	<th>廳院容量</th>
	<th>廳院敘述</th>
	<th>廳院狀態</th>
	<th>設定廳院</th>
	</tr>
<c:forEach var="cinemaVO" items="${cinemaList}">

<tr>

	<td>${cinemaVO.cinema_no}</td>
	<td>${cinemaVO.cinema_name}</td>
	<td>${cinemaVO.cinema_size}</td>
	<td>${cinemaVO.cinema_correct}</td>
	<td>${cinemaVO.cinema_status}</td>
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