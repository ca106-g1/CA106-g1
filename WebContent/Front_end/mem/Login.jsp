<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Join���v�v���n�J�t��</title>
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

<tr><td><h3>Join���v�v���n�J�t��</h3></td></tr>

</table>


<%--���~��C --%>
<c:if test="${not empty errorMsgs }">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var = "message"  items="${errorMsgs}">
			<li style="color:red">${message}</li>
			</c:forEach>
	</ul>
</c:if >
	

<form  method = "post"   action = "mem.do"  >

<p>�b��: <input type = "text"  name = "member_account"  ></p>
<p>�K�X: <input type = "text"  name = "member_password" ></p>
<p><input type = "hidden" name="action" value="getone_for_login">
   <input type = "submit"  value = "�e�X">
   <input type = "reset"   value = "����">
</p>
</form>

<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

*�p�G�z�٥����U�|�� ���I��<a href='Registered.jsp'>���U</a>




</body>
</html>