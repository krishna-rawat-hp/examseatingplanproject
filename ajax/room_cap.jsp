<%@ page import="java.sql.*" %>
<%
		String room = request.getParameter("roomno");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
			PreparedStatement pst = con.prepareStatement("select capacity from rooms where roomno=?");
			pst.setString(1,room);
			ResultSet rs1 = pst.executeQuery();
			while(rs1.next()){
				String cap = rs1.getString(1);
				out.print(cap);
			}
		}catch(Exception e){ out.print(e);}
	
	%>