package liveIn.admin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class admin_login_s
 */
@WebServlet("/admin_login_s")
public class admin_login_s extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_login_s() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(email.equals("ashishverma510207@gmail.com")&&password.equals("PASSword@123")) {
			HttpSession hs = request.getSession();
			hs.setAttribute("adminSessionId",email);
			hs.setAttribute("role","Admin");
			
			response.sendRedirect("/LiveIn/admin/admin_home.jsp");
		}
		else {
			request.setAttribute("msg", "Invalid Credentials");
			RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
			rd.forward(request, response);
		}
		
		System.out.println(email);
		System.out.println(password);
	}

}
