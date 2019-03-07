<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM MovieInfo: Home</title>

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
   <tr><td><h3>IBM MovieInfo: Home</h3></td></tr>
</table>

<p>This is the Home page for IBM MovieInfo: Home</p>

<h3>電影資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllMovieInfo.jsp'>List</a> all MovieInfos.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/movieinfo/movieinfo.do" >
        <b>輸入電影編號 (如1):</b>
        <input type="text" name="movie_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="movieinfoSvc" scope="page" class="com.movieinfo.model.MovieInfoService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/movieinfo/movieinfo.do" >
       <b>選擇電影編號:</b>
       <select size="1" name="movie_no">
         <c:forEach var="movieinfoVO" items="${movieinfoSvc.all}" > 
          <option value="${movieinfoVO.movie_no}">${movieinfoVO.movie_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/movieinfo/movieinfo.do" >
       <b>選擇電影名稱:</b>
       <select size="1" name="movie_no">
         <c:forEach var="movieinfoVO" items="${movieinfoSvc.all}" > 
          <option value="${movieinfoVO.movie_no}">${movieinfoVO.movie_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>電影資訊管理</h3>

<ul>
  <li><a href='addMovieInfo.jsp'>Add</a> a new MovieInfo.</li>
</ul>

</body>
</html>