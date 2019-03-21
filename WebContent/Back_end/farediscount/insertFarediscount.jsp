<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap CSS start-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
	<!-- Bootstrap CSS end-->
	<title></title>
</head>
<body>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1></h1>

	<!-- 工作區開始 -->
	<div class="container">
		<div class="row justify-content">
			<div class="col-4">
			
			</div>
			<div class="col-4">
				<div class="row justify-content">
				<from action="" method="">
					<div class="col-6">
					
						<p>優惠名稱</p>
						<p>優惠折扣</p>
						<p>優惠起始時間</p>
						<p>優惠結束時間</p>
						<p>優惠人數上限</p>
						<p>優惠人數下限</p>
					
					</div>
					
					<div class="col-6">
					
					<input type="text" name="fd_name">
					<input type="number" name="fd_offer">
					<input type="text" name="fd_start">
					<input type="text" name="fd_end">
					<input type="text" name="fd_upper">
					<input type="text" name="fd_lower">
					
					
					</div>
				</from>
					
				</div>
			</div>
			<div class="col-4">
			
			</div>
		</div>
	</div>
	
	<% 
	  java.sql.Date hiredate =new java.sql.Date(System.currentTimeMillis()+24*60*60*1000);
	  java.sql.Date hiredate2 =new java.sql.Date(System.currentTimeMillis()+2*24*60*60*1000);
	%>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Back_end/sessions/datetimepicker/jquery.datetimepicker.css"/>
	<script src="<%=request.getContextPath()%>/Back_end/sessions/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/Back_end/sessions/datetimepicker/jquery.datetimepicker.full.js"></script>
	
	<style>
	  .xdsoft_datetimepicker .xdsoft_datepicker {
	           width:  300px;   /* width:  300px; */
	  }
	  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	           height: 151px;   /* height:  151px; */
	  }
	</style>
	
	<script>
	        $.datetimepicker.setLocale('zh');
	        
	        $('#fd_start').datetimepicker({
	 	       theme: '',              //theme: 'dark',
		       timepicker:false,       //timepicker:true,
		       //step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
		       format:'Y-m-d',         //format:'Y-m-d H:i:s',
			   value: '<%=hiredate%>', // value:   new Date(),
	           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	           //startDate:	            '2017/07/10',  // 起始日
	           minDate:               '<%=hiredate%>', // 去除今日(不含)之前
	           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	        });
	        
	        $('#fd_end').datetimepicker({
		 	       theme: '',              //theme: 'dark',
			       timepicker:false,       //timepicker:true,
			       //step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
			       format:'Y-m-d',         //format:'Y-m-d H:i:s',
				   value: '<%=hiredate2%>', // value:   new Date(),
		           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		           //startDate:	            '2017/07/10',  // 起始日
		           minDate:               '<%=hiredate%>', // 去除今日(不含)之前
		           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		      });
	</script>
	<!-- 工作區結束 -->
	
	<jsp:include page="/BackHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>