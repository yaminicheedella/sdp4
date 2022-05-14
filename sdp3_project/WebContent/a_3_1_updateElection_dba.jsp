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
<title>Update Candidate </title>
<link rel='stylesheet' href='styles.css'>
<style>
	h2{
		color:green;
		font-family: monospace;
	}
	table{
		width: 100%;
		height: 100%;
	}
	table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	}
	th, td {
	padding: 5px;
	text-align: left;
	}
	a{
		text-decoration:none;
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
        <% 
 
		try {
			 String  ele_id = request.getParameter("ele_id");
		     String ele_name = request.getParameter("ele_name");
		     String ele_sdate = request.getParameter("ele_sdate");
		     String ele_edate = request.getParameter("ele_edate");
		       
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","election","election123");
			
			String sql = "update election set ele_name = ?, ele_sdate = ?, ele_edate = ? where ele_id = ?";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ele_name);
			pstmt.setString(2, ele_sdate);
			pstmt.setString(3, ele_edate);
			pstmt.setString(4, ele_id);
			
	
			int count = pstmt.executeUpdate();
				
				if(count>0){
					out.println("<h3>Successfully updated Election</h3>");
					out.println("<h3><a href='a_3_1_allElections.jsp'>View Elections Here</a></h3>");
					
				} else {
					out.println("<h3>update failed</h3>");
				}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		%>
    </div>
</body>
</html>