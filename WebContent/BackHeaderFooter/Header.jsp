<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="com.emp.model.*" %>
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
		<div>
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
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/sessions/listAllSessions.jsp?action=all">瀏覽所有場次</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/sessions/listAllSessions.jsp?action=effect">瀏覽有效場次</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/sessions/select_date.jsp">新增場次</a> 
				</div>
				</div>
					<!-- 以上管理場次-->
					
					
					
					
					<div class="col-1">
				
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="EmployeeButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">員工管理</button>						
					<div class="dropdown-menu" aria-labelledby="EmployeeButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/emp/select_page.jsp">管理首頁</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/emp/listAllEmp.jsp">員工瀏覽</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/emp/addEmp.jsp">新增員工</a> 
					</div>
				</div>
					
					<!-- 以上員工管理 -->
					
					
					
					<div class="col-1">
				
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="EmployeeButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">會員管理</button>						
					<div class="dropdown-menu" aria-labelledby="EmployeeButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/mem/select_page.jsp">管理首頁</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/emp/listAllMem.jsp">會員瀏覽</a> 
					</div>
				</div>
					
					<!-- 以上會員管理 -->
					
					
					
					<div class="col-1">
				
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="EmployeeButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">儲值管理</button>						
					<div class="dropdown-menu" aria-labelledby="EmployeeButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/dep/select_page.jsp">管理首頁</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/dep/listAllDep.jsp">儲值明細瀏覽</a> 
					</div>
				</div>
					
					<!-- 以上儲值管理 -->
					
					
					<c:if test="${empty empVO}">
					
					
					<div class="col-1">
				
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="Employee_Home_IndexButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">員工登入</button>						
					<div class="dropdown-menu" aria-labelledby="Employee_Home_IndexButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/empLogin.jsp">員工登入</a> 
					</div>
				</div>
				
				</c:if>
					
					
					<!-- 以上員工登入 -->
					
					<c:if test="${not empty empVO}">
					
					
					
					
					<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMemIndexButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" >回首頁</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMemIndexButton">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/emp/homeIndex.jsp">回員工首頁</a>  
					</div>
				</div>
					
					
					
					
					
					<li><a>Hello:
					<font color=#ea7500>${empVO.employee_name}</font>您好
					</a></li>
					
					
					<div class="col-1">
				
<!-- 					<button class="btn btn-secondary dropdown-toggle" type="button" -->
<!-- 						id="Employee_Home_IndexButton" data-toggle="dropdown" -->
<!-- 						aria-haspopup="true" aria-expanded="false">員工登出</button>						 -->
<!-- 					<div class="dropdown-menu" aria-labelledby="Employee_Home_IndexButton"> -->
<%-- 						<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/empLogin.jsp">員工登出</a>  --%>
<!-- 					</div> -->



					<FORM METHOD="POST" ACTION = "logoutHandler.do">
						<td><input type = "submit" value="登出">
						<input type = "hidden" name="logout" value="logout"> 
						</td>
					</FORM>
					
				</div>
				
				</c:if>
					
					
					
					<!-- 以上員工登出 -->
					
					
					
					
					
					
					
					
					
					
					
			</div>
		</div>
	</header>
	<div style="height:80px;">
	</div>

</body>
</html>