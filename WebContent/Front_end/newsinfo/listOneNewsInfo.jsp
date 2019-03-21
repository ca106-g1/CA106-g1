<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.newsinfo.model.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  NewsInfoVO newsinfoVO = (NewsInfoVO) request.getAttribute("newsinfoVO"); 
%>

<html>
<head>
		<!-- Bootstrap CSS start-->
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
		<!-- Bootstrap CSS end-->
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
<jsp:include page="/FrontHeaderFooter/Header.jsp" />
		<h1></h1><br>
		
		<div class="container">
		<div class="row justify-content">
			<div class="col-1"></div>
			<div class="col-4">
<!-- 工作區開始 -->

<table id="table-1">
	<tr><td>
		 <h3>單一電影資料</h3>
		 <h4><a href="<%=request.getContextPath()%>/Front_end/Home.jsp">
		 <img src="<%=request.getContextPath()%>/Back_end/movieinfo/images/eatPopcorn.gif" width="125" height="72" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>專欄標題</th>
		<th>專欄作者</th>
		<th>發文日期</th>
		<th>專欄圖片</th>
		<th>專欄內容</th> 
		
	</tr>
	<tr>
		<td><%=newsinfoVO.getNews_title()%></td>
		<td><%=newsinfoVO.getNews_auther()%></td>
		<td><%=newsinfoVO.getNews_times()%></td>
		<c:set var="news_pic" value="${newsinfoVO.news_pic}"></c:set>
			<%
				byte b[]= (byte[])pageContext.getAttribute("news_pic");
				String encode = null;
				if(b != null){
					encode = Base64.encode(b);
			%>
			<td><img id="pic" src="data:image/jpg;base64,<%=encode%>"></td>
			<%}else{%><td></td><%}%>  
		<td><%=newsinfoVO.getNews_con()%></td>
	</tr>
</table>

<!-- 工作區結束 -->
			</div>
		</div>
	</div>
		
		<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
		<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS end-->
</body>
</html>