<%@ page import="java.sql.*" %>
 <%
		String subname = request.getParameter("sub1");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
			PreparedStatement pst = con.prepareStatement("select subject_name from subjects where subject_id=?");
			pst.setString(1,subname);
			ResultSet rs1 = pst.executeQuery();
			while(rs1.next()){
				String sub1 = rs1.getString(1);
				out.print(sub1);
			}
		}catch(Exception e){ out.print(e);}
	
	%>