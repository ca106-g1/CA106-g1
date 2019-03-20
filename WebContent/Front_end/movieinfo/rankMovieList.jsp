<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>rankMovieList</title>

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
  img, #level{
  	width:50px;
  	hight:50px;
  }
  
  img, #pic{
  	width:135px;
  	hight:200px;
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
<body>

<table id="table-1">
	<tr><td>
		 <h3>年度電影排行</h3>
		 <h4><a href="<%=request.getContextPath()%>/Front_end/Home.jsp"><img src="<%=request.getContextPath()%>/Back_end/movieinfo/images/eatPopcorn.gif" width="125" height="72" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2000">
			     <input type="hidden" name="stdate"  value="2000-01-01">
				 <input type="hidden" name="enddate"  value="2000-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2001">
			     <input type="hidden" name="stdate"  value="2001-01-01">
				 <input type="hidden" name="enddate"  value="2001-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2002">
			     <input type="hidden" name="stdate"  value="2002-01-01">
				 <input type="hidden" name="enddate"  value="2002-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2003">
			     <input type="hidden" name="stdate"  value="2003-01-01">
				 <input type="hidden" name="enddate"  value="2003-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2004">
			     <input type="hidden" name="stdate"  value="2004-01-01">
				 <input type="hidden" name="enddate"  value="2004-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2005">
			     <input type="hidden" name="stdate"  value="2005-01-01">
				 <input type="hidden" name="enddate"  value="2005-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
	</tr>
</table>	

</body>
</html>