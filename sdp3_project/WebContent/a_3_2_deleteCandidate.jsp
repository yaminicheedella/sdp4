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
<title>Delete User </title>
<link rel='stylesheet' href='styles.css'>
<style>
	h2{
		color:green;
		font-family: monospace;
	}
	a{
		text-decoration:none;
	}
	#non{
		color : red;
		padding : 10%;
	}
	#can{
		color : green;
		text-align : center;
	}
	#box{
		text-align : center;
		border-width : 5px;
		padding : 12% 10%;
	}
</style>
</head>
<body>
<div class="sidebar">
          <a class='active' >Menu</a>
        <a  href="admindash.jsp">Admin Dashboard</a>
      <a  href="a_1_addElection.jsp">Add Election</a>
        <a  href="a_2_addCandidate.jsp">Add Candidate</a>
        <a  href="a_3_view.jsp">View</a>
        <a href='AdminLogOut'>Logout</a>
    </div>
    
    <div class='content'>
        <div id='topnav'>
            <p style='text-align: center; color:white; font-family: monospace; font-size: x-large;'>E_BALLOT</p>
        </div>
        <div id='box'>
        	<% 
        	String  cid = request.getParameter("cid");
			%>
			<h2>Do you want to delete the Candidate "<%= cid %>"</h2>
			<a id='non' href='a_3_2_deleteCandidate_dba.jsp?cid=<%= cid %>'>Delete</a>
			<a id='can' href='a_3_2_allCandidates.jsp'>Cancel</a>
	    </div>
        </div>
        
</body>
</html>