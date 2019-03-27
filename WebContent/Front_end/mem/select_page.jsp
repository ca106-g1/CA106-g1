<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<% 
		response.setHeader("Cache-Control","no-store");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader ("Expires",0);
	%>

<!doctype html>
<html lang="en">
	<head>
		<title></title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
		<style> 
		input[type="submit"] 
		{
			padding:5px 15px; background:white; border:1 none; color:#969696;
			cursor:pointer;
			-webkit-border-radius: 5px;
			border-radius: 5px; 
		}
		
		.row {
		  display: flex;
		  flex-wrap: wrap;
		}
		</style>
	</head>
	<body>
		<jsp:include page="/FrontHeaderFooter/FrontBootstrapHeaderFooter/Header.jsp" />
		<h1></h1>
	
		<!-- 工作區開始 -->
	
	
		<div class="container">
			<div class="row" >
			  <div class="col-2">
			    <div class="btn-group-vertical"  style="margin-top:70px;">
				   <button type="button" class="btn btn-primary iframe_contruler" data-href="<%=request.getContextPath()%>/Front_end/mem/memNotice.jsp">會員首頁</button>
			 	   <button type="button" class="btn btn-outline-secondary iframe_contruler" data-href="<%=request.getContextPath()%>/Front_end/mem/listOneMem.jsp">會員資料查看</button>
			 	   <button type="button" class="btn btn-outline-secondary iframe_contruler" data-href="<%=request.getContextPath()%>/Front_end/mem/update_mem_input2.jsp">個人資料修改</button>
			 	   <button type="button" class="btn btn-outline-secondary iframe_contruler" data-href="<%=request.getContextPath()%>/Front_end/ticketorder_/listOneTic_Mem2.jsp">購票紀錄查詢</button>
			 	   <button type="button" class="btn btn-outline-secondary iframe_contruler" data-href="<%=request.getContextPath()%>/Front_end/dep/listOneDep_Mem.jsp">Join儲值錢包查詢</button>
			 	   <button id="actionForm" type="button" class="btn btn-outline-secondary">Join儲值錢包新增</button>
				</div>
			  </div>
			  <div class="col-10">
			  <iframe id="iframe" src="" style="width: 100%; border-width: 0px; height: 600px"></iframe>
			  </div>
			</div>
		</div>
		<FORM id="form" METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/dep/dep.do">
			<input type = "hidden" name="member_no" value="${memVO.member_no}">
			<input type = "hidden" name="action" value="insert_Token">
		</FORM> 
	<!-- 	工作區結束 -->
		<script>
		
		$(document).ready(init);
		
		function init(){
			$('#actionForm').click(
					function(e){
						$('#form').submit();
						});
			$('.iframe_contruler').click(
					function(e) {
						var src = $(this).attr('data-href');
						$('#iframe').attr('src', src);
					});
		}
		</script>
		
		<jsp:include page="/FrontHeaderFooter/FrontBootstrapHeaderFooter/Footer.jsp" />
	
	</body>
</html>