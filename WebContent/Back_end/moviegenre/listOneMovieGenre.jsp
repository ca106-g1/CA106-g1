<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.moviegenre.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MovieGenreVO moviegenreVO = (MovieGenreVO) request.getAttribute("moviegenreVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>listOneMovieGenre</title>

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
		 <h3>單一電影查詢</h3>
		 <h4><a href="select_page.jsp"><img src="images/popcorn.jpg" width="52" height="62" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>電影種類編號</th>
		<th>電影種類姓名</th>
	</tr>
	<tr>
		<td><%=moviegenreVO.getGenre_no()%></td>
		<td><%=moviegenreVO.getGenre_name()%></td>
	</tr>
</table>

</body>
</html>