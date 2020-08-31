<%@ page import="java.sql.*" %>
<%
	String date = request.getParameter("date");
	//out.print(date);
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
	PreparedStatement pst = con.prepareStatement("select * from plan where date=? order by room_id");
	pst.setString(1,date);
	ResultSet rs = pst.executeQuery();
	while(rs.next()){
		String r1 = rs.getString("subject_id");
		String r2 = rs.getString("room_id");
		int r3 = rs.getInt("student_beg");
		String r4 = rs.getString("student_end");
		int r5 = rs.getInt("total_student");
		
		String roomno = null;
		PreparedStatement pst3 = con.prepareStatement("select roomno from rooms where roomid=? ");
		pst3.setString(1,r2);
		ResultSet rs3 = pst3.executeQuery();
		if(rs3.next()){
			roomno = rs3.getString(1);	
		}
		
		out.print(roomno+"*"+r1+"*");
		
		String sd = null;
		String bid = null;
		PreparedStatement pst1 = con.prepareStatement("select branch_id from subjects where subject_id=?");
		pst1.setString(1,r1);
		ResultSet rs1 = pst1.executeQuery();
		if(rs1.next()){
			bid = rs1.getString(1);
			
			
			PreparedStatement pst2 = con.prepareStatement("select roll_no from students where branch_id=? limit ?, ? ");
			pst2.setString(1,bid);
			pst2.setInt(2, r3-1);
			pst2.setInt(3, r5);
			ResultSet rs2 = pst2.executeQuery();
			while(rs2.next()){
				String std = rs2.getString(1);
				int len = std.length();
				sd = std.substring(0,len-2);
				String stds = std.substring(len-2,len);
				out.print(stds+", ");	
			}
		}
		
		PreparedStatement pst4 = con.prepareStatement("select branch_code from branches where branch_id=?");
		pst4.setString(1,bid);
		ResultSet rs4 = pst4.executeQuery();
		if(rs4.next()){
			String bcode = rs4.getString(1);
			out.print("*"+bcode);
		}
		
		out.print("*"+sd+"*"+r5+"*");
		
	}
}catch(Exception e){ out.print(e);}

%>