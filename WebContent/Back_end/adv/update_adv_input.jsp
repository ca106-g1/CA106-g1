<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adv.model.*"%>

<%
  AdvVO advVO = (AdvVO) request.getAttribute("advVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��ƭק� - update_emp_input.jsp</title>

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
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>���u��ƭק� - update_emp_input.jsp</h3>
		 <h4><a href="select_page_adv.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="adv.do" name="form1" enctype="multipart/form-data" enctype="multipart/form-data">



<table>
	<tr>
		<td>�s��:<font color=red><b>*</b></font></td>
		<td><%=advVO.getAd_no()%></td>
	</tr>
	<tr>
		<td>�s�i�W��:</td>
		<td><input type="TEXT" name="ad_name" size="45" 
			 value="<%= (advVO==null)? "�d�ç�" : advVO.getAd_name()%>" /></td>
	</tr>
	
	<tr>
		<td>�s�i�Ϥ�:</td>
	<%--	<td><input type="TEXT" name="ad_pic" size="45" 
			 value="<%= (advVO==null)? "" : advVO.getAd_pic()%>" /></td> --%>
			 <td>
			 
			    <c:if test="${empty advVO.ad_pic}" var="condition">
				<img id="preview_progressbarTW_img" src="<%=request.getContextPath()%>/Back_end/adv/images/no_pic.jpg" width="200" height="200"/>
				</c:if>
			    <c:if test="${not empty advVO.ad_pic}" var="condition">
			    <img id="preview_progressbarTW_img" src='<%=request.getContextPath()%>/Back_end/adv/adv.do?ad_no=${advVO.ad_no}' width='200' height='200' />
				</c:if>
				
<%-- 				<input type="TEXT" name="ad_pic" size="45"  value="${advVO.ad_pic}" id="img" />  --%>
			 
<!-- 			 <img id="preview_progressbarTW_img" src="#"  width="100px"   height="100px"  style = "display:none"/> -->

			 <input type="file" id="progressbarTWInput" name="ad_pic" id="progressbarTWInput" name="ad_pic" size="25" accept="image/gif, image/jpeg, image/png" value="${advVO.ad_pic}"/>

<!-- 			 <input type="file" id="progressbarTWInput" name="ad_pic" id="progressbarTWInput" name="ad_pic" size="25" accept="image/gif, image/jpeg, image/png" value="preview_progressbarTW_img"/> -->
			 
			 </td> 
	</tr>
	
	<tr>
		<td>�s�i���e:</td>
		<td><input type="TEXT" name="ad_cont" size="45" 
			 value="<%= (advVO.getAd_cont()==null)? "" : advVO.getAd_cont()%>" /></td>
	</tr>
	
	<tr>
		<td>�s�i�_�l�ɶ�:</td>
		<td><input name="ad_start" id="f_date1" type="text"></td>
	</tr>
	<tr>
		<td>�s�i�פ�ɶ�:</td>
		<td><input name="ad_end" id="f_date2" type="text"></td>
	</tr>
	<tr>
		<td>�s�i���A:</td>
		<td>
<!-- 		<input type="TEXT" name="ad_type" size="45"  -->
<%-- 			 value="<%= (advVO==null)? "" : advVO.getAd_type()%>" /> --%>
       		<select size="1" name="ad_type">
       			
       			<c:if test="${advVO.ad_type==0}" var="condition">
				<option value="0" selected>�U�[</option>
				<option value="1">�W�[</option>
				</c:if>
				<c:if test="${advVO.ad_type==1}" var="condition">
				<option value="0">�U�[</option>
				<option value="1" selected>�W�[</option>
				</c:if>
				
<!--        			<option value="0">�U�[</option> -->
<!--           		<option value="1">�W�[</option> -->
       		</select>
			 </td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="ad_no" value="<%=advVO.getAd_no()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>











<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<% 
  java.sql.Timestamp ad_start = null;
  try {
	    ad_start = advVO.getAd_start();
   } catch (Exception e) {
	    ad_start = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>
<% 
  java.sql.Timestamp ad_end = null;
  try {
	   ad_end = advVO.getAd_end();
   } catch (Exception e) {
	   ad_end = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=ad_start%>', // value:   new Date(),
		   
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        
        $('#f_date2').datetimepicker({
 	       theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 		   value: '<%=ad_end%>', // value:   new Date(),
            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
            //startDate:	            '2017/07/10',  // �_�l��
            minDate:              '-1970-01-01', // �h������(���t)���e
            //maxDate:               '+1970-01-01'  // �h������(���t)����
         });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>




<script>

$("#progressbarTWInput").ready(function(){

	  readURL(this);

	});

$("#progressbarTWInput").change(function(){

  readURL(this);

});



function readURL(input){
	
  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {
    	
       $("#preview_progressbarTW_img").attr('src', e.target.result);
       $("#preview_progressbarTW_img").removeAttr("style");
    }

    reader.readAsDataURL(input.files[0]);

  }

}



</script>




</html>




