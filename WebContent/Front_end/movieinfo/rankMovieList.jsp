<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
		<!-- Bootstrap CSS start-->
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
		<!-- Bootstrap CSS end-->
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
<jsp:include page="/FrontHeaderFooter/Header.jsp" />
		<h1></h1><br>
		
<!-- 工作區開始 -->
		<div class="container">
		<div class="row justify-content">
			<div class="col-1"></div>
			<div class="col-4">

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
			     <input type="button" id="abc" value="2008">
			     <input type="hidden" name="stdate"  value="2008-01-01">
				 <input type="hidden" name="enddate"  value="2008-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="button" value="2009" id="aaa">
			     <input type="hidden" name="stdate"  value="2009-01-01">
				 <input type="hidden" name="enddate"  value="2009-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2010">
			     <input type="hidden" name="stdate"  value="2010-01-01">
				 <input type="hidden" name="enddate"  value="2010-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2011">
			     <input type="hidden" name="stdate"  value="2011-01-01">
				 <input type="hidden" name="enddate"  value="2011-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2012">
			     <input type="hidden" name="stdate"  value="20012-01-01">
				 <input type="hidden" name="enddate"  value="20012-12-31">
			     <input type="hidden" name="ac"D:/GetClassAjax.java"tion"	value="get_list_byscore"></FORM>
		</th>
		
		<th>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front_end/movieinfo/movieinfo.do" style="margin-bottom: 0px;">
			     <input type="submit" value="2013">
			     <input type="hidden" name="stdate"  value="2013-01-01">
				 <input type="hidden" name="enddate"  value="2013-12-31">
			     <input type="hidden" name="action"	value="get_list_byscore"></FORM>
		</th>
	</tr>
</table>	
<div id="load"></div>
			</div>
		</div>
	</div>

<!-- 工作區結束 -->
		
		<jsp:include page="/FrontHeaderFooter/Footer.jsp" />
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS start-->
		<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS end-->
</body>
<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.min.js"></script>

<script>
$(document).ready(init);
		
		function init(){
			
			$('#aaa').click(
				function(){
					$('#load').load('<%=request.getContextPath()%>/Front_end/movieinfo/rankMovie.jsp?year_in=2009-01-01&year_out=2010-01-01');
				}
			);
			
		}
</script>

<script>
$('#abc').on('click',function(){
	var xhr = new XMLHttpRequest();
	xhr.load = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
			var abcd = JSON.parse(xhr.responseText);
			abcd.movename
			} else{
				alert(xhr.status);
			}
		}
	}
	
	xhr.open("post", "", true);
	xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	xhr.send();
})
</script>

</html>