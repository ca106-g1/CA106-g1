<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.movieinfo.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MovieInfoVO movieinfoVO = (MovieInfoVO) request.getAttribute("movieinfoVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
		<!-- Bootstrap CSS start-->
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
		<!-- Bootstrap CSS end-->
	<title>Home</title>

	<style>
	  table {
		background-color: 	#e0e0e0;
	    border: 2px solid black;
	    width:250px;
	    heigh:100px;
	  }
	  table  h4{
	    color: red;
	    display: block;
	    margin-bottom: 1px;
	    text-align:center;
	  }
	  table  h3{
	    color: red;
	    text-align:left;
	    display: block;
	    margin-bottom: 1px;
	  }
	  
	</style>

</head>

<body >
<jsp:include page="/FrontHeaderFooter/Header.jsp" />
		<h1></h1><br>
		
		<div class="container">
		<div class="row justify-content">
			<div class="col-1"></div>
			<div class="col-4">
<!-- 工作區開始 -->
	<H4>影城首頁</H4>
	
	<table class="table">
		<tr>
			<h3><td>影城介紹</td></h3>
			 <td>
			 	<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">影城簡介</a></h4>
			 	<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">影城交通</a></h4>
			 	<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">聯絡我們</a></h4>
			 </td>
		</tr>
	</table>
	
	<table class="table">
		<tr>
			<h3><td>最新優惠</td></h3>
			 <td>
			 	<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">最新優惠</a></h4>
			 </td>
		</tr>
	</table>
	
	
	<table class="table">
		<tr>
			 <h3><td>電影簡介</td></h3>
			 <td>
				 <h4><a href="<%=request.getContextPath()%>/Front_end/movieinfo/upComingListAll.jsp">即將上映</a></h4>
				 <h4><a href="<%=request.getContextPath()%>/Front_end/movieinfo/listAllMovieInfo.jsp">熱映中</a></h4>
				 <h4><a href="<%=request.getContextPath()%>/Front_end/movieinfo/hotMovie.jsp">熱門電影推薦</a></h4>
				 <h4><a href="<%=request.getContextPath()%>/Front_end/movieinfo/rankMovieList.jsp">年度電影推薦</a></h4>
			 </td>
		</tr>
	</table>
	
	<table class="table">
		<tr>
			<h3><td>線上購票</td></h3>
			<td>
				<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">電影票價</a></h4>
				<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">場次資訊</a></h4>
				<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">訂票查詢/取消</a></h4>
			</td>
		</tr>
	</table>
	
	<table class="table">
		<tr>
			 <h3><td>影視新聞</td></h3>
			 <td>
				 <h4><a href="<%=request.getContextPath()%>/Front_end/newsinfo/listAllNewsInfo.jsp">影視新聞</a></h4>
			 </td>
		</tr>
	</table>
	
	<table class="table">
		<tr>
			<h3><td>會員中心</td></h3>
			 <td>
			 	<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">註冊/登入會員</a></h4>
			 	<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">會員資料查看</a></h4>
			 	<h4><a href="<%=request.getContextPath()%>/Front_end/404.jsp">Q&A</a></h4>
			 </td>
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