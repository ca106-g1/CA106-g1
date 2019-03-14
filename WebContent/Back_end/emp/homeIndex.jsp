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
<title></title>
</head>
<body>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1></h1>

	<!-- 工作區開始 -->
	
	
	<td>
		<FORM METHOD = "post" ACTION="<%=request.getContextPath()%>/Back_end/emp/select_page.jsp">
		<input type="submit" value="員工資料管理">
		</FORM>
	</td>
	
	
	<td>
		<FORM METHOD = "post" ACTION="<%=request.getContextPath()%>/Back_end/mem/select_page.jsp">
		<input type="submit" value="會員資料管理">
		</FORM>
	</td>
	
	<td>
		<FORM METHOD = "post" ACTION="<%=request.getContextPath()%>/Back_end/dep/select_page.jsp">
		<input type="submit" value="儲值資料管理">
		</FORM>
	</td>


<FORM METHOD="POST" ACTION = "logoutHandler.do">
	<td><input type = "submit" value="登出">
		<input type = "hidden" name="logout" value="logout"> 
	</td>
	</FORM>

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