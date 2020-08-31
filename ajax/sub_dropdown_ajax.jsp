<%@ page import="java.sql.*;" %>
<% 
	String date = request.getParameter("date");
	String room = request.getParameter("room");
	String roomid = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
		PreparedStatement pst = con.prepareStatement("select roomid from rooms where roomno=?");
		pst.setString(1, room);
		ResultSet rs = pst.executeQuery();
		if(rs.next()){
			roomid = rs.getString(1);
		}
		PreparedStatement pst1 = con.prepareStatement("select subject_id from plan where date=? and room_id=?");
		pst1.setString(1, date);
		pst1.setString(2, roomid);
		ResultSet rs1 = pst1.executeQuery();
		while(rs1.next()){
			String data = rs1.getString(1);
			out.print(data+"*");
		}
	}catch(Exception e){
		out.print(e);
	}
%>