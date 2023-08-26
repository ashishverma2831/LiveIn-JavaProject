package liveIn.users.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import liveIn.beans.UserBean;
import liveIn.dao.userDAO;

/**
 * Servlet implementation class userlogin
 */
@WebServlet("/userlogin")
public class userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userlogin() {
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
		
		userDAO dao = new userDAO();
		UserBean user = dao.userLogin(email,password);
		
		if(user!=null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("userSessionId",email);
			hs.setAttribute("userDetails", user);
			response.sendRedirect("/LiveIn/user/user_home.jsp");
		}
		else {
			request.setAttribute("msg", "Invalid Credentials.");
			RequestDispatcher rd = request.getRequestDispatcher("/user/user_login.jsp");
			rd.forward(request, response);
		}	
		System.out.println(email);
		System.out.println(password);
	}

}
