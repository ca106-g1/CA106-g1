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
<title>listoneMovieInfo</title>

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
  iframe{
	width:300px;
	hight:168px;  
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

		<!-- Bootstrap CSS start-->
		<link rel="stylesheet"
		href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
		<!-- Bootstrap CSS end-->

</head>
<body bgcolor='white'>
<jsp:include page="/BackHeaderFooter/Header.jsp" />
		<h1></h1><br>
		
		<!-- 工作區開始 -->

	<div class="container">
		<div class="row justify-content">
			<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4>電影資料</h4>
						</div>
						<div class="card-body">
							<form class="form-horizontal" >
								<div class="form-group row">
									<label class="col-md-3 col-form-label">編號</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_no}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">種類</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${msc.getOneGenre(movieinfoVO.genre_no).genre_name}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">名稱</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_name}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">封面</label>
									<div class="col-md-9">
										<c:set var="movie_pic" value="${movieinfoVO.movie_pic}"></c:set>
											<%
												byte b[]= (byte[])pageContext.getAttribute("movie_pic");
												String encode = null;
												if(b != null){
													encode = Base64.encode(b);
											%>
											<td><img id="pic" src="data:image/jpg;base64,<%=encode%>"></td>
											<%}else{%><td></td><%}%>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">分級</label>
									<div class="col-md-9">
										<c:set var="movie_level" value="${movieinfoVO.movie_level}"></c:set>
											<%
												byte c[]= (byte[])pageContext.getAttribute("movie_level");
												String encode1 = null;
												if(c != null){
													encode1 = Base64.encode(c);
											%>
											<td><img id="level" src="data:image/jpg;base64,<%=encode1%>"></td>
											<%}else{%><td></td><%}%>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">分數</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_score}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">導演</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_director}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">演員</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_cast}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">片長</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_length}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">上映時間</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_in}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">下映時間</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_out}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">期待度</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_exp}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">不期待度</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_noexp}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">片價加價</label>
									<div class="col-md-9">
										<input type="text" class="form-control" readonly="readonly" value="${movieinfoVO.movie_ticket}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">預告片</label>
									<div class="col-md-9">
										<td><iframe width="560" height="315" src="${movieinfoVO.movie_trailer}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">簡介</label>
									<div class="col-md-9">
										<textarea class="form-control" rows="6">${movieinfoVO.movie_intro}</textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 col-form-label">編輯</label>
									<div class="col-md-9">
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_end/newsinfo/newsinfo.do" style="margin-bottom: 0px;">
			     <button type="submit" class="btn btn-primary">修改</button>
			     <input type="hidden" name="news_no"  value="${newsinfoVO.news_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			     
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_end/newsinfo/newsinfo.do" style="margin-bottom: 0px;">
			     <button type="submit" class="btn btn-danger" onclick="history.back()">刪除</button>
			     <input type="hidden" name="news_no"  value="${newsinfoVO.news_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
	</div>
</div>

<!-- 工作區結束 -->

<jsp:include page="/BackHeaderFooter/Footer.jsp" />
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
		<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS end-->
</body>
</html>