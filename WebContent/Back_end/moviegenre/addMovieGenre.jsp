<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.moviegenre.model.*"%>

<%
  MovieGenreVO moviegenreVO = (MovieGenreVO) request.getAttribute("moviegenreVO");
%>

<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>

		<title>addMovieGenre</title>
	
		<style>
		  table#table-1 {
			background-color: #00caca;
		    border: 2px solid black;
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
		  
		  table {
			width: 450px;
			background-color: white;
			margin-top: 1px;
			margin-bottom: 1px;
		  }
		  
		  table, th, td {
		    border: 0px solid #CCCCFF;
		  }
		  
		  th, td {
		    padding: 1px;
		  }
		  
		</style>
		
		<!-- Bootstrap CSS start-->
		<link rel="stylesheet"
		href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
		<!-- Bootstrap CSS end-->
	</head>

	<body bgcolor='white'>
		<jsp:include page="/BackHeaderFooter/Header.jsp" />
		<h1></h1><br>
		
		<!-- 工作區開始 -->

	<div class="container">
		<div class="row justify-content">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h4>電影種類新增</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover mb-0 text-nowrap">
							<%-- 錯誤表列 --%>
								<c:if test="${not empty errorMsgs}">
									<font style="color:red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color:red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
								
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_end/moviegenre/moviegenre.do" name="form1">
								<tr>
									<td nowrap=nowrap>電影種類名稱:<font color=red size="2"><b>*</b></font></td>
									<td>
										<input type="TEXT" name="genre_name" size="30" placeholder="ex:Action" />
									</td>
								</tr>
								
								<tr>
									<td><input type="hidden" name="action" value="insert"></td>
									<td><button type="submit" class="btn btn-primary">送出</button>
									<button type="submit" class="btn btn-danger" onclick="history.back()">取消</button> </td>
								</tr>
</FORM>
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