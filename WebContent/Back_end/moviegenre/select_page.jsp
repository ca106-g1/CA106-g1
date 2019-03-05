<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>MovieGenre: Home</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>電影種類編輯</h3>
		</tr>
	</table>


	<h3>電影種類查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='listAllMovieGenre.jsp'>電影種類清單</a><br>
			<br></li>


		<li>
			<FORM METHOD="post" ACTION="moviegenre.do">
				<b>輸入種類編號:</b><input type="text" name="genre_no" value="*2"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="moviegenreSvc" scope="page"
			class="com.moviegenre.model.MovieGenreService" />

		<li>
			<FORM METHOD="post" ACTION="moviegenre.do">
				<b>選擇種類編號:</b> <select size="1" name="genre_no">
					<c:forEach var="moviegenreVO" items="${moviegenreSvc.all}">
						<option value="${moviegenreVO.genre_no}">${moviegenreVO.genre_no}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="moviegenre.do">
				<b>選擇種類名稱:</b> <select size="1" name="genre_no">
					<c:forEach var="moviegenreVO" items="${moviegenreSvc.all}">
						<option value="${moviegenreVO.genre_no}">${moviegenreVO.genre_name}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>電影種類新增</h3>

	<ul>
		<li><a href='addMovieGenre.jsp'>新增</a></li>
	</ul>

</body>
</html>