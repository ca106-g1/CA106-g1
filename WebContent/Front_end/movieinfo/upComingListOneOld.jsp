<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.movieinfo.model.*"%>
<%@ page import="com.moviegenre.model.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MovieInfoVO movieinfoVO = (MovieInfoVO) request.getAttribute("movieinfoVO"); 
  
  MovieGenreService moviegenreSvc = new MovieGenreService();
  pageContext.setAttribute("msc",moviegenreSvc);
%>

<html>
<head>
<title>listoneUpComingMovieInfo</title>

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
		
<!-- 工作區開始 -->

		<div class="container">
		<div class="row justify-content">
			<div class="col-1"></div>
			<div class="col-4">

<table id="table-1">
	<tr><td>
		 <h3>電影簡介</h3>
		 <h4><a href="<%=request.getContextPath()%>/Front_end/Home.jsp"><img src="<%=request.getContextPath()%>/Back_end/movieinfo/images/eatPopcorn.gif" width="125" height="72" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>電影名稱</th>
		<th>電影種類</th>
		<th>電影封面</th>
		<th>電影分級</th>
		<th>上映時間</th>
		<th>電影導演</th>
		<th>電影演員</th>
		<th>電影片長</th>
		<th>電影預告片</th>
		<th>電影簡介</th>
		<th colspan="2">操作按鈕</th>
	</tr>
	
	<tr>
			<td>${movieinfoVO.movie_name}</td>
			<td>${msc.getOneGenre(movieinfoVO.genre_no).genre_name}</td>
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
			<td>${movieinfoVO.movie_in}</td>
			<td>${movieinfoVO.movie_director}</td>
			<td>${movieinfoVO.movie_cast}</td> 
			<td>${movieinfoVO.movie_length}</td>
			<td><iframe width="560" height="315" src="${movieinfoVO.movie_trailer}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
			<td>${movieinfoVO.movie_intro}</td>
			<td>
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;"> --%>
			     <input type="button" class="expect" id="exp2" value="期待">
			     <input type="hidden" name="movie_no"  value="${movieinfoVO.movie_no}">
			     <input type="hidden" name="action"	value="exp">
<!-- 			     </FORM> -->
			</td>
			<td>
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;"> --%>
			     <input type="button" class="noexpect" id="noexp2" value="不期待">
			     <input type="hidden" name="movie_no"  value="${movieinfoVO.movie_no}">
			     <input type="hidden" name="action"	value="noexp">
<!-- 			     </FORM> -->
			</td>
	</tr>
</table>
			</div>
		</div>
	</div>
	
	<script>
		$(".expect").click(function(){
			var element = $(this);
			$.ajax({
				type:"POST",
				url:"<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do",
				data:{
					"action":"exp",
					"movie_no":$(this).next().attr("value")
				},
				dataType:"json",
				success:function(response){
					var sum = parseInt(response.exp)+parseInt(response.noexp);
					console.log((parseInt(response.exp)/sum)*100);
					element.parent().text(parseInt((parseInt(response.exp)/sum)*100)+"%");
					$('#exp2').remove();
					$('#noexp2').parent().remove();
					$('#noexp2').remove();
									
				},
				error:function(data, textStatus, jqXHR){
					console.log('Ajax Error');
					console.log('data: ' + data);
					console.log('textStatus: '+ textStatus);
					console.log('jqXHR: ' + jqXHR);
				}
			});	
		});
	</script>
	
	<script>
		$(".noexpect").click(function(){
			var element = $(this);
			$.ajax({
				type:"POST",
				url:"<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do",
				data:{
					"action":"noexp",
					"movie_no":$(this).next().attr("value")
				},
				dataType:"json",
				success:function(response){
					var sum = parseInt(response.exp)+parseInt(response.noexp);
					console.log((parseInt(response.exp)/sum)*100);
					element.parent().text(parseInt((parseInt(response.exp)/sum)*100)+"%");
					$('#exp2').remove();
					$('#noexp2').parent().remove();
					$('#noexp2').remove();
									
				},
				error:function(data, textStatus, jqXHR){
					console.log('Ajax Error');
					console.log('data: ' + data);
					console.log('textStatus: '+ textStatus);
					console.log('jqXHR: ' + jqXHR);
				}
			});	
		});
	</script>

<!-- 工作區結束 -->
		
		<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
</body>
</html>
















