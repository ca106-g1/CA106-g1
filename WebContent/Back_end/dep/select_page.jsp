
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.dep.model.*"%>
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

<style>

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
	<div class="container">
		<div class="row justify-content">
			<div class="col-3"></div>
			<div class="col-6">


				<table id="table-1">
					<tr>
						<td><h3>儲值明細管理首頁</h3></td>
					</tr>
				</table>

				<h4>
					<input type="button" value="回後台首頁"
				style="padding: 5px 15px; background: white; border: 1 none; color: #969696; cursor: pointer; -webkit-border-radius: 5px; border-radius: 5px;"
				onclick="location.href='<%= request.getContextPath()%>/Back_end/emp/homeIndex.jsp'">
				</h4>

				<h3>資料查詢:</h3>

				<%--錯誤列表 --%>
				<c:if test="${not empty errorMsgs }">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>

				<ul>
					<li><a href='listAllDep.jsp' style="color:green;">全部儲值明細清單</a><br>
					<br></li>

					<li>
						<FORM METHOD="post" ACTION="dep.do">
							<b>輸入儲值編號(如D000001):</b> <input type="text"
								name="deposit_change_no"> <input type="hidden"
								name="action" value="getOne_For_Display_Back"> <input
								type="submit" value="送出">
						</FORM>
					</li>

					<jsp:useBean id="depSvc" scope="page" class="com.dep.model.DepService" />
					<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

					<li>
						<FORM METHOD="post" ACTION="dep.do">
							<b>選擇儲值明細編號:</b> <select size="1" name="deposit_change_no">
								<c:forEach var="depVO" items="${depSvc.all}">
									<option value="${depVO.deposit_change_no}">${depVO.deposit_change_no}
								</c:forEach>
							</select> <input type="hidden" name="action"
								value="getOne_For_Display_Back"> <input type="submit"
								value="送出">
						</FORM>
					</li>

					<li>
					
					<%
					Set<String> set = new LinkedHashSet<String>();
					pageContext.setAttribute("set", set);
					for(DepVO depVO : depSvc.getAll()){
						set.add(depVO.getDeposit_member_no());
					}
					
					%>
					
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_end/dep/listOneDep.jsp">
							<b>選擇會員帳號:</b> 
							<select size="1" name="member_no">
								<c:forEach var="member_no" items="${set}">
									<option value="${member_no}">${memSvc.getoneMem(member_no).member_account}
								</c:forEach>
							</select> 
							<input type="hidden" name="action" value="getOne_For_Display_Back"> 
							<input type="submit" value="送出">
						</FORM>
					</li>
				</ul>



			</div>
		</div>
	</div>

	<!-- 工作區結束 -->

	<jsp:include page="/BackHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script
		src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>