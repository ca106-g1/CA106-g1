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
					</div>
				</div>
			
				<!--以上為訂票 -->
			
			
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
				
				
				<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMemIndexButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" >回首頁</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMemIndexButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Front_end/mem/select_page.jsp">回會員首頁</a>  
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
			
			
			</div>
		</div>
	</header>
	<div style="height:40px;">
	</div>

</body>
</html>