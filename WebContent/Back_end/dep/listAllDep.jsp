 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.dep.model.*" %>

<%
	DepService depSvc = new DepService();
	List<DepVO> list = depSvc.getAll();
	pageContext.setAttribute("list",list);
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


<style>
	table#table-1{
	background-color:#CCCCFF;
	border:2px solid black;
	text-align: center;
	}
	table#table-1 h4{
	color:red;
	display: block;
	margin-bottom:
	}
	
	
input[type="submit"]  {padding:5px 15px; background:#ccc; border:0 none;
		cursor:pointer;
		-webkit-border-radius: 5px;
		border-radius: 5px; }


</style>




</head>
<body bgcolor='white'>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1></h1>

	<!-- 工作區開始 -->
	<div class="container" >
		<div class="row justify-content">
			<div class="col-12">

	
		
		<h4><input type="button" value="回儲值管理首頁"
				style="padding: 5px 15px; background: white; border: 1 none; color: #969696; cursor: pointer; -webkit-border-radius: 5px; border-radius: 5px;"
				onclick="location.href='<%= request.getContextPath()%>/Back_end/dep/select_page.jsp'"></h4>


<%--錯誤列表 --%>
<c:if test="${not empty errorMsgs}">
	<font style = "color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message"  items="${errorMsgs}">
			<li style = "color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table class="table table-hover">
<thead>
	<tr>
		<th>儲值明細編號</th>
		<th>會員編號</th>
		<th>異動金額</th>
		<th>異動日期</th>
	</tr>
</thead>
<tbody>	
	<%@ include file="page1.file" %>
	<c:forEach var="depVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
	<tr>
		<th scope="row">${depVO.deposit_change_no}</th>
		<td>${depVO.deposit_member_no}</td>
		<td>${depVO.deposit_change_money}</td>
		<td>${depVO.deposit_change_date}</td>
	</tr>
	</c:forEach>
</tbody>
</table>
<%@ include file="/File/page2_modify.file" %>





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