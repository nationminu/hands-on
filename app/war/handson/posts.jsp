<%@ page import = "java.io.*,java.util.*,java.sql.*"%>  
<html>
   <head>
      <title>SELECT Posts</title>
   </head>

   <body> 
	  <H1>SELECT Posts</H1>
	  <a href="./index.jsp">HOME</a>
      <table border = "1" width = "100%">
         <tr>
            <th>ID</th>
            <th>Author_id</th>
            <th>Title</th>
            <th>Date</th>
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
                        
            pstmt = con.prepareStatement("select * from posts");
            
            rs = pstmt.executeQuery();

			while(rs.next()) {
            %>

            <tr>
               <td><%=rs.getString("id")%></td>
               <td><%=rs.getString("author_id")%></td>
               <td><%=rs.getString("title")%></td>
               <td><%=rs.getString("date")%></td>
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
