<%@ page import = "java.io.*,java.util.*,java.sql.*"%>  
<html>
   <head>
      <title>SELECT Authors</title>
   </head>

   <body> 
	  <H1>SELECT Authors</H1> 
	  <a href="./index.jsp">HOME</a>
      <table border = "1" width = "100%">
         <tr>
            <th>ID</th>
            <th>first_name</th>
            <th>last_name</th>
            <th>email</th>
            <th>birthdate</th>
            <th>added</th>
         </tr>
         <%
		 
		Connection con = null;
		PreparedStatement pstmt = null;   
		ResultSet rs = null;

		 try {
			Class.forName("org.mariadb.jdbc.Driver");
            
            con = DriverManager.getConnection(
                "jdbc:mariadb://127.0.0.1:3306/handson",
                "handson",
                "1234");
                        
            pstmt = con.prepareStatement("select * from authors");
            
            rs = pstmt.executeQuery();

			while(rs.next()) {
            %>

            <tr>
               <td><%=rs.getString("id")%></td>
               <td><%=rs.getString("first_name")%></td>
               <td><%=rs.getString("last_name")%></td>
               <td><%=rs.getString("email")%></td>
               <td><%=rs.getString("birthdate")%></td>
               <td><%=rs.getString("added")%></td>
            </tr> 
			<%
				 }
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) {
						rs.close(); // 선택 사항
					}
					
					if(pstmt != null) {
						pstmt.close(); // 선택사항이지만 호출 추천
					}
				
					if(con != null) {
						con.close(); // 필수 사항
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			%>

      </table>
 
   </body>
</html>
