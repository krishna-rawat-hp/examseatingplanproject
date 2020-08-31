<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="./common_lib/title.jsp"></jsp:include>
	<jsp:include page="./common_lib/link.jsp"></jsp:include>
	<script type="text/javascript" src="./js/invigilator.js"></script>
	
	<style type="text/css">
	</style>
</head>
<body class="bg-light" onload="getDropdown();">
	
	<h2 style="text-align:center; font-weight:bold; color:tomato;">Institute Of Engineering & Technology (DAVV), Indore</h2>
	<hr class="bg-dark h-3"><br>
  
  <table class="m-auto">
      <tr>
        <td><h5><b>Select Date : </b></h5></td>
        <td><input type="date" id="examdate"/></td>
	  </tr>
	   <tr>
        <td><h5><b>Select Room no : </b></h5></td>
        <td><select id="room" name="room" style="font-size:16pt;" onchange="getCapacity();"></select></td>	
	  </tr>
	  <tr>
	  	<td colspan="2" class="text-center mt-3"><button class="btn btn-danger" id="show" onclick="viewPlan();">VIEW</button></td>
	  </tr>
 </table>
 
 <div id="plan"  class="pl-5 pr-5 mt-5">
 <span id="test"></span>
 	<table id="gettab" class="table table-borderless" style="border:2px solid black;">
 		<tr class="r1" style="font-size:18px; font-weight:600;">
 			<td></td>
 			<td colspan="5" style="margin-left:20px;"> Room No:-</td>
 			<td colspan="3"> Date:-</td>
 		</tr>
 		<tr class="r2" style="text-align:center; font-size:22px; font-weight:bold;">
 			<td colspan="9" style="padding-bottom: 0px;">IET-DAVV</td>
 		</tr>
 		<tr class="r3" style="text-align:center; font-size:22px; font-weight:bold;">
 			<td colspan="9" style="padding-top: 0px;">CLASS TEST:-I/II/III</td>
 		</tr>
 		<tr class="r4" style="font-size:18px; font-weight:600;">
 			<td></td>
 			<td colspan="5"> Branch:-</td>
 			<td colspan="3"> YEAR:-</td>
 		</tr>
 		<tr class="r5" style="font-size:18px; font-weight:600;"	>
 			<td></td>
 			<td colspan="5"> Subject Name:-</td>
 			<td colspan="3"> Subject Code:-</td>
 		</tr>
		<tr style="border:2px solid black;">
			<th style="text-align:center; border:2px solid black;">S.No.</th>
			<th style="text-align:center; border:2px solid black;">Enrollment No</th>
			<th style="text-align:center; border:2px solid black;">First Name</th>
			<th style="text-align:center; border:2px solid black;">Last Name</th>
			<th style="text-align:center; border:2px solid black;">Signature</th>
			<th style="text-align:center; border:2px solid black;">Answer Sheet 1</th>
			<th style="text-align:center; border:2px solid black;">Answer Sheet 2</th>
			<th style="text-align:center; border:2px solid black;">Answer Sheet 3</th>
			<th style="text-align:center; border:2px solid black;">Marks</th>
		</tr>
		<tr style="border:2px solid black;">
			<th colspan="2" style="text-align:center; border:2px solid black;">Invigilators</th>
			<th colspan="5" style="text-align:center; border:2px solid black;">Invigilators Name</th>
			<th colspan="2" style="text-align:center; border:2px solid black;">Signature</th>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center; border:2px solid black;"><b>1.</b></td>
			<td colspan="5" style="text-align:center; border:2px solid black;">  </td>
			<td colspan="2" style="text-align:center; border:2px solid black;">  </td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center; border:2px solid black;"><b>2.</b></td>
			<td colspan="5" style="text-align:center; border:2px solid black;">  </td>
			<td colspan="2" style="text-align:center; border:2px solid black;">  </td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center; border:2px solid black;"><b>3.</b></td>
			<td colspan="5" style="text-align:center; border:2px solid black;">  </td>
			<td colspan="2" style="text-align:center; border:2px solid black;">  </td>
		</tr>
 	</table>
 </div> 
	
</body>
</html>