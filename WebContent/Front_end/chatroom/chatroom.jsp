 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.movieinfo.model.*"%>
<%@ page import="com.moviegenre.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>

<%--  <%@ page import="java.util.*" %> --%>

<%
  MovieInfoVO movieinfoVO = new MovieInfoService().getOneMovieInfo(request.getParameter("movie_no")); 
  
  MovieGenreService moviegenreSvc = new MovieGenreService();
  pageContext.setAttribute("msc",moviegenreSvc);
  pageContext.setAttribute("movieinfoVO",movieinfoVO);
%>

<%
	MemVO memVO = (MemVO)session.getAttribute("memVO");
%>
<!doctype html>
<html lang="en">
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> -->


<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS start-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Bootstrap CSS end-->






<title>聊天室 - addEmp.jsp</title>

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


		<title>Chat Room</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Front_end/chatroom/css/styles.css" type="text/css"/>



</head>

<!-- 開始呼叫連線方法 -->
<body onload="connect();" onunload="disconnect();">

<!-- 這是Header -->
<jsp:include page="/FrontHeaderFooter/Header.jsp" />


<!-- <FORM METHOD="post" ACTION="adv.do" name="form1" enctype="multipart/form-data"> -->
<!-- <FORM METHOD="post" ACTION="adv.do" name="form1" enctype="multipart/form-data"> -->

<!-- 			<img id="preview_progressbarTW_img" src="#"  width="100px"   height="100px"  style = "display:none" /> -->
<%-- 			<input type="file" id="progressbarTWInput" name="ad_pic" size="25" accept="image/gif, image/jpeg, image/png" value="${advVO.ad_pic}"/> --%>


<!-- <br> -->
<!-- <input type="hidden" name="action" value="insert"> -->
<!-- <input type="submit" value="送出新增"> -->
<!-- </FORM> -->




<!-- 使用電影資訊的資料 -->
<table>
	<tr>
		<th>電影名稱</th>
		<th>電影種類</th>
		<th>電影封面</th>
		<th>電影分級</th>
		<th>電影導演</th>
		<th>電影演員</th>
		<th>電影片長</th>
		<th>電影預告片</th>
		<th>電影簡介</th>
	</tr>
	
	<tr>
			<td>${movieinfoVO.movie_name}</td>
<%-- 			<td>${msc.getOneGenre(movieinfoVO.genre_no).genre_name}</td> --%>
<!-- 新增movie_pic			 -->
			<c:set var="movie_pic" value="${movieinfoVO.movie_pic}"></c:set>
			<%
				byte b[]= (byte[])pageContext.getAttribute("movie_pic");
				String encode = null;
				if(b != null){
					encode = Base64.encode(b);
			%>
			<td><img id="pic" src="data:image/jpg;base64,<%=encode%>"></td>
			<%}else{%><td></td><%}%>
<!-- 新增movie_level -->			
			<c:set var="movie_level" value="${movieinfoVO.movie_level}"></c:set>
			<%
				byte c[]= (byte[])pageContext.getAttribute("movie_level");
				String encode1 = null;
				if(c != null){
					encode1 = Base64.encode(c);
			%>
			<td><img id="level" src="data:image/jpg;base64,<%=encode1%>"></td>
			<%}else{%><td></td><%}%>
			<td>${movieinfoVO.movie_director}</td>
			<td>${movieinfoVO.movie_cast}</td> 
			<td>${movieinfoVO.movie_length}</td>
			<td>${movieinfoVO.movie_trailer}</td>
			<td>${movieinfoVO.movie_intro}</td>
	</tr>
</table>



<!-- 這是聊天室 -->

		<h1> Chat Room </h1>
	    <h3 id="statusOutput" class="statusOutput"></h3>
        

        
<!--         這釋放聊天對話的地方 -->
<!--         <textarea id="messagesArea"  class="panel message-area" readonly ></textarea> -->
 <div id="messagesArea" class="panel message-area"  ></div> 
<!--         <h3 id="messagesArea" class="panel message-area"></h3> -->
        
        
        
        <div class="panel input-area">
<%--             <input id="userName" class="text-field" type="text" placeholder="使用者名稱" value="${memVO.member_no}"/> --%>
<!--        這是使用者名子 -->
           <h5> ${memVO.member_name}</h5>
            
            
            
