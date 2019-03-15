  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "com.mem.model.* , java.util.*"  %>

<%
	MemVO memVO = (MemVO) request.getAttribute("memVO");
%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS start-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Bootstrap CSS end-->
<title>Join影城註冊頁面</title>
</head>
<body>
	<jsp:include page="/FrontHeaderFooter/Header.jsp" />
	<h1></h1>

	<!-- 工作區開始 -->
	
<div><h1>Join揪影註冊頁面</h1></div>
	
<%--錯誤表列 --%>

<c:if test = "${not empty errorMsgs }">
	<font style ="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
		<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
	
	
<form action = "mem.do" method = "post" name="form1" enctype="multipart/form-data">

<br>

<p>*帳號: 
<input type = "text"  name = "member_account" value="<%= (memVO==null)?"":memVO.getMember_account()%>" autofocus> </p>

<p>*密碼: 
<input type = "password"  name = "member_password" value="<%= (memVO==null)?"":""%>"  required> </p>

<p>*再次確認密碼:
<input type = "password"  name = "member_password1" value="<%= (memVO==null)?"":""%>"  required> </p>

<p>*姓名:
<input type = "text"  name = "member_name" value="<%= (memVO==null)?"":memVO.getMember_name()%>"> </p>

<p>暱稱:
<input type = "text"  name = "member_nick" value="<%= (memVO==null)?"":memVO.getMember_nick()%>"> </p>

<p>*性別:<input type = "radio" name = "member_sex" value = "1" ${(memVO.member_sex==1)? "checked": ""} >男性
	   <input type = "radio" name = "member_sex" value = "0" ${(memVO.member_sex==0)? "checked": ""} >女性
</p>

	<%
	java.sql.Date member_birthday = null;
	try{
		member_birthday = memVO.getMember_birthday();
	}catch (Exception e){
		member_birthday = new java.sql.Date(System.currentTimeMillis());
	}
%>


<p>*生日:
<input type="date" name="member_birthday" id="f_date" value="<%= (memVO==null)? member_birthday:memVO.getMember_birthday()%>"></p>


<% String[] arrayCity  = new String[] {"台北市","基隆市","新北市","桃園市","新竹市","新竹縣","苗栗縣","台中市","彰化縣","南投縣","雲林縣","嘉義縣","台南市","高雄市","屏東縣","宜蘭縣","花蓮縣","台東縣","澎湖縣","金門縣","連江縣"};
 	List<String> listCity = Arrays.asList(arrayCity);  
 	pageContext.setAttribute("listCity", listCity);
 %>


<p>*地址:
<div class="container" >
	<div class="row">
    	<div class="col">
			<div class="dropdown">
	  
	  <select id="twCityName">
			  <option >--請選擇縣市--</option>
			  <c:forEach var="city" items="${listCity}">
			  	<option value="${city}">${city}</option>
			  </c:forEach>
	  </select>
	  
	  <select id="CityAreaName" >
			  <option >--請選擇區域--</option>
	  </select>
			    
      <select id="AreaRoadName" >
			  <option >--請選擇路名--</option>
	  </select>	    
	  
	  <input type="text" placeholder="請輸入門牌號碼" id="num">
	  
	  <input type="button" value="確認" id="btnLoc">		    			    
			</div>
		</div>
	</div>
	<div class="row">
		 <input id="addressTotal" type="text" name="member_address" size="50" >   
	</div>

	</div>
	</p>

<p>*電話:
<input type = "tel"  name = "member_telephone" value="<%= (memVO==null)?"":memVO.getMember_telephone()%>"> </p>

<p>*信箱: 
<input type = "email"  name = "member_email" value="<%= (memVO==null)?"":memVO.getMember_email()%>"> </p>

<p>會員圖像: 
<input type = "file" id = "img" name = "member_picture"> </p>

<p>信用卡號碼:
<input type = "text"  name = "member_credit_number" value="<%= (memVO==null)?"":memVO.getMember_credit_number()%>"> </p> 

<p>背面後三碼: 
<input type = "text"  name = "member_back_verification" value="<%= (memVO==null)?"":memVO.getMember_back_verification()%>"> </p>

<input type = "hidden"  name = "member_status" value="0"> 

<p><input type = "hidden" name="action" value="insert">
   <input type = "submit" id="send" value = "送出"> &nbsp;&nbsp;
   <input type = "reset"   value = "取消">
  
   <a href = "<%=request.getContextPath()%>/Front_end/Login.jsp">回到首頁</a>
</p>







</form>


	<!-- 工作區結束 -->
	
	
	
	
	
	
	
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
	<script> 

$(document).ready(function(){
	
	$("#twCityName").change(function(){
		$.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/Json2Read",
			 data: {"action":"twCityName",
				 	"twCityName":$('#twCityName option:selected').val()},
			 dataType: "json",
			 success: function(result){
				 $("#CityAreaName").empty();
				
				 $("#CityAreaName").append("<option >--請選擇區域--</option>")
				 for(var i=0; i<result.length; i++){
				 	$("#CityAreaName").append('<option value="'+result[i]+'">'+result[i]+'</option>');
				 }
			 },
	         error: function(){
	        	 alert("AJAX-grade發生錯誤囉!")
	        	 }
	    });
	});
	
	$("#CityAreaName").change(function(){
		$.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/Json2Read",
			 data: {"action":"CityAreaName",
				 	"twCityName":$('#twCityName option:selected').val(),
				 	"CityAreaName":$('#CityAreaName option:selected').val()},
			 dataType: "json",
			 success: function(result){
				 $("#AreaRoadName").empty();
				 $("#AreaRoadName").append("<option >--請選擇區域--</option>")
				 for(var i=0; i<result.length; i++){
				 	$("#AreaRoadName").append('<option value="'+result[i]+'">'+result[i]+'</option>');
				 }
			 },
	         error: function(){
	        	 alert("AJAX-grade發生錯誤囉!")
	        	 }
	    });
	});
	
	
	$("#btnLoc").click(function(){
		
		var twCityName = ($('#twCityName').get(0).selectedIndex)>0? $('#twCityName option:selected').val() :'';
		
		var CityAreaName = ($('#CityAreaName').get(0).selectedIndex)>0? $('#CityAreaName option:selected').val() :'';
		
		var AreaRoadName = ($('#AreaRoadName').get(0).selectedIndex)>0? $('#AreaRoadName option:selected').val() :'' ;
		
		var num = $('#num').val().trim().length != 0 ? $('#num').val()+"號" :'' ; 

		var locTotal = twCityName+CityAreaName+AreaRoadName+num;
		$("#addressTotal").attr("value",locTotal);
		
	});	
})


</script>
	
	<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>