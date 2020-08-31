<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="./common_lib/title.jsp"></jsp:include>
<jsp:include page="./common_lib/link.jsp"></jsp:include>

<script type="text/javascript" src="./js/view.js"></script>

</head>
<body class="bg-light">
  
  <h2 style="text-align:center; font-weight:bold; color:tomato;">Institute Of Engineering & Technology (DAVV), Indore</h2>
  <hr class="bg-dark h-3"><br>
  
  <table class="m-auto">
	      <tr>
	        <td><h5><b>Select Date : </b></h5></td>
	        <td><input type="date" id="examdate"/></td>
		  </tr>
		  <tr>
		  	<td colspan="2" class="text-center mt-3"><button class="btn btn-danger" id="show" onclick="viewPlan();">VIEW</button></td>
		  </tr>
 </table>

 <div id="plan" style="display:none;" class="pl-5 pr-5 mt-5">
 <span id="test"></span>
 	<table id="gettab" class="table">
 		<thead class="thead-dark text-center">
 			<tr>
	 			<th>Room No</th>
	 			<th>Subject Code</th>
	 			<th>Branch</th>
	 			<th>Students</th>
	 			<th>Total Student</th>
	 			<th>Grand Total</th>
 			</tr>
 		</thead>
 	</table>
 </div> 

</body>
</html>