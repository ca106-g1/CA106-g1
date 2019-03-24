<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
header {
	position: fixed;
	z-index: 999;
}

input [type="submit"] {
	padding: 5px 15px;
	background: white;
	cursor: pointer;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

body {
	background-image: url('img/background3.jpg');
	background-repeat: no-repeat;
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
					<div class="dropdown-menu"
						aria-labelledby="dropdownCinemaMenuButton">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/cinema/ListAllCinema.jsp">瀏覽廳院</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/cinema/insertCinema.jsp">新增廳院</a>
					</div>
				</div>
				<!-- 以上管理廳院 -->

				<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">場次管理</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/sessions/listAllSessions.jsp?action=all">瀏覽所有場次</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/sessions/listAllSessions.jsp?action=effect">瀏覽有效場次</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/sessions/select_date.jsp">新增場次</a>
					</div>
				</div>
				<!-- 以上管理場次-->

				<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">電影種類管理</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/moviegenre/listAllMovieGenre.jsp">瀏覽所有電影種類</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/moviegenre/addMovieGenre.jsp">新增電影種類</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/moviegenre/select_page.jsp">電影種類管理</a>
					</div>
				</div>
				<!-- 以上管理電影種類-->

				<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">電影資訊管理</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/movieinfo/listAllMovieInfo.jsp">瀏覽所有電影</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/movieinfo/listAllMovieIn.jsp">瀏覽有效電影</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/movieinfo/addMovieInfo.jsp">新增電影</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/movieinfo/select_page.jsp">電影管理</a>
					</div>
				</div>
				<!-- 以上管理電影資訊-->

				<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">影視新聞管理</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/newsinfo/listAllNewsInfo.jsp">瀏覽所有新聞</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/newsinfo/addNewsInfo.jsp">新增新聞</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/newsinfo/select_page.jsp">新聞管理</a>
					</div>
				</div>
				<!-- 以上管理影視新聞-->


				<div class="col-1">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownAdvButton" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">廣告管理</button>
					<div class="dropdown-menu" aria-labelledby="dropdownAdvButton">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/adv/listAllAdv.jsp">瀏覽所有廣告</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/adv/addAdv.jsp">新增廣告</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/adv/select_page_adv.jsp">廣告管理</a>
					</div>
				</div>
				<!-- 以上管理廣告-->




				<!-- 子傑開始	 -->



				<div class="col-1">

					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="EmployeeButton" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">員工管理</button>
					<div class="dropdown-menu" aria-labelledby="EmployeeButton">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/emp/select_page.jsp">管理首頁</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/emp/listAllEmp.jsp">員工瀏覽</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/emp/addEmp.jsp">新增員工</a>
					</div>
				</div>

				<!-- 以上員工管理 -->



				<div class="col-1">

					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="EmployeeButton" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">會員管理</button>
					<div class="dropdown-menu" aria-labelledby="EmployeeButton">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/mem/select_page.jsp">管理首頁</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/mem/listAllMem.jsp">會員瀏覽</a>
					</div>
				</div>

				<!-- 以上會員管理 -->



				<div class="col-1">

					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="EmployeeButton" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">儲值管理</button>
					<div class="dropdown-menu" aria-labelledby="EmployeeButton">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/dep/select_page.jsp">管理首頁</a>
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/Back_end/dep/listAllDep.jsp">儲值明細瀏覽</a>
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
							aria-haspopup="true" aria-expanded="false">回首頁</button>
						<div class="dropdown-menu"
							aria-labelledby="dropdownMemIndexButton">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/Back_end/emp/homeIndex.jsp">回員工首頁</a>
						</div>
					</div>





					<li><a>Hello: <font color=#ea7500>${empVO.employee_name}</font>您好
					</a></li>


					<div class="col-1">

						<button class="btn btn-secondary dropdown-toggle" type="button" id="Employee_Home_IndexButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						員工登出</button>
						<div class="dropdown-menu" aria-labelledby="Employee_Home_IndexButton">
							<a class="dropdown-item" href="<%=request.getContextPath()%>/Back_end/empLogin.jsp">員工登出</a>
						</div>



						<FORM METHOD="POST" ACTION="<%=request.getContextPath()%>/Back_end/emp/logoutHandler.do">
							<input type="submit" value="登出"> 
							<input type="hidden" name="action" value="logout"></td>
						</FORM>

					</div>

				</c:if>



				<!-- 以上員工登出 -->











			</div>
		</div>
	</header>
	<div style="height: 80px;"></div>

</body>
</html>