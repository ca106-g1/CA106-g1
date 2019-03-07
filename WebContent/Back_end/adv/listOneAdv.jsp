<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adv.model.*"%>
<%@ page import="java.util.*"%>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	AdvVO advVO = (AdvVO) request.getAttribute("advVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneAdv.jsp</title>

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
	width: 600px;
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

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneAdv.jsp</h3>
		 <h4><a href="select_page_adv.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>


<table>
	<tr>
		<th>廣告編號</th>
		<th>廣告名稱</th>
		<th>廣告圖片</th>
		<th>廣告內容</th>
		<th>廣告起始時間</th>
		<th>廣告終止時間</th>
	</tr>
	
	
	
	<tr>
			<td>${advVO.ad_no}</td>
			<td>${advVO.ad_name}</td>
			<td>
				<c:if test="${empty advVO.ad_pic}" var="condition">
				<img src="<%=request.getContextPath()%>/Back_end/adv/images/no_pic.jpg" width="200" height="200"/>
				</c:if>
			    <c:if test="${not empty advVO.ad_pic}" var="condition">
			    <img  src='<%=request.getContextPath()%>/Back_end/adv/adv.do?ad_no=${advVO.ad_no}' width='200' height='200' />
				</c:if>
			</td>
			<td>${advVO.ad_cont}</td>
			<td>${advVO.ad_start}</td>
			<td>${advVO.ad_end}</td> 
	</tr>
	
	
</table>







</body>
</html>