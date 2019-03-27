<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>MovieInfo: Home</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>

<style>
table#table-1 {
	width: 450px;
	background-color: #00caca;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1></h1>
	<br>

	<!-- 工作區開始 -->

	<div class="container">
		<div class="row justify-content">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h4>電影資訊編輯</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover mb-0 text-nowrap">
								<%-- 錯誤表列 --%>
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
								<tr>
									<th>All Movieinfos <a href='listAllMovieInfo.jsp'>EDIT</a>.
									</th>
								</tr>

								<tr>
									<th>In Theaters Movieinfos <a href='listAllMovieIn.jsp'>EDIT</a>.
									</th>
								</tr>

								<tr>
									<th><a href='addMovieInfo.jsp'>Add</a> a new MovieInfo.</th>
								</tr>

								<tr>
									<th>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/Back_end/movieinfo/movieinfo.do">
											<b>電影編號查詢 :</b> <input type="text" name="movie_no" size="20"
												placeholder="ex:MI00000001"> <input type="hidden"
												name="action" value="getOne_For_Display"> <input
												type="submit" value="送出">
										</FORM>
									</th>
								</tr>

								<jsp:useBean id="movieinfoSvc" scope="page"
									class="com.movieinfo.model.MovieInfoService" />

								<tr>
									<th><FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/Back_end/movieinfo/movieinfo.do">
											<b>電影編號查詢:</b> <select size="1" name="movie_no">
												<c:forEach var="movieinfoVO" items="${movieinfoSvc.all}">
													<option value="${movieinfoVO.movie_no}">${movieinfoVO.movie_no}
												</c:forEach>
											</select> <input type="hidden" name="action"
												value="getOne_For_Display"> <input type="submit"
												value="送出">
										</FORM></th>
								</tr>

								<tr>
									<th><FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/Back_end/movieinfo/movieinfo.do">
											<b>電影名稱查詢:</b> <select size="1" name="movie_no">
												<c:forEach var="movieinfoVO" items="${movieinfoSvc.all}">
													<option value="${movieinfoVO.movie_no}">${movieinfoVO.movie_name}
												</c:forEach>
											</select> <input type="hidden" name="action"
												value="getOne_For_Display"> <input type="submit"
												value="送出">
										</FORM></th>
								</tr>

							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- 工作區結束 -->

	<jsp:include page="/BackHeaderFooter/Footer.jsp" />




</body>
</html>