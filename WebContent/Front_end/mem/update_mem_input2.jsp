 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import= "com.mem.model.*" %>

<%
	MemVO memVO = (MemVO) request.getAttribute("memVO");	
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
	
	<%--錯誤表列 --%>
<c:if test="${not empty errorMsgs }">
	<font style = "color:red">請修正以下錯誤</font>
	<ul>
		<c:forEach var = "message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="mem.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>會員編號:</td>
		<td><%=memVO.getMember_no() %></td>
	</tr>
	
	<tr>
		<td>會員帳號:</td>
		<td><%=memVO.getMember_account() %></td>
	</tr>



<p>*密碼: 
<input type = "password"  name = "member_password" value="<%= (memVO==null)?"":""%>"  required> </p>

<p>*再次確認密碼:
<input type = "password"  name = "member_password1" value="<%= (memVO==null)?"":""%>"  required> </p>

<p>*姓名:
<input type = "text"  name = "member_name" value="<%= (memVO==null)?"":memVO.getMember_name()%>"> </p>

<p>暱稱:
<input type = "text"  name = "member_nick" value="<%= (memVO==null)?"":memVO.getMember_nick()%>"> </p>

<p>*性別:<input type = "radio" name = "member_sex" value = "1" ${(memVO.member_sex==1)? "checked": ""} >男性
	   <input type = "radio" name = "member_sex" value = "0" ${(memVO.member_sex==0)? "checked": ""} >女性
</p>

	<%
	java.sql.Date member_birthday = null;
	try{
		member_birthday = memVO.getMember_birthday();
	}catch (Exception e){
		member_birthday = new java.sql.Date(System.currentTimeMillis());
	}
%>


<p>*生日:
<input type="date" name="member_birthday" id="f_date" value="<%= (memVO==null)? member_birthday:memVO.getMember_birthday()%>"></p>



<p>*地址:
<input type = "text"  name = "member_address" value="<%= (memVO==null)?"":memVO.getMember_address()%>"> </p>

<p>*電話:
<input type = "tel"  name = "member_telephone" value="<%= (memVO==null)?"":memVO.getMember_telephone()%>"> </p>

<p>*信箱: 
<input type = "email"  name = "member_email" value="<%= (memVO==null)?"":memVO.getMember_email()%>"> </p>

<p>會員圖像: 
<input type = "file" id = "img" name = "member_picture"> </p>

<p>信用卡號碼:
<input type = "text"  name = "member_credit_number" value="<%= (memVO==null)?"":memVO.getMember_credit_number()%>"> </p> 

<p>背面後三碼: 
<input type = "text"  name = "member_back_verification" value="<%= (memVO==null)?"":memVO.getMember_back_verification()%>"> </p>

</table>
<br>
<input type = "hidden" name="action" value="update">
<input type = "hidden" name="member_no" value="<%= memVO.getMember_no() %>">
<input type = "submit" value = "送出修改"> </FORM>



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