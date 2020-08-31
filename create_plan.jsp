<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="./common_lib/title.jsp"></jsp:include>
<jsp:include page="./common_lib/link.jsp"></jsp:include>

<script type="text/javascript" src="./js/plan.js"></script>



</head>
<body class="bg-light">

		<h2 style="text-align:center; font-weight:bold; color:tomato;">Institute Of Engineering & Technology (DAVV), Indore</h2>
		<hr class="bg-dark h-3"><br>
		
		<table class="m-auto">
	      <tr>
	        <td><h5><b>Select Date : </b></h5></td>
	        <td><input type="date" id="exmdate"/></td>
		  </tr>
		  <tr class="mt-3">
	        <td><h5><b>Subject Code : </b></h5></td>
	        <td><input type="text" id="subcode" size="10"/></td>
		  </tr>
		  <tr>
		  	<td colspan="2" class="text-center mt-3"><button class="btn btn-danger" id="show" onclick="myFunction();getSubName(); getTable(); getDrowpdown();">Submit</button></td>
		  </tr>
		</table> 
		<div id="plan" class="container mt-5" style="display:none;">
		<hr class="bg-dark">
			<div class="row">
				<div class="col-md-4"><h4 class="text-left">Subject Code : <span id="test"></span></h4></div>
				<div class="col-md-5"><h4 class="text-left">Subject Name : <span id="test2"></span></h4></div>
				<div class="col-md-3"><h4 class="text-left">Exam Date : <span id="test1"></span></h4></div>
			</div>
			<div class="row mt-3">
				<input type="hidden" id="val1">
				<div class="col-md-12"><h3 class="text-left">Total Student Registered : <span id="test3"></span></h3></div>
			</div>
			<hr class="mt-3 mb-3 bg-dark">
			<div class="row text-left">
				<div class="col-md-4"><h3 class="text-left">Select Room </h3></div>
				<div class="col-md-4"><h3 class="text-left">Student Start </h3></div>
				<div class="col-md-4"><h3 class="text-left">Student End </h3></div>
				<div class="col-md-4"><select id="room" name="room" style="font-size:16pt;" onchange="getCapacity();"></select></div>
				<div class="col-md-4"><input type="text" style="font-size:16pt; text-align:center; font-weight:bold;" name="std_begin" id="std_begin" readonly></div>
				<div class="col-md-4"><input type="text" style="font-size:16pt; text-align:center; font-weight:bold;" name="std_end" id="std_end" readonly></div>
		        <div class="col-md-12 text-center mt-3"><button class="btn btn-danger"  id="show" onclick="addPlan();">Add Plan</button></div> 
			</div> 
		    <hr class="mt-3 mb-3 bg-dark">
		    <table class="table" id="Mytable">
			    <tr class="bg-success">
			      <th scope="col">S.no</th>
			      <th scope="col">Date </th>
			      <th scope="col">Subject Code </th>
			      <th scope="col">student Begin</th>
			      <th scope="col">Student End</th>
			      <th scope="col">Room No</th>
			      <th scope="col">Total Student</th>		
			    </tr>
			</table>
      </div>		
		
</body>
</html>