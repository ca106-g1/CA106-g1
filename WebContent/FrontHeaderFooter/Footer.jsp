<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
footer{
position:fixed;
z-index:999;
bottom:0px;

}
</style>
</head>
<body>
<div style="height:40px;">
	</div>
<footer class="container-fluid">
<p>我是Footer</p>
<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
<script>

var MyPoint = "/ForTicketorderServlet_ws/${memVO.member_no}";
var host = window.location.host;
var path = window.location.pathname;
var webCtx = path.substring(0, path.indexOf('/', 1));
var endPointURL = "ws://" + host + webCtx + MyPoint;

var webSocket_map;
var isMe = false;

function connect() {
	// create a websocket
	webSocket_map = new WebSocket(endPointURL);

	webSocket_map.onopen = function(event) {
//			alert("i'm start.");
	};

	webSocket_map.onmessage = function(event) {
		if(isMe){return;}
		var jsonArray = JSON.parse(event.data);
		var action = jsonArray[0].action;
			
		if(action == "amember"){
			//如果是給這個會員的
			alert(jsonArray[1].message);		
		}
		
	};

	webSocket_map.onclose = function(event) {
	};
}

$(document).ready(connect);
</script>
</footer>
</body>
</html>