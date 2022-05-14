<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires","0");
	if(session == null || session.getAttribute("un") == null || session.getAttribute("pw") == null){
		response.sendRedirect("error.html");	
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Vote</title>
<link rel='stylesheet' href='styles.css'>
</head>
<body>
<div class="sidebar">
         <a class='active' >Menu</a>
        <a href='profile.jsp'>Profile</a>
        <a href='u_1_addVote.jsp'>Add Vote</a>
         <a href='u_2_ViewResults.jsp'>View Results</a>
         <a href='UserLogOut'>Log Out</a>
    </div>
    
    <div class='content'>
        <div id='topnav'>
            <p style='text-align: center; color:white; font-family: monospace; font-size: x-large;'>E_BALLOT</p>
        </div>
        <h2>Add Vote</h2>
        	<form method="post"  action='u_1_Add_Vote.jsp'>
<hr>

                      <label for="ele_name"> Select Election  </label>
                    <div>
                        <%
                        try {
                			
                			Class.forName("oracle.jdbc.driver.OracleDriver");
                			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                					"election","election123");
                			System.out.println("Connected to database");

                			 Statement statement = con.createStatement() ;

                			 ResultSet resultset =statement.executeQuery("select * from election") ;
                			 %>
                			 <select name="ele_name" id="ele_name">
                			 		<option>Select Election Name - ID</option>
                		        <%  while(resultset.next()){ %>
                		            <option value="<%= resultset.getString(1)%> - <%=resultset.getString(2)%>"><%= resultset.getString(1)%> - <%=resultset.getString(2)%></option>
                		        <% } %>
                		        </select>
   						<% 
                		} catch (ClassNotFoundException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		} catch (SQLException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		}
                        %>
                    </div>
 
                    <input type="submit" value="Search">

                </form>
    </div>
</body>
</html>