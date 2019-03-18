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
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">訂票</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/ticketorder_/choiseSessions.jsp">線上訂票</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/ticketorder_/prompt.jsp">訂票須知</a> 
					</div>
				</div>
				
				<!-- 以上是訂票功能 -->
				
			<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">電影簡介</button>						
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/movieinfo/upComingListAll.jsp">即將上映</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/movieinfo/listAllMovieInfo.jsp">現正熱映</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/movieinfo/hotMovie.jsp">熱門電影推薦</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/movieinfo/rankMovie.jsp">年度電影推薦</a> 
					</div>
			</div>
					<!-- 以上是電影簡介功能-->

			<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">影視新聞</button>						
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/newsinfo/listAllNewsInfo.jsp">影視新聞</a> 
					</div>
			</div>
					<!-- 以上是影視新聞功能-->
					
					
			<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownIndexButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">聊天室</button>						
					<div class="dropdown-menu" aria-labelledby="dropdownIndexButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/index/room.jsp">聊天室列表</a> 
					</div>
			</div>
					<!-- 以上是聊天室功能-->		
					
			
				
				
			</div>
		</div>
	</header>
	<div style="height:40px;">
	</div>
	
			

	

</body>
</html>