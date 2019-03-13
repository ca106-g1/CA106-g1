 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adv.model.*"%>


<%
	AdvService advSvc = new AdvService();
    List<AdvVO> list = advSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllAdv.jsp</title>

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
		 <h3>所有員工資料 - listAllAdv.jsp</h3>
		 <h4><a href="select_page_adv.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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

<br>


	<%@ include file="page1.file" %> 
	<br>
	<c:forEach var="advVO" items="${list}" >
	
<%-- 				<c:if test="${empty advVO.ad_pic}" var="condition"> --%>
<%-- 				<img src="<%=request.getContextPath()%>/Back_end/adv/images/no_pic.jpg" width="200" height="200"/> --%>
<%-- 				</c:if> --%>
			    
<%-- 			    <c:if test="${not empty advVO.ad_pic}" var="condition"> --%>
<%-- 			    <h4><a href="${advVO.ad_cont}"> <img  src='<%=request.getContextPath()%>/Back_end/adv/adv.do?ad_no=${advVO.ad_no}' width='200' height='200' /></a></h4> --%>
<%-- 				</c:if> --%>
				
				 <c:if test="${advVO.ad_type==1}" var="condition">
				 <c:if test="${not empty advVO.ad_pic}" var="condition">
				 
			    <h4><a href="${advVO.ad_cont}"> <img  src='<%=request.getContextPath()%>/Back_end/adv/adv.do?ad_no=${advVO.ad_no}' width='200' height='200' /></a></h4>
				
				</c:if>
				</c:if>

	</c:forEach>






</body>
</html>
