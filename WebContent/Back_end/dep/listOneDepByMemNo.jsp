<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dep.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
	DepService depSvc = new DepService();
	System.out.println(request.getParameter("member_no"));
	List<DepVO> list = depSvc.findByMem_no1(request.getParameter("member_no"));
	pageContext.setAttribute("list", list);
%>

<!doctype html>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
	

	
	
	
	</head>
	<body >
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
		<!-- 工作區開始 -->
		<div class="container" >
		<div class="row justify-content">
			<div class="col-12">
		<h4><input type="button" value="回儲值管理首頁"
				style="padding: 5px 15px; background: white; border: 1 none; color: #969696; cursor: pointer; -webkit-border-radius: 5px; border-radius: 5px;"
				onclick="location.href='<%= request.getContextPath()%>/Back_end/dep/select_page.jsp'"></h4>
					
		<%--錯誤列表 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
	
		<table class="table table-hover table-sm">
			<thead>
				<tr>
					<th scope="col">儲值明細編號</th>
					<th scope="col">會員編號</th>
					<th scope="col">異動金額</th>
					<th scope="col">異動日期</th>
				</tr>
			</thead>
			<tbody>
				<%@ include file="page1.file"%>
				<c:forEach var="depVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
	
					<tr>
						<th scope="row">${depVO.deposit_change_no}</th>
						<td>${depVO.deposit_member_no}</td>
						<td>${depVO.deposit_change_money}</td>
						<td>${depVO.deposit_change_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="table table-hover">
			<tr>
				<th scope="col"><font size="4">儲值剩餘點數</font></th>
				<td align="left"><font color="#DC143C" size="5">${memVO.member_point}</font></td>
			</tr>
		</table>
		<%@ include file="/File/page2_modify.file"%>
	
	
	
	
	
	</div></div></div>
	
		<!-- 工作區結束 -->
	
	<jsp:include page="/BackHeaderFooter/Footer.jsp" />
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
		<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS end-->
		
		<script>
					function setParam(){
						$('#input3').attr('name', 'member_no');
						$('#input3').val('${param.member_no}');
						$('#input4').attr('name', 'member_no');
						$('#input4').val('${param.member_no}');
						}
					
					$(document).ready(setParam);
		</script>	
	</body>
</html>