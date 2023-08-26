package liveIn.users.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import liveIn.beans.UserBean;
import liveIn.dao.userDAO;

/**
 * Servlet implementation class changepassword
 */
@WebServlet("/changepassword")
public class changepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changepassword() {
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
		String newPassword = request.getParameter("password");
		String confirmPassword = request.getParameter("confirm-password");
		 
		HttpSession hs = request.getSession(false);
		String id = (String)hs.getAttribute("userSessionId");
		System.out.println(id);
		
	    UserBean user = new UserBean();
		user.setEmail(id);
	    user.setPassword(newPassword);
	    user.setConfirmpassword(confirmPassword);
		
		  if(newPassword.equals(confirmPassword)) {
		  
			  userDAO dao = new userDAO();
			  UserBean newUser = dao.changePassword(user);
		  
			  if(newUser!=null) {
				  	request.setAttribute("msg","Password updated successfully.");
				  	RequestDispatcher dispatcher =
				  	request.getRequestDispatcher("/user/change_password.jsp");
				  	dispatcher.forward(request, response); 
				  }
		  } else {
		  request.setAttribute("msg","password doesn't match to confirm password");
		  RequestDispatcher rd =
		  request.getRequestDispatcher("/user/change_password.jsp");
		  rd.forward(request, response); }
		  
		System.out.println(newPassword);
		System.out.println(confirmPassword);
	}

}
