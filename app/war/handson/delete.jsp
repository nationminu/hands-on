<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String id=request.getParameter("id"); 

Connection con = null; 
Statement st   = null;

try
{

	Class.forName("org.mariadb.jdbc.Driver");
	
	con = DriverManager.getConnection(
		"jdbc:mariadb://127.0.0.1:3306/handson",
		"handson",
		"1234"); 

	st=con.createStatement();

	int i=st.executeUpdate("delete from mytable where id='" + id + "'");
	
	out.println("Data is successfully deleted!");
	
}	
	catch(Exception e)
{
	out.print(e);
	System.out.print(e);
	e.printStackTrace();
}
%>
<div><a href="./index.jsp">home</a></div>
<div><a href="./authors.jsp">authors</a></div>
<div><a href="./posts.jsp">posts</a></div>
<div><a href="./mytable.jsp">mytable</a></div>
<script>
window.location.href = "./mytable.jsp";
</script>