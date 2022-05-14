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
<title>Viewing Results</title>
<link rel='stylesheet' href='styles.css'>
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
                	String election_input = (String)session.getAttribute("elename");
                	
                	Class.forName("oracle.jdbc.driver.OracleDriver");
                	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                					"election","election123");
 
                		String sql = "select count(stu_id),can_id from votes where ele_id_name = ? group by can_id";
                		
                		PreparedStatement ps = con.prepareStatement(sql);
                		
                		ps.setString(1, election_input);
                		
                		ResultSet rs = ps.executeQuery();
                		
                		while(rs.next()){
                			String c_id = rs.getString(2);
                			String count = rs.getString(1);
                			String ele = election_input;
                			
                			
                					String sql1 = "insert into votes_count values(?,?,?)";
                        			
                        			PreparedStatement ps1 = con.prepareStatement(sql1);
                        			
                        			ps1.setString(1, ele);
                        			ps1.setString(2, c_id);
                        			ps1.setString(3, count);
                        			
                        		    ps1.executeUpdate();
                
                
                		}
                		out.println("<h3><a href='a_4_1_view_results.jsp'>Click Me</a></h3>");
                		
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