<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.farediscount.model.*"%>
<%@ page import="java.util.*"%>
<html lang="en">
	<head>
	</head>
	
	<body>
		<jsp:useBean id="fdSer"  class="com.farediscount.model.FarediscountService" scope="page"/>
		<%
		
		Date now = new Date();
		
		List<FarediscountVO> list = 
		fdSer.getAll().stream()
		.filter(farediscountVO -> !farediscountVO.getFd_start().after(now))
		.filter(farediscountVO -> !farediscountVO.getFd_end().before(now))
		.sorted()
		.collect(Collectors.toList());
		
		pageContext.setAttribute("list", list);
		%>		

        <div class="container-fluid">
		    <div class="row">
		    
				<div class="col-md-5">
			      <p>名稱</p>
			      <c:forEach var="farediscountVO" items="${list}">
			      <p>${farediscountVO.fd_name}</p>
			      </c:forEach>
				</div>
			      
				<div class="col-md-3">
			      <p>優惠價格</p>
			      <c:forEach var="farediscountVO" items="${list}">
			      <p>${farediscountVO.fd_offer}</p>
			      </c:forEach>
				</div>
			      
				<div class="col-md-4">
				<p>適用人數</p>
				<c:forEach var="farediscountVO" items="${list}">
			      <p>${farediscountVO.fd_lower}-${farediscountVO.fd_upper}</p>
			      </c:forEach>
				</div>
				<%System.out.println("65456456465465"); %>
		    </div>
	    </div>
	</body>
</html>