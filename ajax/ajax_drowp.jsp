<%@ page import="java.sql.*" %>
<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
			PreparedStatement pst = con.prepareStatement("select roomno from rooms");
			ResultSet rs1 = pst.executeQuery();
			while(rs1.next()){
				String sub1 = rs1.getString(1);
				out.print(sub1+"*");
			}
		}catch(Exception e){ out.print(e);}
	
%>
