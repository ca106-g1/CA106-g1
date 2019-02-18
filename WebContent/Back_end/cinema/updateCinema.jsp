<%@ page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.cinema.model.*"%>
<%@ page import="com.cinema.controller.*"%>
<%@ page import="java.util.Map"%>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Bootstrap CSS end-->
<title>瀏覽廳院</title>
</head>
<body>
	<jsp:include page="/BackHeaderFooter/Header.jsp" />
	<h1>瀏覽廳院</h1>

	<!-- 工作區開始 -->

	<%
		Map cinemaMap = (Map) application.getAttribute("cinemaMap");
		CinemaVO cinemaVO = (CinemaVO) (cinemaMap.get(request.getParameter("cinema_no")));
		request.setAttribute("cinemaVO", cinemaVO);
	%>

	<div class="container">
		<div class="row justify-content">
			<div class="col-4">
				<form action="<%= request.getContextPath()%>/CinemaServlet" method="post">
					<table>

						<tr>
							<th>廳院編號</th>
							<td>${cinemaVO.cinema_no}</td>
						</tr>
						<tr>
							<th>廳院名稱</th>
							<td><input type="text" name="cinema_name"
								value="${cinemaVO.cinema_name}"></td>
						</tr>
						<tr>
							<th>廳院容量</th>
							<td><P id = "p">${cinemaVO.cinema_size}</P></td>
						</tr>
						<tr>
							<th>廳院敘述</th>
							<td><input type="text" name="cinema_correct"
								value="${cinemaVO.cinema_correct}"></td>
						</tr>
						<tr>
							<th>廳院狀態</th>
							<td><input type="text" name="cinema_status"
								value="${cinemaVO.cinema_status}"></td>
						</tr>

					</table>
					<input id="hiddensizeinput" type="hidden" name="cinema_size"	value="${cinemaVO.cinema_size}"> 
					<input type="hidden" name="cinema_no" value="${cinemaVO.cinema_no}"> 
					<input id="hiddentypeinput" type="hidden" name="cinema_type" value="${cinemaVO.cinema_type}">
					<input type="hidden" name="action" value="updateCinema"> 
					<input type="submit" value="送出修改">
				</form>
			</div>
			
			<!-- ---------------------以上一般input---------------------- -->
			<div class="col-8">
				<nav class="row justify-content">
				
					<div class="col-9">
						<c:forEach var="var" items="${statusOfSitList}">
			
							${var.str}
							<div 
								class="btn"
								data-sitType = "${var.type}"
								data-sitStr = "${var.str}"
								id = "type${var.type}"
								style="background-color:${var.coller}; border-color:#000; margin-left:5px">
								
							</div>

						</c:forEach>
					</div>
								<!-- ---------------------以上所有type---------------------- -->
				<div class="col-3">
						<p style="margin:0px">現在使用</p>
						<p id="str" style="margin:0px">走道</p>
						
						<div 
							class="btn" 
							data-sitType = "0"  
							id="color" 
							style="border-color:#000; margin:0px"></div>
						
					</div>
							<!-- ---------------------以上現在使用type---------------------- -->
				</nav>
					<br>
				<div class= "row">


					<%
						List<List<Integer>> sitList = new ArrayList<List<Integer>>();
						String cinema_type = cinemaVO.getCinema_type();

						for (int i = 0; i < 20; i++) {
							List<Integer> list = new ArrayList<Integer>();
							for (int j = 0; j < 20; j++) {
								list.add(new Integer(cinema_type.charAt(i * 20 + j)-48));
							}
							sitList.add(list);
						}
					%>
					<jsp:useBean id="statusOfSitList" scope="application"
						class="java.util.ArrayList" />
					<%
						int outerSize = sitList.size();
						for (int i = 0; i < outerSize; i++) {
							List<Integer> sitInnerList = sitList.get(i);
							int innerSize = sitInnerList.size();
							for (int j = 0; j < innerSize; j++) {
								CinemaTool.StatusOfSit cs = (CinemaTool.StatusOfSit) (statusOfSitList.get(sitInnerList.get(j)));
					%>

					<div 
						class="btn" 
						data-sitType = "<%=cs.getType()%>"
						id="sit<%= i * 20 + j%>"
						style="background-color:<%=cs.getColler()%>; border-color:#000; margin-left:4px; margin-top:2px">
					</div>
			<!-- ---------------------以上所有座位---------------------- -->
					<%
						}
					%>

					<br>

					<%
						}
					%>


				</div>


			</div>
		</div>
	</div>

	<script>
    function $id(id) {
        return document.getElementById(id);
    }

    function $add(a, b, c) {
        return a.addEventListener(b, c, false);
    } //物件,事件,動作

    function $bgc(a, b) {
        a.style.backgroundColor = b;
    } //物件,"顏色"
    
    function choosStyle(e){
    	$id("str").innerText = e.target.getAttribute("data-sitStr");
    	$bgc($id("color"), e.target.style.backgroundColor);
    	$id("color").setAttribute("data-sitType", e.target.getAttribute("data-sitType"));
    }

    function setStyle(e){
    	
    	e.target.setAttribute("data-sitType", $id("color").getAttribute("data-sitType"));
    	$bgc(e.target,$id("color").style.backgroundColor);
    	
    	var str = "";
    	var str1count = 0;
    	
    	for(var i =0;i<<%= cinema_type.length()%>;i++){
    		var s = $id("sit"+i).getAttribute("data-sitType");
    		str = str+s;
    		if(s == 1){
    			str1count++;
    		}
    	}
    	$id("hiddentypeinput").value = str;
    	$id("p").innerText = str1count;
    	$id("hiddensizeinput").value = str1count;

    }
    
    function init() {
		var statusOfSitList_size = ${statusOfSitList.size()};
		var sit_size = <%= cinema_type.length()%>;
    	
       	for(var i = 0;i<statusOfSitList_size;i++){
       		$add($id("type"+i),"click",choosStyle);
       	}
       	
       	for(var i = 0;i<sit_size;i++){
       		$add($id("sit"+i),"click",setStyle);
       	}
       	
    }

    window.onload = init;
	</script>

	<!-- 工作區結束 -->

	<jsp:include page="/BackHeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script
		src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>