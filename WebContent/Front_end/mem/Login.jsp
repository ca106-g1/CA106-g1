<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Join揪影影城登入系統</title>
<style>

table#table-1{
	width: 450px;
	background-color: #CCCCFF;
	margin-top:5px;
	margin-bottom:10px;
	border:3px ridge Gray;
	height: 80px;
	text-align: center;
}
table#table-1 h4{

color:red;
display:block;
margin-bottom:1px;
}
h4{
color:blue;
display: inline;
}

</style>


</head>
<body bgcolor='white'>

<table id = "table-1">

<tr><td><h3>Join揪影影城登入系統</h3></td></tr>

</table>


<%--錯誤表列 --%>
<c:if test="${not empty errorMsgs }">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var = "message"  items="${errorMsgs}">
			<li style="color:red">${message}</li>
			</c:forEach>
	</ul>
</c:if >
	

<form  method = "post"   action = "mem.do"  >

<p>帳號: <input type = "text"  name = "member_account"  ></p>
<p>密碼: <input type = "text"  name = "member_password" ></p>
<p><input type = "hidden" name="action" value="getone_for_login">
   <input type = "submit"  value = "送出">
   <input type = "reset"   value = "取消">
</p>
</form>

<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

*如果您還未註冊會員 請點擊<a href='Registered.jsp'>註冊</a>




</body>
</html>