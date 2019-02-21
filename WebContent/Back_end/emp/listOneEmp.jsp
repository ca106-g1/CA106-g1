<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.emp.model.*" %>

<%
	EmpVO empVO = (EmpVO)request.getAttribute("empVO");  //empServlet.java(C) 存入req的EmpVO物件
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
<title></title>
</head>
<body bgcolor='white'>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1></h1>

	<!-- 工作區開始 -->
<table id ="table-1">
	<tr><td>
		<h3>員工個人資料</h3>
		<h4><a href ="select_page.jsp">回員工後台首頁</a> </h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>員工性別</th>
		<th>員工建立日期</th>
		<th>員工離職日期</th>
		<th>員工職位</th>
		<th>員工狀態</th>
	</tr>
	<tr>
		<td><%=empVO.getEmployee_no()%></td>
		<td><%=empVO.getEmployee_name()%></td>
		<td><%=empVO.getEmployee_sex()%></td>
		<td><%=empVO.getEmployee_builddate()%></td>
		<td><%=empVO.getEmployee_quitdate()%></td>
		<td><%=empVO.getEmployee_ability()%></td>
		<td><%=empVO.getEmployee_status()%></td>
	</tr>

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