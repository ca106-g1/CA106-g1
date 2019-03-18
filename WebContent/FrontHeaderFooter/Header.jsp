<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="com.mem.model.*" %>
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
					
					
					
<!-- 子傑開始	 -->					
					
			<c:if test="${empty memVO}">
			
				<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownLoginButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" >登入</button>
					<div class="dropdown-menu" aria-labelledby="dropdownLoginButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/Login.jsp">會員登入</a> 
					</div>
				</div>
			
			</c:if>
			
				<!-- 以上為登入 -->
				
				<c:if test="${not empty memVO}">
				
				
				
				<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMemButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" >會員個人資料</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMemButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/mem/select_page.jsp">會員首頁</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/mem/listOneMem.jsp">會員資料查看</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/mem/update_mem_input.jsp">會員資料修改</a> 
					</div>
				</div>
				
				
					<li><a>Hello:
					<font color=#ea7500>${memVO.member_name}</font>您好
					</a></li>
					
					
					<div class="col-1">
					
					<FORM METHOD="POST" ACTION = "logoutHandler.do">
						<td><input type = "submit" value="登出">
						<input type = "hidden" name="logout" value="logout"> 
						</td>
					</FORM>
					
				</div>
				
				</c:if>
				
				<!-- 以上為登出 -->	
					
<!-- 子傑結束	 -->			
				
				
			</div>
		</div>
	</header>
	<div style="height:40px;">
	</div>
	
			

	

</body>
</html>