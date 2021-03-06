<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ticketorder.model.*"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	TicketorderService ticketorderSvc = new TicketorderService();
    List<TicketorderVO> list = ticketorderSvc.getAll();
    pageContext.setAttribute("list",list);
%>



<html>
<head>
<title>所有資料 - listAllTicketorder.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有資料 - listAllTicketorder.jsp</h3>
		 <h4><a href="select_page_ticketorder.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<table>
	<tr>
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>優惠編號</th>
		<th>場次編號</th>
		<th>員工編號</th>
		<th>揪團訂單</th>
		<th>是否取餐</th>
		<th>訂單時間</th>
		<th>訂單金額</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="ticketorderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
		<tr>
			<td>${ticketorderVO.order_no}</td>
			<td>${ticketorderVO.member_no}</td>
			<td>${ticketorderVO.fd_no}</td>
			<td>${ticketorderVO.session_no}</td>
			<td>${ticketorderVO.employee_no}</td>
			<td>${ticketorderVO.order_group}</td> 
			<td>${ticketorderVO.order_takemeals}</td>
			<td>${ticketorderVO.order_time}</td>
			<td>${ticketorderVO.order_amount}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ticketorder/ticketorder.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="order_no"  value="${ticketorderVO.order_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ticketorder/ticketorder.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="order_no"  value="${ticketorderVO.order_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>

				
	</c:forEach>
	
</table>

<%@ include file="page2.file" %>






</body>
</html>