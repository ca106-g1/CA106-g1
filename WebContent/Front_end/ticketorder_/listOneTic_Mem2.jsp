
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ticketorder.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	TicketorderService ticketorderSvc = new TicketorderService();
	List<TicketorderVO> list = ticketorderSvc
			.findByMem_no1(((MemVO) session.getAttribute("memVO")).getMember_no());
	TicketorderVO ticketorderVO = (TicketorderVO) request.getAttribute("ticketorderVO");
	pageContext.setAttribute("list", list);
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
	
		.card-img{
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            z-index: -999;
            min-height: 100%;
            width: 100%;
            opacity: 0.3;
			}
	
	
	</style>
	
	
	</head>
	<body>
	<div>
		<img src="<%=request.getContextPath()%>/FrontHeaderFooter/FrontBootstrapHeaderFooter/Front_end_img.jpg" class="card-img" alt="" style="">
	</div>
		<!-- 工作區開始 -->
					<h3>所有購票明細</h3> 
	
		<%--錯誤列表 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
	
		<table class="table table-hover table-sm">
			<thead>
				<tr>
	
					<th scope="col">訂單編號</th>
					<th scope="col">優惠編號</th>
					<th scope="col">場次編號</th>
					<th scope="col">訂單時間</th>
					<th scope="col">訂單金額</th>
	
				</tr>
			</thead>
			<tbody>
				<%@ include file="/File/page1.file"%>
				<c:forEach var="ticketorderVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
	
					<tr>
						<th scope="row">${ticketorderVO.order_no }</th>
						<td>${ticketorderVO.fd_no }</td>
						<td>
						<div style="overflow: auto;">
								${ticketorderVO.session_no }</div>
						</td>
						<td>${ticketorderVO.order_time }</td>
						<td>${ticketorderVO.order_amount }</td>
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/Front_end/mem/mem.do">
								<input type="submit" value="查看電影票明細"> <input
									type="hidden" name="order_no" value="${ticketorderVO.order_no}">
								<input type="hidden" name="action"
									value="getOne_For_Display_Tic_Mov">
							</FORM>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/File/page2_modify.file"%>
	
		<!-- 工作區結束 -->
	
	
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
		<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS end-->
	
	</body>
</html>