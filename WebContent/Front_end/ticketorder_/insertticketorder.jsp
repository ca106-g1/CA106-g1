
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="com.movieinfo.*"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS start-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Bootstrap CSS end-->
<title></title>
</head>
<body>
	<jsp:include page="/FrontHeaderFooter/Header.jsp" />
	<h1></h1>

	<!-- 工作區開始 -->

	<jsp:useBean id="movieinfoService"
		class="com.movieinfo.model.MovieInfoService" />
	<%
		pageContext.setAttribute("now", new java.sql.Date(System.currentTimeMillis()));
	%>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-4">
				<div>
					<p>選擇電影</p>
					<br> <select id="movie_no" name="movie_no">
						<c:forEach var="movieinfo" items="${movieinfoService.all}">
							<c:if
								test="${movieinfo.movie_in.before(now) && now.before(movieinfo.movie_out)}">
								<option value="${movieinfo.movie_no}">${movieinfo.movie_name}</option>
							</c:if>
						</c:forEach>

					</select>
				</div>

			</div>
			<div class="col-4">
				<p>選擇日期</p>
				<br> <select id="date" name="date">
				</select>
			</div>
			<div class="col-4">
				<p>選擇場次</p><br> 
				<select id="sessions" name="sessions">
				</select>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-4">電影圖片</div>
			<div class="col-4">
				<p>片名</p>
				<br>
				<p>敘述</p>
			</div>
			<div class="col-4">
				<p>剩餘座位</p>
				<br>
				<form>
					<input type="submit" name="" value="送出">
				</form>
			</div>

		</div>

	</div>
<script	src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		 $('#movie_no').change(function(){
			 $.ajax({
				 type: "GET",
				 url: "<%= request.getContextPath()%>/ticketorder/TicketorderServlet_",
				 data: creatQueryString(getdate, $(this).val(), ""),
				 dataType: "json",
				 success: function (data){
					clearSelect();
					$.each(data, function(i, item){
						$('#date').append("<option value='"+item.classId+"'>"+item.className+"</option>");
					});
			     },
	             error: function(){alert("AJAX-grade發生錯誤囉!")}
	         })
		 })
		 $('#date').change(function(){
			$.ajax({
				 type: "POST",
				 url: "<%= request.getContextPath()%>/ticketorder/TicketorderServlet_",
				 data: creatQueryString(getsessions, $('#movie_no').val(), $(this).val()),
				 dataType: "json",
				 success: function (data){
					 clearSelect2();
					 $.each(data, function(i, item){
						 $('#sessions').append("<option value='"+data[i].nameId+"'>"+data[i].name+"</option>");
					 });
			     },
	            error: function(){alert("AJAX-class發生錯誤囉!")}
	        })
		})
	})
	
	function creatQueryString(action, date, sessions){
		console.log("date:"+date+"; sessions:"+sessions);
		var queryString= {"action":action, "date":date, "sessions":sessions};
		return queryString;
	}
	function clearSelect(){
		$('#date').empty();
		$('#date').append("<option value='-1'>請選擇</option>");
		$('#sessions').empty();
		$('#sessions').append("<option value='-1'>請選擇</option>");
	}
	function clearSelect2(){
		$('#sessions').empty();
		$('#sessions').append("<option value='-1'>請選擇</option>");
	}
	</script>
	<!-- 工作區結束 -->

	<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script
		src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>