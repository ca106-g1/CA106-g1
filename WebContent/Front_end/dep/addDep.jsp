 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.dep.model.*" %>

<%
 DepVO depVO = (DepVO) request.getAttribute("depVO");
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
<title>會員儲值明細新增</title>
</head>
<body bgcolor='white'>
	<jsp:include page="/FrontHeaderFooter/Header.jsp" />
	<h1></h1>

	<!-- 工作區開始 -->
<table id = "table-1">
	<tr><td>
		<h3>會員儲值明細新增</h3>
		<h4><a href = "select_page.jsp">回首頁</a></h4>
	</td></tr>

</table>


<h3>資料新增:</h3>

<%--錯誤列表 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>	
	</ul>
</c:if>

<FORM METHOD="post" ACTION="dep.do" name="form1">
<table>

	<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
	<tr>
		<td>會員名稱:</td>
		<td><select size="1" name="member_no">
			<c:forEach var="memVO" items="${memSvc.all}">
				<option value="${memVO.member_no}" ${(depVO.deposit_member_no==memVO.member_no)? 'selected':''} >${memVO.member_name}       
			</c:forEach>
		</select></td>
	</tr>		
	
	<tr>
		<td>異動金額</td>
		<td><input type = "text" name="deposit_change_money" size="45"
			value="<%= (depVO==null)?"":depVO.getDeposit_change_money()%>" /></td>
	</tr>
	
	<tr>
		<td>異動日期:</td>
		<td><input type="date" name="deposit_change_date" id="f_date1"></td>
	</tr>

</table>
<br>
<input type ="hidden" name="action" value="insert">
<input type = "submit" value="送出新增"></FORM>











	<!-- 工作區結束 -->
	
	<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
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