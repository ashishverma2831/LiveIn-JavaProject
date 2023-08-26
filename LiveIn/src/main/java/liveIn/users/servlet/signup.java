package liveIn.users.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import liveIn.beans.UserBean;
import liveIn.dao.userDAO;


/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public signup() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		System.out.println(email);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		userDAO dao= new userDAO();
		boolean status = dao.check(email);
		if(status) {
			out.println("Email already exists");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirm-password");

		java.util.Date dt = new java.util.Date();
		long d = dt.getTime();

		java.sql.Date sqlDate = new java.sql.Date(d);
		UserBean sb = new UserBean(name, email, phone, password, confirmPassword, sqlDate);
		
		if(password.equals(confirmPassword)) {	
			userDAO dao = new userDAO();
			int status = dao.addUser(sb);
			
			if (status > 0) {	
				  request.setAttribute("msg", "You have registered successfully, you can login now.");
				  RequestDispatcher dispatcher =
				  request.getRequestDispatcher("/user/user_login.jsp");
				  dispatcher.forward(request, response);
			}
		}
		else {
			request.setAttribute("msg","password doesn't match to confirm password");
			RequestDispatcher rd = request.getRequestDispatcher("/user/sign_up.jsp");
			rd.forward(request, response);
		}

		/*
		 * if (status > 0) { request.setAttribute("msg",
		 * "You have registered successfully, you can login now."); RequestDispatcher
		 * dispatcher = request.getRequestDispatcher("/user/user_login.jsp");
		 * dispatcher.forward(request, response); }
		 */

		/*
		 * System.out.println(name); System.out.println(email);
		 * System.out.println(phone); System.out.println(password);
		 * System.out.println(confirmPassword);
		 */
	}

}
