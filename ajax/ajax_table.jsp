<%@ page import="java.sql.*" %>
	<%
		String subname = request.getParameter("sub");
		String exmdate = request.getParameter("exmdate");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
			PreparedStatement pst = con.prepareStatement("select * from plan where subject_id=? and date=?");
			pst.setString(1,subname);
			pst.setString(2,exmdate);
			ResultSet rs1 = pst.executeQuery();
			int i=1;
			while(rs1.next()){
				String r1 = rs1.getString(4);
				String r2 = rs1.getString(5);
				String r3 = rs1.getString(6);
				String roomno = "0";
				PreparedStatement pst1 = con.prepareStatement("select roomno from rooms where roomid=?");
				pst1.setString(1,r3);
				ResultSet rs2 = pst1.executeQuery();
				if(rs2.next()){
					roomno = rs2.getString("roomno");
				}
				String r4 = rs1.getString(7);
				out.print(i+"*"+subname+"*"+exmdate+"*"+r1+"*"+r2+"*"+roomno+"*"+r4+"*");
				i++;
			}
		}catch(Exception e){ out.print(e);}
	
	%>