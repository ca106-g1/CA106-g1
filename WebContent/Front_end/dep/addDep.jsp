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
		<input type = "button" value="回首頁" style="color:#969696;border:2px #ccc solid;padding:10px;text-align:center;" onclick="location.href='<%=request.getContextPath()%>/Front_end/mem/select_page.jsp'">
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
	
	
	<td>
	<input type = "hidden" name="deposit_change_no" 
			value="<%= (depVO==null)?"":depVO.getDeposit_change_no()%>" />
		
		</td>
		
		<td>
		
		<%-- <select size="1" name="member_no">
			<c:forEach var="memVO" items="${memSvc.all}">
				<option value="${depVO.deposit_member_no}" ${(depVO.deposit_member_no==memVO.member_no)? 'selected':''} >${memVO.member_name}       
			</c:forEach>
		</select> --%>
		
		<input type = "hidden" name="deposit_member_no" 
			value="<%= (depVO==null)?"":depVO.getDeposit_member_no()%>" />
		
		</td>
	</tr>		
	
	<tr>
		<td>異動金額</td>
		<td><input type = "text" name="deposit_change_money" id="deposit_change_money" size="45"
			value="<%= (depVO==null)?"":""%>" /></td>
	</tr>
	<tr>
		<td>信用卡密碼</td>
		<td><input type = "text" name="member_credit_number" id="member_credit_number" size="45"></td>
	</tr>
	
	<tr>
		<td>驗證末三碼</td>
		<td><input type = "text" name="member_back_verification" id="member_back_verification" size="45"></td>
	</tr>
	<tr>
	<td><input type = "hidden" name="deposit_change_date" value="<%=(depVO==null)?"":depVO.getDeposit_change_date()%>" /></td>
	
	</tr>
	
	

</table>
<br>
<input type ="hidden" name="action" value="mem_insert">
<input type = "submit" value="送出新增">






</FORM>



<img src = "img/popcorn.jpg" height="20" width="20" onclick="iddo(this)">


<script>

	function iddo(name){
		
		form1.deposit_change_money.value="2000";
		form1.member_credit_number.value="139687495312";
		form1.member_back_verification.value="398";
		
	}


</script>




	<!-- 工作區結束 -->
	
	<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>