<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Join揪影註冊頁面</title>
</head>
<body>

<form action = "register" method = "post">
<div><h1>Join揪影註冊頁面</h1></div>
<br>

<p>*帳號: <input type = "text" id = "account" name = "user" autofocus> </p>
<p>*密碼: <input type = "password" id = "psw" name = "psw" required> </p>
<p>*再次確認密碼: <input type = "password" id = "psw" name = "psw" required> </p>
<p>*姓名:<input type = "text" id = "name" name = "name"> </p>
<p>暱稱:<input type = "text" id = "nick" name = "nick"> </p>
<p>*性別:<input type = "radio" id="sex" name = "sex" value = "0">男性
	  <input type = "radio" id="sex" name = "sex" value = "1">女性
</p>
<p>*生日:<input type="date" id="birth" placeholder="2019-02-17"></p>
<p>*地址:<input type = "text" id = "address" name = "address"> </p>
<p>*信箱: <input type = "email" id = "email" name = "email"> </p>
<p>會員圖像: <input type = "file" id = "img" name = "img"> </p>
<p>信用卡號碼: <input type = "text" id = "credit" name = "credit"> </p>
<p>背面後三碼: <input type = "text" id = "verification" name = "verification"> </p>
<p><input type = "submit" id="send" value = "送出"> &nbsp;&nbsp;
   <input type = "reset"  id="send" value = "取消">
</p>


</form>

</body>
</html>