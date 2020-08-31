<%@ page import="java.sql.*" %>
<%
		String sub = request.getParameter("sub");
		String date = request.getParameter("date");
		String begin = request.getParameter("std_beg");
		String end = request.getParameter("std_end");
		String room = request.getParameter("room");
		String total = request.getParameter("total");
		String cap = request.getParameter("cap");
		int cap1 = Integer.parseInt(cap.trim());
		int id = 0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
			PreparedStatement pst1 = con.prepareStatement("select roomid from rooms where roomno=?");
			pst1.setString(1,room);
			ResultSet rs = pst1.executeQuery();
			while(rs.next()){
				id = rs.getInt(1);
			}
			
			//query for room capacity check
			int capcount = 0;
			int entry = 0;
			PreparedStatement pst3 = con.prepareStatement("select total_student from plan where date=? and room_id=?");
			pst3.setString(1,date);
			pst3.setInt(2,id);
			ResultSet rs3 = pst3.executeQuery();
			while(rs3.next()){
				entry = entry+rs3.getInt(1);
				if(entry>=cap1){
					capcount =1;
				}else{capcount =0;}
			}
			
			// query for duplicate record check
			int count = 0;
			PreparedStatement pst2 = con.prepareStatement("select * from plan where subject_id=? and date=? and room_id=?");
			pst2.setString(1,sub);
			pst2.setString(2,date);
			pst2.setInt(3,id);
			ResultSet rs2 = pst2.executeQuery();
			if(rs2.next()){
				count++;
			}
			
			// query for insert the plan
			if(capcount == 1){
				out.print(3);
			}else if(count == 0){
				PreparedStatement pst = con.prepareStatement("insert into plan (subject_id, date, student_beg, student_end, room_id, total_student) values (?,?,?,?,?,?)");
				pst.setString(1,sub);
				pst.setString(2,date);
				pst.setString(3,begin);
				pst.setString(4,end);
				pst.setInt(5,id);
				pst.setString(6,total);
				int i = pst.executeUpdate();
				out.print(i);
			}else{
				out.print(2);
			}
		}catch(Exception e){ out.print(e);} 
	
	%>