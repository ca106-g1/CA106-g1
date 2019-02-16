<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS start-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/File/css/bootstrap.min.css">
<!-- Bootstrap CSS end-->
<title>Hello, world!</title>
</head>
<body>
	<jsp:include page="/HeaderFooter/Header.jsp" />
	<h1>Hello, world!</h1>

	<!-- 工作區開始 -->

<div class="container-fluid">
        <div class="row justify-content-CENTER">
            <div class="col-5">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Dropdown button
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 ">
                <div class="btn btn-primary btn-lg">div</div>
                <span class="btn btn-primary">span</span>
                <input class="btn btn-primary btn-sm" type="button" value="input button">
                <input class="btn btn-primary" type="text" value="input text">
                <button class="btn btn-primary btn-block">button</button>
            </div>
            <div class="col-12">
                <div class="row justify-content-CENTER">
                    <div class="col-2">
                        <input type="submit" value="submit" class="btn btn-primary">
                    </div>
                </div>
            </div>
        </div>
    </div>


	<!-- 工作區結束 -->
	
	<jsp:include page="/HeaderFooter/Footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
	<script src="<%=request.getContextPath()%>/File/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/File/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/File/js/bootstrap.min.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS end-->

</body>
</html>