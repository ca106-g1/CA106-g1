<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.movieinfo.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MovieInfoVO movieinfoVO = (MovieInfoVO) request.getAttribute("movieinfoVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>listoneMovieInfo</title>

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
		<th>電影編號</th>
		<th>電影種類</th>
		<th>電影名稱</th>
		<th>電影分級</th>
		<th>電影導演</th>
		<th>電影演員</th>
		<th>電影簡介</th>
		<th>片長</th>
		<th>預告片</th>
		<th>封面</th>
		<th>上映時間</th>
		<th>下映時間</th>
		<th>票房</th>
		<th>期待度</th>
		<th>不期待度</th>
		<th>點擊次數</th>
		<th>票價加價</th>
	</tr>
	
	<tr>
		<td>${movieinfoVO.movie_no}</td>
		<td>${movieinfoVO.genre_no}</td>
		<td>${movieinfoVO.movie_name}</td>
		<td>${movieinfoVO.movie_level}</td>
		<td>${movieinfoVO.movie_director}</td>
		<td>${movieinfoVO.movie_cast}</td> 
		<td>${movieinfoVO.movie_intro}</td>
		<td>${movieinfoVO.movie_length}</td>
		<td>${movieinfoVO.movie_trailer}</td>
		<td>${movieinfoVO.movie_pic}</td>
		<td>${movieinfoVO.movie_in}</td>
		<td>${movieinfoVO.movie_out}</td> 
		<td>${movieinfoVO.movie_count}</td>
		<td>${movieinfoVO.movie_exp}</td>
		<td>${movieinfoVO.movie_noexp}</td>
		<td>${movieinfoVO.movie_touch}</td>
		<td>${movieinfoVO.movie_ticket}</td> 
	</tr>
</table>

</body>
</html>