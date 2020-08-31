<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="./common_lib/title.jsp"></jsp:include>
<jsp:include page="./common_lib/link.jsp"></jsp:include>

<style type="text/css">
#box{
  width: 320px;
  border: 2px solid red;
  height:250pt;
  margin-top:150pt;
}
</style>
</head>
<body style="background-color:lime;">

	<div id="box" class="mx-auto">
		<h1 style="text-align:center; font-weight:bold; color:blue;">Seating Plan</h1>
		<hr class="bg-danger"><br>
		<ul>
			<li><h4><a href="./create_plan.jsp">Enter Plan</a></h4></li>
			<li><h4><a href="./create_plan.jsp">Generate Invigilator Statement</a></h4></li>
			<li><h4><a href="./create_plan.jsp">Generate Seating Plan</a></h4></li>
			<li><h4><a href="./create_plan.jsp">Update Room Capacity</a></h4></li>
		</ul>
		
		
		
	</div>
	
</body>
</html>