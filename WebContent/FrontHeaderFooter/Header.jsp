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
				<div class="col-5">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">訂票</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/ticketorder_/choiseSessions.jsp">線上訂票</a> 
					</div>
				</div>
			</div>
		</div>
	</header>
	<div style="height:40px;">
	</div>

</body>
</html>