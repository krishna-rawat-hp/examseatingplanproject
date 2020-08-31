<%@ page import="java.sql.*" %>
<%
	String exmdate = request.getParameter("exmdate");
	String subcode = request.getParameter("subcode");
	
	int total_std = 0;
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
	PreparedStatement pst = con.prepareStatement("select branch_id from subjects where subject_id=?");
	pst.setString(1,subcode);
	ResultSet rs = pst.executeQuery();
	while(rs.next()){
		String sub = rs.getString("branch_id");
		PreparedStatement pst1 = con.prepareStatement("select count(*) from students where branch_id=?");
		pst1.setString(1,sub);
		ResultSet rs1 = pst1.executeQuery();
		if(rs1.next()){
			total_std = rs1.getInt(1);
		}
	}
}catch(Exception e){
	out.print(e);
}
%>

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
  width: 600pt;
  border: 2px solid green;
  height:450pt;
  margin-top:50pt;
}
</style>
<script type="text/javascript">function alertName(){alert("Sorry No more student Left");}</script>
</head>
<body style="background-color:#FF6666;">
	<% int st_end = 0; %>
	
	<div id="box" class="mx-auto">
		<h3 style="text-align:center; font-weight:bold; color:blue;">Added Plan</h3>
	<hr style="background-color:green">
	<table border="2" style="width:598pt; text-align:center;">
		<tr>
			<th>S.No</th>
			<th>Subject Code</th>
			<th>Date</th>
			<th>Student Begin</th>
			<th>Student End</th>
			<th>Room No</th>
			<th>Total Student</th>
		</tr>
		
		<%
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
			PreparedStatement pst2 = con.prepareStatement("select * from rooms");
			rs2 = pst2.executeQuery();
			PreparedStatement pst3 = con.prepareStatement("select * from rooms where roomid=?");
			pst3.setString(1, request.getParameter("rooms"));
			rs3 = pst3.executeQuery();
			PreparedStatement pst = con.prepareStatement("select * from plan where subject_id=? and date=?");
			pst.setString(1,subcode);
			pst.setString(2,exmdate);
			ResultSet rs = pst.executeQuery();
			int i=1;
			while(rs.next()){
				String sub = rs.getString(2);
				String date = rs.getString(3);
				String begin = rs.getString(4);
				int end = rs.getInt(5);
				String total = rs.getString(7);
				String room_no = null;
				String room_id = rs.getString(6);
				PreparedStatement pst1 = con.prepareStatement("select roomno from rooms where roomid=?");
				pst1.setString(1,room_id);
				ResultSet rs1 = pst1.executeQuery();
				if(rs1.next()){
					room_no = rs1.getString(1);
				}
				
		%>
		<tr>
			<td><% out.print(i); %></td>
			<td><% out.print(sub); %></td>
			<td><% out.print(date); %></td>
			<td><% out.print(begin); %></td>
			<td><% st_end=end; out.print(st_end); %></td>
			<td><% out.print(room_no); %></td>
			<td><% out.print(total); %></td>
		</tr>
		<%  i++;}
		}catch(Exception e){
			out.print(e);
		}%>
		
		<tr>
			<td colspan="7">No More Record Found!!!</td>
		</tr>
		
	</table>
		
	    <hr style="background-color:green">	
		<h1 style="text-align:center; font-weight:bold; color:blue;">Add Plan</h1>
		<hr style="background-color:green">
		<h4 style="font-weight:bold">Total Student Register :  <% total_std = total_std-st_end;out.print(total_std); %></h4><br>
	    <center>
	      <form action="add_plan.jsp" method="get">
	      	<input type="hidden" id="exmdate" name="exmdate" value="<% out.print(exmdate); %>">
	      	<input type="hidden" id="subcode" name="subcode" value="<% out.print(subcode); %>">
			<table style="width:500pt; font-size:16pt;" class="text-center">
				<tr>
					<th>Room No</th>
					<th>Student Begin</th>
					<th>Student End</th>
				</tr>
				<tr class="text-center">
					<td><select name="rooms" id="rooms" onchange="this.form.submit();">
						<%while(rs2.next()){
							int id = rs2.getInt(1);
							String no = rs2.getString(2);
							%>
						
						<option value="<% out.print(id);%> "><%out.print(no); %>
						<% } %>
					</select></td>
					<td><input class="text-center" type="text" name="begin" size="3" value="<% out.print(st_end+1); %>"></td>
					<% int last=0; while(rs3.next()){int cap = rs3.getInt(3); last = cap/2;} %>
					<td><input class="text-center" type="text" name="end" size="3" value="<% 
						if(total_std == 0){
						 %><script>alertName();</script><%
						}else if(total_std < last){
							out.print(st_end+total_std);
						}else{out.print(st_end+last);} %>"></td>
						<input type="hidden" name="total" value="<% 
						if(total_std == 0){
						  
						}else if(total_std < last){
							out.print(st_end+total_std);
						}else{out.print(st_end+last);} %>"></td>
				</tr>
				<tr style="height:50pt"><td colspan="3" class="text-center"><button class="btn btn-info " id="add"  onclick="addInfo();"> ADD </button></td></tr>
			</table>
			</form>
	
	</center>
	</div>
	
</body>
</html>