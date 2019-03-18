 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import= "com.mem.model.* , java.util.*" %>


<jsp:useBean id="memVO" class="com.mem.model.MemVO" scope="session"/>
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
	<jsp:include page="/FrontHeaderFooter/Header.jsp" />
	<h1></h1>

	<!-- 工作區開始 -->
	
	<%--錯誤表列 --%>
<c:if test="${not empty errorMsgs }">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var = "message"  items="${errorMsgs}">
			<li style="color:red">${message}</li>
			</c:forEach>
	</ul>
</c:if >

<FORM METHOD="post" ACTION="mem.do" name="form1">
<table>

<p>*密碼: 
<input type = "password"  name = "member_password" value="<%= (memVO==null)?"":""%>"  required> </p>

<p>*再次確認密碼:
<input type = "password"  name = "member_password1" value="<%= (memVO==null)?"":""%>"  required> </p>
</table>

<br>
<input type = "hidden" name="action" value="update_psw">
<input type = "submit" value = "送出修改"> </FORM>







	<!-- 工作區結束 -->
	
	<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>