<%@ page import="java.sql.*" %>
 <%
		String sub = request.getParameter("sub");

		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esp","root","");
			PreparedStatement pst = con.prepareStatement("select branch_id from subjects where subject_id=?");
			pst.setString(1,sub);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				String sub1 = rs.getString("branch_id");
				PreparedStatement pst1 = con.prepareStatement("select count(*) from students where branch_id=?");
				pst1.setString(1,sub1);
				ResultSet rs1 = pst1.executeQuery();
				if(rs1.next()){
					String v = rs1.getString(1);
					 out.print(v);
				}
			} 
		}catch(Exception e){ out.print(e);}
	
	%>