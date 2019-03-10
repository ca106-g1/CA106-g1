<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.movieinfo.model.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>

<%
  MovieInfoVO movieinfoVO = (MovieInfoVO) request.getAttribute("movieinfoVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-end/movieinfo/Expansion/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/back-end/movieinfo/Expansion/jquery.js"></script>
<script src="<%=request.getContextPath()%>/back-end/movieinfo/Expansion/jquery.datetimepicker.full.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>updateMovieInfo</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
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
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>電影資料修改</h3>
		 <h4><a href="select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/movieinfo/images/popcorn.jpg" width="52" height="62" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>電影資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/movieinfo/movieinfo.do" name="form1" enctype="multipart/form-data">
<table>
			<tr>
				<td>電影種類:</td>
				<td><input type="TEXT" name="genre_no" size="45"
					value="<%=(movieinfoVO == null) ? "*1" : movieinfoVO.getGenre_no()%>" /></td>
			</tr>
			<tr>
				<td>電影名稱:</td>
				<td><input type="TEXT" name="movie_name" size="45"
					value="<%=(movieinfoVO == null) ? "這是一個電影名稱" : movieinfoVO.getMovie_name()%>" /></td>
			</tr>
			<tr>
				<td>電影分級:</td>
				<td><input type="file" name="movie_level"></td>
			</tr>
			<tr>
				<td>電影導演:</td>
				<td><input type="TEXT" name="movie_director" size="45"
					value="<%=(movieinfoVO == null) ? "這是一個電影導演" : movieinfoVO.getMovie_director()%>" /></td>
			</tr>
			<tr>
				<td>電影演員:</td>
				<td><input type="TEXT" name="movie_cast" size="45"
					value="<%=(movieinfoVO == null) ? "這是一個電影演員" : movieinfoVO.getMovie_cast()%>" /></td>
			</tr>
			<tr>
				<td>電影簡介:</td>
				<td><input type="TEXT" name="movie_intro" size="45"
					value="<%=(movieinfoVO == null) ? "這是一篇電影簡介" : movieinfoVO.getMovie_intro()%>" /></td>
			</tr>
			<tr>
				<td>片長:</td>
				<td><input type="TEXT" name="movie_length" size="45"
					value="<%=(movieinfoVO == null) ? "*1" : movieinfoVO.getMovie_length()%>" /></td>
			</tr>
			<tr>
				<td>預告片:</td>
				<td><input type="file" name="movie_trailer"></td>
			</tr>
			<tr>
				<td>封面:</td>
				<td><input type="file" name="movie_pic"></td>
			</tr>
			<tr>
				<td>上映時間:</td>
				<td><input name="movie_in" class="f_date1" type="text"></td>
			</tr>
			<tr>
				<td>下映時間:</td>
				<td><input name="movie_out" class="f_date1" type="text"></td>
			</tr>
			<tr>
				<td>票房:</td>
				<td><input type="file" name="movie_count"></td>
			</tr>
			<tr>
				<td>期待度:</td>
				<td><input type="TEXT" name="movie_exp" size="45"
					value="<%=(movieinfoVO == null) ? "這是一個期待度" : movieinfoVO.getMovie_exp()%>" /></td>
			</tr>
			<tr>
				<td>不期待度:</td>
				<td><input type="TEXT" name="movie_noexp" size="45"
					value="<%=(movieinfoVO == null) ? "這是一個不期待度" : movieinfoVO.getMovie_noexp()%>" /></td>
			</tr>
			<tr>
				<td>點擊次數:</td>
				<td><input type="TEXT" name="movie_touch" size="45"
					value="<%=(movieinfoVO == null) ? "*1" : movieinfoVO.getMovie_touch()%>" /></td>
			</tr>
			<tr>
				<td>片長加價:</td>
				<td><input type="TEXT" name="movie_ticket" size="45"
					value="<%=(movieinfoVO == null) ? "這是一個片長加價" : movieinfoVO.getMovie_touch()%>" /></td>
			</tr>
		</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="news_no" value="<%=movieinfoVO.getMovie_no()%>">
<input type="submit" value="送出修改"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
<%--  		   value: '<%=movieinfoVO.getMovie_times()%>', // value:   new Date(), --%>
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
        
</script>
</html>