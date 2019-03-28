<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>rankMovieList</title>
<!-- Bootstrap CSS start-->
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Bootstrap CSS end-->
</head>
<body>
	<jsp:include page="/FrontHeaderFooter/FrontBootstrapHeaderFooter/Header.jsp" />
	<h1></h1>
	<br>

	<!-- 工作區開始 -->
	<div class="container">
			<div class="row justify-content">
				<div class="col-1"></div>
				<div class="col-10">
					<table id="table-1">
						
					</table>
				</div>
				<div class="col-1"></div>
			</div>
			
			<div class="row justify-content">
				<div class="col-1"></div>
				<div class="col-10">
					<div class="row justify-content">
						<%
						Calendar cal = new GregorianCalendar();
						cal.setTime(new java.util.Date());
						int now_year = cal.get(Calendar.YEAR);
						
						for(int i = 2008; i <= now_year; i++){ 
						%>
							<div class="col-1">
								<button type="button" class="btn btn-dark" id="<%=i %>"><%=i %>年</button>
<%-- 								<div class="btn btn-primary btn-sm" id="<%=i %>"><%=i %>年</div> --%>
							</div>	
						<%} %>		
					</div>
				</div>
				<div class="col-1"></div>
			</div>
	</div>
					<div id="load"></div>
					
					

	<!-- 工作區結束 -->

	<jsp:include page="/FrontHeaderFooter/FrontBootstrapHeaderFooter/Footer.jsp" />
<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->	
</body>

<script>
$(document).ready(init);
	function init(){
		var years = <%=now_year%>;
		for(var i = 2008; i<= years; i++){
			var element = $('#'+i);
			element.click(
				function(){
					$('#load').load(
						'<%=request.getContextPath()%>/Front_end/movieinfo/rankMovie.jsp?year_in='+$(this).attr('id')+'-01-01&year_out='+(parseInt($(this).attr('id'))+1)+'-01-01');
					}
				);
		}
	}
</script>

</html>