<!--             這是對話輸入視窗 -->
        <form name = 'form' action = '#' method='post'>
            <textarea name="content" id="content" rows="10" cols="80"></textarea>
 		</form>
            
            
<!--              <input id="message"  class="text-field" type="text" placeholder="訊息" onkeydown="if (event.keyCode == 13) sendMessage();"/> -->
<!--             <input id="message" name="poscontent" rows="10" cols="80" class="text-field" type="text" placeholder="訊息" onkeydown="if (event.keyCode == 13) sendMessage();"/> -->
<%--             ${param.poscontent} --%>
            
            
            
<!--             <FORM METHOD="post" ACTION="adv.do" name="form1" enctype="multipart/form-data"> -->
<!-- 			<img id="preview_progressbarTW_img" src="#"  width="100px"   height="100px"  style = "display:none" /> -->
<!-- 			<input type="file" id="progressbarTWInput" name="ad_pic" size="25" accept="image/gif, image/jpeg, image/png" onchange='getBase64(this);'/> -->
<!-- 			<br> -->
			<!-- <input type="hidden" name="action" value="insert"> -->
<!-- 			<input type="submit" value="送出新增"> -->
<!-- 			</FORM> -->
            
            
            
            
<!--             這是送出 連線 離線 的按鈕 各自呼叫各自方法 -->
            <input type="submit" id="sendMessage" class="button" value="送出" onclick="sendMessage();"/>
		    <input type="button" id="connect"     class="button" value="連線" onclick="connect();"/>
		    <input type="button" id="disconnect"  class="button" value="離線" onclick="disconnect();"/>
	    </div>



<!--  <form name = 'form' action = '#' method='post'> -->
<!--             <textarea name="content" id="content" rows="10" cols="80"></textarea> -->
<!--             <input type = 'button' value = '送出' onclick = 'sendMessage()'> -->


<!--  </form> -->


<!-- <button onclick="appendit()">appendit</button>     -->
<!-- <TEXTAREA id="area" NAME="area" ROWS="20" COLS="26"></TEXTAREA> -->


<!-- <p>asdf</p> -->


<!-- 這是Footer -->
<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->


</body>


<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<!-- 呼叫CKEDITOR套件 -->
<script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
<%-- <script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script> --%>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>


<!-- CKEDITOR套件到指定欄位 -->
<script>
			CKEDITOR.replace( 'content', {});
</script>

 <script>
//    function processData(){
   // getting data
//    var data = CKEDITOR.instances.content.getData()
//    alert(data);
//   }

//  function appendit()    
// 	{ 
// 	var myarea = document.getElementById("area");    
// 	var img1 = new Image();    
// 	img1.src = "images/back1.gif";  
// 	alert(img1);
// 	myarea.appendChild(img1); 
// 	}  



 </script>







<script>
         	//	CKEDITOR.replace('poscontent');
</script>





<script>


// 這是預覽上傳圖片


$("#progressbarTWInput").ready(function(){

	  readURL(this);

	});
	

$("#progressbarTWInput").change(function(){

  readURL(this);

});



function readURL(input){
	
  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {
    	
       $("#preview_progressbarTW_img").attr('src', e.target.result);
       $("#preview_progressbarTW_img").removeAttr("style");
    }

    reader.readAsDataURL(input.files[0]);

  }

}

</script>


<!-- webSocket 前端程式碼 -->
<script>

// 	function getBase64(imgDOM){
// 		var file = imgDOM.files[0];
// 		var reader = new FileReader();
		
// 		reader.onload = (function(event){
// 			$('#preview_progressbarTW_img').attr('src', event.target.result);
// 		})
		
// 		reader.readAsDataURL(file);
// 	}
	
	
	
	
	

//     連線地址 用電影編號來方房
    var MyPoint = "/MyEchoServer/${param.movie_no}";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
    
	var statusOutput = document.getElementById("statusOutput");
	var webSocket;
	
// 	alert(MyPoint);
	
// 	var My = "${memVO.member_no}" 
// 		alert(My);
	
	
// 	webSocket 連線
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
			updateStatus("WebSocket 成功連線");
			document.getElementById('sendMessage').disabled = false;
			document.getElementById('connect').disabled = true;
			document.getElementById('disconnect').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var messagesArea = document.getElementById("messagesArea");
	        var jsonObj = JSON.parse(event.data);
	        var message = jsonObj.userName + ": " + jsonObj.message + "\r\n";
