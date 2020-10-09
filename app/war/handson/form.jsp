<html>
   <head>
      <title>Form Mytable</title>
   </head>

   
   <body> 
	  <H1>SELECT Mytable</H1> 
	  <a href="./index.jsp">HOME</a> <a href="./mytable.jsp">List</a>
	  <form action="save.jsp" method="POST">
      <table border = "1" width="50%">
         <tr>
            <td width="20%">Name</td>
            <td><input type="text" name="name" value=""></td> 
         </tr>
         <tr>
            <td width="20%">Age</td>
            <td><input type="number" name="age" value=""></td> 
         </tr>
         <tr>
            <td width="20%">Class</td>
            <td><input type="text" name="class" value="" maxlength="5"></td> 
         </tr>
         <tr>
            <td colspan=2><input type="submit" value="save"></td> 
         </tr> 
		</table>
		</form>
	</body>
</html>