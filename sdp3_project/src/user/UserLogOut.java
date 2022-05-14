package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLogOut
 */
@WebServlet("/UserLogOut")
public class UserLogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(false);
		session.invalidate();
		out.println("<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "<head>\r\n"
				+ "<meta charset=\"ISO-8859-1\">\r\n"
				+ "<title>Login</title>\r\n"
				+ "<link rel=\"stylesheet\" href=\"styles.css\">\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ " <div id='topnav'>\r\n"
				+ "        <a href=\"home.html\">E_BALLOT</a>\r\n"
				+ "        <div class='topnav-right'>\r\n"
				+ "            <a href=\"login.html\">Login</a>\r\n"
				+ "            <a href=\"register.html\">Register</a>\r\n"
				+ "        </div>\r\n"
				+ "    </div>");
		out.print("<h3 id='logouthead3'>Logout successfull</h3>");
		out.println("</body>\r\n"
				+ "</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
