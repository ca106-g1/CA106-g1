<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adv.model.*"%>
<%@ page import="java.util.*"%>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	AdvVO advVO = (AdvVO) request.getAttribute("advVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneAdv.jsp</title>

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
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white' onload="connect();">

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneAdv.jsp</h3>
		 <h4><a href="select_page_adv.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>


<table>
	<tr>
		<th>廣告編號</th>
		<th>廣告名稱</th>
		<th>廣告圖片</th>
		<th>廣告內容</th>
		<th>廣告起始時間</th>
		<th>廣告終止時間</th>
		<th>廣告狀態</th>
		<th>推播</th>
	</tr>
	

	
	<tr>
			<td>${advVO.ad_no}</td>
			<td>${advVO.ad_name}</td>
			<td>
				<c:if test="${empty advVO.ad_pic}" var="condition">
				<img src="<%=request.getContextPath()%>/Back_end/adv/images/no_pic.jpg" width="200" height="200"/>
				</c:if>
			    <c:if test="${not empty advVO.ad_pic}" var="condition">
			    <img  src='<%=request.getContextPath()%>/Back_end/adv/adv.do?ad_no=${advVO.ad_no}' width='200' height='200' />
				</c:if>
			</td>
			<td>${advVO.ad_cont}</td>
			<td>${advVO.ad_start}</td>
			<td>${advVO.ad_end}</td> 
			<td>
<%-- 			${advVO.ad_type} --%>
				 <c:if test="${advVO.ad_type==0}" var="condition">
				下架
				</c:if>
				<c:if test="${advVO.ad_type==1}" var="condition">
				上架
				</c:if>
			</td>
			<td>
					<button type='button' id='me' onclick="sendMessage();">推播</button>
			</td>
	</tr>
	
	
</table>



<h3 id="statusOutput" class="statusOutput"></h3>



</body>
</html>



<script>

	

    
    var MyPoint = "/MyEchoServer/peter/309";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
    
	var statusOutput = document.getElementById("statusOutput");
	var webSocket;
	
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
	
	        alert(message);
// 	        messagesArea.innerHTML = messagesArea.innerHTML + message;
	

	        
// 	        messagesArea.scrollTop = messagesArea.scrollHeight;
		};

		webSocket.onclose = function(event) {
			updateStatus("WebSocket 已離線");
		};
	}
	
	
	var inputUserName = document.getElementById("userName");
	inputUserName.focus();
	
	function sendMessage() {
// 	    var userName = inputUserName.value.trim();
// 	    if (userName === ""){
// 	        alert ("使用者名稱請勿空白!");
// 	        inputUserName.focus();	
// 			return;
// 	    }
	    
 
		var message = '${advVO.ad_name}';
		alert(message);
// 	    var message = CKEDITOR.instances.content.getData()
	    
	    
// 	    CKEDITOR.instances.content.setData('');
	    
	    
	    if (message === ""){
	        alert ("請勿空白!");
	        inputMessage.focus();	
	    }else{
// 	        var jsonObj = {"userName" : userName, "message" : message};
	        var jsonObj = {"message" : message};
	        webSocket.send(JSON.stringify(jsonObj));
	        inputMessage.value = "";
	        inputMessage.focus();
	    }
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