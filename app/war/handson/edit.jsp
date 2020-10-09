<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
   <head>
      <title>Form Mytable</title>
   </head>
    <body> 
	  <H1>SELECT Mytable</H1> 
<%
String id=request.getParameter("id");  

Connection con = null; 
Statement st   = null;
ResultSet rs = null;

try
{

	Class.forName("org.mariadb.jdbc.Driver");
	
	con = DriverManager.getConnection(
		"jdbc:mariadb://127.0.0.1:3306/handson",
		"handson",
		"1234"); 

	st=con.createStatement();
 
	String sql ="select * from mytable where id="+id;
	rs = st.executeQuery(sql);
	while(rs.next()){
%>

  <a href="./index.jsp">HOME</a> <a href="./mytable.jsp">List</a>
  <form action="update.jsp" method="POST">
  <input type="hidden" name="id" value="<%=rs.getString("id") %>">
  <table border = "1" width="50%">
	 <tr>
		<td width="20%">Name</td>
		<td><input type="text" name="name" value="<%=rs.getString("name") %>"></td> 
	 </tr>
	 <tr>
		<td width="20%">Age</td>
		<td><input type="number" name="age" value="<%=rs.getString("age") %>"></td> 
	 </tr>
	 <tr>
		<td width="20%">Class</td>
		<td><input type="text" name="class" value="<%=rs.getString("class") %>" maxlength="5"></td> 
	 </tr>
	 <tr>
		<td colspan=2><input type="submit" value="save"></td> 
	 </tr> 
	</table>
	</form>

<%
	}
}	
	catch(Exception e)
{
	out.print(e);
	System.out.print(e);
	e.printStackTrace();
}
%>


   
  
	 
	</body>
</html>