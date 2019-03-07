<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.newsinfo.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  NewsInfoVO newsinfoVO = (NewsInfoVO) request.getAttribute("newsinfoVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>listoneNewsInfo</title>

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

<table id="table-1">
	<tr><td>
		 <h3>單一電影資料</h3>
		 <h4><a href="select_page.jsp"><img src="images/eatPopcorn.gif" width="125" height="72" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>新聞編號</th>
		<th>電影編號</th>
		<th>新聞標題</th>
		<th>新聞作者</th>
		<th>發文日期</th>
		<!-- <th>新聞內容</th> -->
		<th>新聞圖片</th>
		
	</tr>
	<tr>
		<td><%=newsinfoVO.getNews_no()%></td>
		<td><%=newsinfoVO.getMovie_no()%></td>
		<td><%=newsinfoVO.getNews_title()%></td>
		<td><%=newsinfoVO.getNews_auther()%></td>
		<td><%=newsinfoVO.getNews_times()%></td>
		<!--<td><%=newsinfoVO.getNews_con()%></td>-->
		<td><%=newsinfoVO.getNews_pic()%></td>
		
		
	</tr>
</table>

</body>
</html>