// 	        messagesArea.innerHTML = messagesArea.innerHTML + message;
// 	        messagesArea.value = messagesArea.value + message;
// 	        messagesArea.scrollTop = messagesArea.scrollHeight;
// 			document.write(message);
	
	
// 			把輸入的字串 回傳後 推播出來 放在<div>裡
			messagesArea.innerHTML = messagesArea.innerHTML + message;
	
// 	messagesArea.innerHTML = messagesArea.innerHTML + message + '<button>appendit</button>';

	        
	        messagesArea.scrollTop = messagesArea.scrollHeight;
		};

		webSocket.onclose = function(event) {
			updateStatus("WebSocket 已離線");
		};
	}
	
	
	var inputUserName = document.getElementById("userName");
	inputUserName.focus();
	
	function sendMessage() {
// 	    var userName = inputUserName.value.trim();
// 取到會員名子
		var userName = "${memVO.member_name}"
	    if (userName === ""){
	        alert ("使用者名稱請勿空白!");
	        inputUserName.focus();	
			return;
	    }
	    
// 	    var inputMessage = document.getElementById("message");
// 	    var message = inputMessage.value.trim();

// function processData(){
//    // getting data
//    var data = CKEDITOR.instances.content.getData()
//    alert(data);
//   }


// 			CKEDITOR.instances.content.setData('');

// 取到CKEDITOR裡輸入的資料 
	    var message = CKEDITOR.instances.content.getData()
	    
// 	    alert(message);
	    
// 	    清空CKEDITOR裡的資料
	    CKEDITOR.instances.content.setData('');
	    
// 	    判斷輸入資料不為空白後 送出
	    if (message === ""){
	        alert ("請勿空白!");
	        inputMessage.focus();	
	    }else{
	        var jsonObj = {"userName" : userName, "message" : message};
	        webSocket.send(JSON.stringify(jsonObj));
	        inputMessage.value = "";
	        inputMessage.focus();
	    }
	    
	    
	    
	    
// 	    CKEDITOR.instances.content.setData('');
	    
// 	    CKEDITOR.instances['content'].setData('');
// 	    document.getElementById('content').value = ""; 
	    
// 	    var inputMessage2 = document.getElementById("progressbarTWInput");
// 	    var message2 = inputMessage2.value.trim();
	    
// 	    if (message === "" && message2 === ""){
// 	        alert ("訊息請勿空白!");
// 	        inputMessage.focus();	
// 	    }else if (message === "" && message2 !== ""){
// 	    	 var jsonObj = {"userName" : userName, "message" : message2};
// 		        webSocket.send(JSON.stringify(jsonObj));
// 		        inputMessage.value = "";
// 		        inputMessage.focus();
	    	
	    	
// 	    }else if (message !== "" &&  message2 === ""){
// 	    	var jsonObj = {"userName" : userName, "message" : message};
// 	        webSocket.send(JSON.stringify(jsonObj));
// 	        inputMessage.value = "";
// 	        inputMessage.focus();
	    	
// 	    }else {
// 	        var jsonObj = {"userName" : userName, "message" : message};
// 	        webSocket.send(JSON.stringify(jsonObj));
// 	        inputMessage.value = "";
// 	        inputMessage.focus();
	        
// 	        var jsonObj = {"userName" : userName, "message" : message2};
// 	        webSocket.send(JSON.stringify(jsonObj));
// 	        inputMessage.value = "";
// 	        inputMessage.focus();
	        
// 	    }
	    
// 	    if (message2 === ""){
// 	        alert ("圖片請勿空白!");
// 	        inputMessage.focus();	
// 	    }else{
// 	        var jsonObj = {"userName" : userName, "message" : message2};
// 	        webSocket.send(JSON.stringify(jsonObj));
// 	        inputMessage.value = "";
// 	        inputMessage.focus();
// 	    }
	    
// 	    document.getElementById('preview_progressbarTW_img').style = "display:none";
	}

	
	function disconnect () {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}

	
	function updateStatus(newStatus) {
		statusOutput.innerHTML = newStatus;
	}
	
	 
    
</script>


</html>

