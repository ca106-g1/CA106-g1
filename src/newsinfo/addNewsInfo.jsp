<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.newsinfo.model.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<!-- 寫入圖片步驟1 -->

<%
  NewsInfoVO newsinfoVO = (NewsInfoVO) request.getAttribute("newsinfoVO");
%>

<html>
<head>
<!-- 寫入日曆步驟 -->
<link   rel="stylesheet" type="text/css" href="Expansion/jquery.datetimepicker.css" />
<script src="Expansion/jquery.js"></script>
<script src="Expansion/jquery.datetimepicker.full.js"></script>
<!-- 寫入日曆步驟 -->

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>addNewsInfo</title>

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
		 <h3>新聞資料新增</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/popcorn.jpg" width="52" height="62" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>新聞資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<!-- 寫入圖片步驟2 傳送方式用Post 並設定傳送格式enctype-->
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/newsinfo/newsinfo.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>電影編號:</td>
		<td><input type="TEXT" name="movie_no" size="45" 
			 value="<%= (newsinfoVO==null)? "*1" : newsinfoVO.getMovie_no()%>" /></td>
	</tr>
	<tr>
		<td>新聞標題:</td>
		<td><input type="TEXT" name="news_title" size="45"
			 value="<%= (newsinfoVO==null)? "這是一個新聞標題" : newsinfoVO.getNews_title()%>" /></td>
	</tr>
	<tr>
		<td>新聞作者:</td>
		<td><input type="TEXT" name="news_auther" size="45"
			 value="<%= (newsinfoVO==null)? "這是一個新聞作者" : newsinfoVO.getNews_auther()%>" /></td>
	</tr>
	<tr>
		<td>發文日期:</td>
		<td><input name="news_times" id="f_date1" type="text"></td>
	</tr>
	<tr>
		<td>新聞圖片:</td>
		<td><input type="file" name="news_pic"></td>
	</tr>
	<tr>
		<td>新聞內容:</td>
		<td><input type="TEXT" name="news_con" size="45"
			 value="<%= (newsinfoVO==null)? "這是一篇新聞內容" : newsinfoVO.getNews_con()%>" /></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-end/newsinfo/Expansion/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/back-end/newsinfo/Expansion/jquery.js"></script>
<script src="<%=request.getContextPath()%>/back-end/newsinfo/Expansion/jquery.datetimepicker.full.js"></script>

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
        
</script>
</html>