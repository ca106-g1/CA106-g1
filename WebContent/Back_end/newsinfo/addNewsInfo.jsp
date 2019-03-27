<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.newsinfo.model.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<!-- 寫入圖片步驟1 -->

<%
	NewsInfoVO newsinfoVO = (NewsInfoVO) request.getAttribute("newsinfoVO");
%>

<html>
<head>
<script
	src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
<!-- ckeditor -->
	<script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>		

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Back_end/movieinfo/Expansion/jquery.datetimepicker.css" />


<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>addNewsInfo</title>

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

img, #level {
	width: 50px;
	hight: 50px;
}

#pic {
	width: 270px;
	hight: 400px;
}

#popcorn {
	width: 52;
	height: 62;
}
</style>

<style>
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

#button {
	hight: 20;
	width: 20;
}
</style>

<!-- Bootstrap CSS start-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Bootstrap CSS end-->

</head>
<body bgcolor='white'>

	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1></h1>
	<br>

	<!-- 工作區開始 -->
	<div class="container">
		<div class="row justify-content">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h4>電影新增</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover mb-0 text-nowrap">
								<%-- 錯誤表列 --%>
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_end/newsinfo/newsinfo.do" name="form1" enctype="multipart/form-data">
								<tr>
									<td nowrap="nowrap">電影名稱:</td>
									<td><select name="movie_no">
											<c:forEach var="genrename" items="${listgenre}" varStatus="s">
												<option value="${s.count}">${genrename.genre_name}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td nowrap="nowrap">專欄標題:<font color=red><b>*</b></font></td>
									<td><input type="TEXT" name="news_title" size="45"
										value="<%=(newsinfoVO == null) ? "請輸入專欄標題" : newsinfoVO.getNews_title()%>" /></td>
								</tr>
								<tr>
									<td nowrap="nowrap">專欄作者:<font color=red><b>*</b></font></td>
									<td><input type="TEXT" name="news_auther" size="45"
										value="<%=(newsinfoVO == null) ? "請輸入專欄作者" : newsinfoVO.getNews_auther()%>" /></td>
								</tr>
								<tr>
									<td nowrap="nowrap">發文日期:<font color=red><b>*</b></font></td>
									<td><input name="news_times" id="f_date1" type="text"></td>
								</tr>
								<tr>
									<td nowrap="nowrap">專欄圖片:</td>
									<td><input type="file" name="news_pic"
										onchange='readURL(this)'> <img id="pic" class='pic'
										src='data:img/png;base64,${encodeText}'
										${(newsinfoVO.news_pic==null) ? 'style="display:none"' : ''}></td>
								</tr>
								<tr>
									<td nowrap="nowrap">專欄內容:<font color=red><b>*</b></font></td>
									<td><textarea name="news_con" rows="10" cols="80"><%=(newsinfoVO == null) ? "請輸入專欄內容" : newsinfoVO.getNews_con()%></textarea>
										<script> CKEDITOR.replace('news_con'); </script>
									</td>
								</tr>
								
								<tr>
								<td><input type="hidden" name="action" value="insert"></td>
								<td><button type="submit" class="btn btn-primary">送出</button>
								<button type="submit" class="btn btn-danger" onclick="history.back()">取消</button></td>
								</tr>
								</FORM>
							</table>
						</div>
					</div>
				</div>
			</div>

	<!-- 工作區結束 -->
	<jsp:include page="/BackHeaderFooter/Footer.jsp" />

</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%
	//   java.sql.Date news_times = null;
	//   try {
	// 	    news_times = newsinfoVO.getNews_times();
	//    } catch (Exception e) {
	// 	    news_times = new java.sql.Date(System.currentTimeMillis());
	//    }
%>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>
<script
	src="<%=request.getContextPath()%>/Back_end/movieinfo/Expansion/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/Back_end/movieinfo/Expansion/jquery.datetimepicker.full.js"></script>
<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
<%-- 		   value: '<%=news_times%>', // value:   new Date(), --%>
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
        
//         立即顯示圖片
        function readURL(input) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(".pic").attr('src', e.target.result).css("display", "");

			}
			reader.readAsDataURL(input.files[0]);
		}
        
</script>
</html>