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
	<div class="container" >
		<div class="row justify-content">
			<div class="col-3"></div>
			<div class="col-6">
	
<table id ="table-1">
	<tr><td>
		<h3>員工個人資料</h3>
		<h4><input type="button" value="回員工管理首頁"
				style="padding: 5px 15px; background: white; border: 1 none; color: #969696; cursor: pointer; -webkit-border-radius: 5px; border-radius: 5px;"
				onclick="location.href='<%= request.getContextPath()%>/Back_end/emp/select_page.jsp'"> </h4>
	</td></tr>
</table>

<table class="table table-hover">
<thead>
	<tr>
		<th scope="row">員工編號</th>
		<td><%=empVO.getEmployee_no()%></td>
	</tr>
	<tr>	
		<th scope="row">員工姓名</th>
		<td><%=empVO.getEmployee_name()%></td>
	</tr>
	<tr>	
		<th scope="row">員工性別</th>
		<td>${empVO.employee_sex eq 0?"女":"男"}</td>
		
	</tr>
	<tr>	
		<th scope="row">員工建立日期</th>
		<td><%=empVO.getEmployee_builddate()%></td>
	</tr>
	<tr>	
		<th scope="row">員工離職日期</th>
		<td>${empVO.employee_quitdate eq null ? "" : "empVO.employee_quitdate" }</td>
	</tr>
	<tr>	
		<th scope="row">員工職位</th>
		<td><%=empVO.getEmployee_ability()%></td>
	</tr>
	<tr>	
		<th scope="row">員工狀態</th>
		<td>${empVO.employee_status eq 0?"已離職":"在職中"}</td>
	</tr>	
		
	
</thead>
<tbody>
	<tr>
		
	</tr>
</tbody>
</table>
</div></div></div>

	<!-- 工作區結束 -->
	
		<jsp:include page="/BackHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>