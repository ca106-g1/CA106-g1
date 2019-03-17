 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<% response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires",0);
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
<body>
	<jsp:include page="/FrontHeaderFooter/Header.jsp" />
	<h1></h1>

	<!-- 工作區開始 -->



<ul>

	<li><a href = 'listAllMem.jsp'> 全部會員清單</a></li>
	


</ul>

<td>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/mem/mem.do">
		<input type = "submit" value="會員資料查看">
		<input type = "hidden" name="member_no" value="${memVO.member_no}">
		<input type = "hidden" name="action" value="getOne_For_Display"></FORM>
</td>

<td>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/mem/mem.do">
		<input type = "submit" value="個人資料修改">
		<input type = "hidden" name="member_no" value="${memVO.member_no}">
		<input type = "hidden" name="action" value="getOne_for_Update"></FORM>
</td>

<td>
	<!--  <a href ='<%=request.getContextPath()%>/Front_end/dep/listOneDep.jsp'>Join儲值錢包查詢</a>
	<br>-->
	 
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/dep/dep.do">
		<input type = "submit" value="Join儲值錢包查詢">
		<input type = "hidden" name="member_no" value="${memVO.member_no}">
		<input type = "hidden" name="action" value="getOne_For_Display_Mem"></FORM>
		
</td>

<td>

	
	<!--<a href ='<%=request.getContextPath()%>/Front_end/dep/addDep.jsp'>Join儲值錢包新增</a>-->
	
	
	
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/dep/dep.do">
		<input type = "submit" value="Join儲值錢包新增">
		<input type = "hidden" name="member_no" value="${memVO.member_no}">
		<input type = "hidden" name="action" value="insert_Token"></FORM>    
</td>

<td>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/mem/mem.do">
		<input type = "submit" value="購票紀錄查詢">
		<input type = "hidden" name="member_no" value="${memVO.member_no}">
		<input type = "hidden" name="action" value="getOne_For_Display_Tic_Mem"></FORM>
</td>




	
	
	<FORM METHOD="POST" ACTION = "logoutHandler.do">
	<td><input type = "submit" value="登出">
		<input type = "hidden" name="logout" value="logout"> 
	</td>
	</FORM>
	
	
	
	


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