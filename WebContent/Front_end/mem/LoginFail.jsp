<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<% out.println ("登入失敗 接下來將重新導入頁面"); %>
<%response.setHeader("refresh "," 5; url = Login.jsp"); %>
</body>
</html>