<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Join���v���U����</title>
</head>
<body>

<form action = "register" method = "post">
<div><h1>Join���v���U����</h1></div>
<br>

<p>*�b��: <input type = "text" id = "account" name = "user" autofocus> </p>
<p>*�K�X: <input type = "password" id = "psw" name = "psw" required> </p>
<p>*�A���T�{�K�X: <input type = "password" id = "psw" name = "psw" required> </p>
<p>*�m�W:<input type = "text" id = "name" name = "name"> </p>
<p>�ʺ�:<input type = "text" id = "nick" name = "nick"> </p>
<p>*�ʧO:<input type = "radio" id="sex" name = "sex" value = "0">�k��
	  <input type = "radio" id="sex" name = "sex" value = "1">�k��
</p>
<p>*�ͤ�:<input type="date" id="birth" placeholder="2019-02-17"></p>
<p>*�a�}:<input type = "text" id = "address" name = "address"> </p>
<p>*�H�c: <input type = "email" id = "email" name = "email"> </p>
<p>�|���Ϲ�: <input type = "file" id = "img" name = "img"> </p>
<p>�H�Υd���X: <input type = "text" id = "credit" name = "credit"> </p>
<p>�I����T�X: <input type = "text" id = "verification" name = "verification"> </p>
<p><input type = "submit" id="send" value = "�e�X"> &nbsp;&nbsp;
   <input type = "reset"  id="send" value = "����">
</p>


</form>

</body>
</html>