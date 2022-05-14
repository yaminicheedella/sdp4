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
        <a href='profile.jsp'>Profile</a>
        <a href='u_1_addVote.jsp'>Add Vote</a>
         <a href='u_2_ViewResults.jsp'>View Results</a>
         <a href='UserLogOut'>Log Out</a>
    </div>
    
    <div class='content'>
        <div id='topnav'>
            <p style='text-align: center; color:white; font-family: monospace; font-size: x-large;'>E_BALLOT</p>
        </div>
        <%
       			try {
                	String election_input = request.getParameter("ele_name");
                	
                	Class.forName("oracle.jdbc.driver.OracleDriver");
                	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                					"election","election123");
 
                		String sql = "select can_id, count(*) as freq from votes where ele_id_name=? group by can_id";
                			 PreparedStatement pst = con.prepareStatement(sql);
								
                			 pst.setString(1, election_input);
								ResultSet rs = pst.executeQuery();
							while(rs.next()){
									String c_id = rs.getString(1);
									String count = rs.getString(2);
									
									String q = "update candidates set count = ? where c_id=? and c_ele_name=?";
									 PreparedStatement pst1 = con.prepareStatement(q);
									 	pst1.setString(1, count);
										pst1.setString(2, c_id);
										pst1.setString(3, election_input);
										pst1.executeUpdate();
								}
							
							String sql1 = "select c_id,cname,c_party, count from candidates where count in (select max(count)from candidates where c_ele_name = ?)";
							 PreparedStatement pst2 = con.prepareStatement(sql1);
							 pst2.setString(1, election_input);
							 
							 ResultSet rs2 = pst2.executeQuery();
							 
							 int c = 0;
							 String cname = " ";
							 String cparty = " ";
							 while(rs2.next()){
								 c = c + 1;
								 cname = rs2.getString(2);
								 cparty = rs2.getString(3);
							 }
							 if(c == 1){
									out.println("<h3>Winner Canididate is</h3>"+ cname);
									out.println("<h3>Winner Canididate Party is</h3>"+ cparty);
								}else if(c > 1){
									out.println("<h3 id='nothing'>Needs Re Election</h3>");
								}else{
									out.println("<h3 id='nothing'>Here's Nothing to Display</h3>");
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