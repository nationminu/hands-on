<%@ page import = "java.io.*,java.util.*,java.sql.*"%>  
<html>
   <head>
      <title>SELECT Mytable</title>
   </head>

   <body> 
	  <H1>SELECT Mytable</H1> 
	  <a href="./index.jsp">HOME</a> <a href="./form.jsp">Write</a>
      <table border = "1" width = "100%">
         <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Class</th> 
            <th>Edit</th> 
            <th>Delete</th> 
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
                        
            pstmt = con.prepareStatement("select * from mytable");
            
            rs = pstmt.executeQuery();

			while(rs.next()) {
            %>

            <tr>
               <td><%=rs.getString("id")%></td>
               <td><%=rs.getString("name")%></td>
               <td><%=rs.getString("age")%></td>
               <td><%=rs.getString("class")%></td> 
               <td><a href="edit.jsp?id=<%=rs.getString("id")%>">Edit</a></td> 
               <td><a href="delete.jsp?id=<%=rs.getString("id")%>">Delete</a></td> 
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
