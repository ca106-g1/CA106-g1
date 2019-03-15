<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.movieinfo.model.*"%>
<%@ page import="com.moviegenre.model.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
MovieInfoService movieinfoSvc = new MovieInfoService();
List<MovieInfoVO> lista = movieinfoSvc.getAll();
List<MovieInfoVO> list = new ArrayList<MovieInfoVO>();
java.util.Date now = new java.util.Date();
java.sql.Date sqlDate = new java.sql.Date(now.getTime());
for(MovieInfoVO movVO:lista){
	if(sqlDate.after(movVO.getMovie_in()) && sqlDate.before(movVO.getMovie_out())){
		list.add(movVO);
	}
}
pageContext.setAttribute("list",list);

MovieGenreService moviegenreSvc = new MovieGenreService();
pageContext.setAttribute("msc",moviegenreSvc);
%>


<html>
<head>
<title>listallMovieInfo </title>

<style>
  table#table-1 {
	background-color: #00caca;
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
  img, #level{
  	width:50px;
  	hight:50px;
  }
  
  img, #pic{
  	width:135px;
  	hight:200px;
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

<table id="table-1">
	<tr><td>
		 <h3>後台-電影資料清單</h3>
		 <h4><a href="select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/movieinfo/images/eatPopcorn.gif" width="125" height="72" border="0">回首頁</a></h4>
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
		<th>電影編號</th>
		<th>電影種類</th>
		<th>電影名稱</th>
		<th>電影封面</th>
		<th>電影分級</th>
		<th>電影導演</th>
		<th>電影演員</th>
		<th>電影片長</th>
		<th>電影簡介</th>
		<th>電影預告片</th>
		<th>電影上映時間</th>
		<th>電影下映時間</th>
		<th>電影票房</th>
		<th>電影期待度</th>
		<th>電影不期待度</th>
		<th>電影點擊次數</th>
		<th>電影票價加價</th>
		<th colspan="2">編輯</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="movieinfoVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${movieinfoVO.movie_no}</td>
			<td>${msc.getOneGenre(movieinfoVO.genre_no).genre_name}</td>
			<td>${movieinfoVO.movie_name}</td>
<!-- 新增movie_pic			 -->
			<c:set var="movie_pic" value="${movieinfoVO.movie_pic}"></c:set>
			<%
				byte b[]= (byte[])pageContext.getAttribute("movie_pic");
				String encode = null;
				if(b != null){
					encode = Base64.encode(b);
			%>
			<td><img id="pic" src="data:image/jpg;base64,<%=encode%>"></td>
			<%}else{%><td></td><%}%>
<!-- 新增movie_level -->			
			<c:set var="movie_level" value="${movieinfoVO.movie_level}"></c:set>
			<%
				byte c[]= (byte[])pageContext.getAttribute("movie_level");
				String encode1 = null;
				if(c != null){
					encode1 = Base64.encode(c);
			%>
			<td><img id="level" src="data:image/jpg;base64,<%=encode1%>"></td>
			<%}else{%><td></td><%}%>
			<td>${movieinfoVO.movie_director}</td>
			<td>${movieinfoVO.movie_cast}</td> 
			<td>${movieinfoVO.movie_length}</td>
			<td>${movieinfoVO.movie_intro}</td>
			<td>${movieinfoVO.movie_trailer}</td>
			<td>${movieinfoVO.movie_in}</td>
			<td>${movieinfoVO.movie_out}</td> 
			<td>${movieinfoVO.movie_count}</td>
			<td>${movieinfoVO.movie_exp}</td>
			<td>${movieinfoVO.movie_noexp}</td>
			<td>${movieinfoVO.movie_touch}</td>
			<td>${movieinfoVO.movie_ticket}</td> 
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="movie_no"  value="${movieinfoVO.movie_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="movie_no"  value="${movieinfoVO.movie_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>