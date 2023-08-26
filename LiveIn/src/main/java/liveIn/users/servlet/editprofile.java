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
 * Servlet implementation class editprofile
 */
@WebServlet("/editprofile")
public class editprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editprofile() {
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
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String city = request.getParameter("city"); 
		String address = request.getParameter("address");
		
		HttpSession hs = request.getSession(false);
		String email =(String) hs.getAttribute("userSessionId");
		System.out.println(email);
		
		UserBean oldUser = new UserBean(email, name, phone, city, address);
		userDAO dao = new userDAO();
		UserBean newUser = dao.saveChanges(oldUser);
		
		if(newUser!=null) {
			request.setAttribute("msg","Changes saved successfully.");
			RequestDispatcher rd = request.getRequestDispatcher("/user/edit_profile.jsp");
			rd.forward(request, response);
		}
		
		System.out.println(name);
		System.out.println(phone);
		System.out.println(city);
		System.out.println(address);
	}

}
