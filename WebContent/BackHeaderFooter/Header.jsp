<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
header{
position:fixed;
z-index:999;
}
</style>
</head>
<body>
<header class="container-fluid">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-1">
				
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownCinemaMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">廳院管理</button>						
					<div class="dropdown-menu" aria-labelledby="dropdownCinemaMenuButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/cinema/ListAllCinema.jsp">瀏覽廳院</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/cinema/insertCinema.jsp">新增廳院</a> 
					</div>
				</div>
					<!-- 以上管理廳院 -->
					
				<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">場次管理</button>						
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/session/listAllSession.jsp?action=all">瀏覽所有場次</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/session/listAllSession.jsp?action=effect">瀏覽有效場次</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/session/insertSession.jsp">新增場次</a> 
				</div>
					<!-- 以上管理場次-->
					
					
					
				</div>
			</div>
		</div>
	</header>
	<div style="height:40px;">
	</div>

</body>
</html>