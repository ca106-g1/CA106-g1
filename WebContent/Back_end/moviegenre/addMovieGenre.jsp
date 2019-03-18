<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.moviegenre.model.*"%>

<%
  MovieGenreVO moviegenreVO = (MovieGenreVO) request.getAttribute("moviegenreVO");
%>

<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		<title>addMovieGenre</title>
	
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
		  
		  table {
			width: 450px;
			background-color: white;
			margin-top: 1px;
			margin-bottom: 1px;
		  }
		  
		  table, th, td {
		    border: 0px solid #CCCCFF;
		  }
		  
		  th, td {
		    padding: 1px;
		  }
		  
		</style>
	</head>

	<body bgcolor='white'>
		<table id="table-1">
			<tr>
				<td><h3>後台-電影種類新增</h3></td>
				<td><h4>
					<a href="<%=request.getContextPath()%>/Back_end/moviegenre/select_page.jsp"><img src="<%=request.getContextPath()%>/Back_end/movieinfo/images/popcorn.jpg" width="52" height="62" border="0"><br>回首頁</a>
				</h4></td>
			</tr>
		</table>
		
		<h3>資料新增:</h3>
		
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color:red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color:red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_end/moviegenre/moviegenre.do" name="form1">
		<table>
			<tr>
				<td>電影種類名稱:<font color=red size="2"><b>*</b></font></td>
				<td>
					<input type="TEXT" name="genre_name" size="45" placeholder="ex:Action" />
				</td>
			</tr>
			
		</table>
		<br>
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出新增"></FORM>
	</body>

</html>