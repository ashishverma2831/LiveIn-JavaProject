package liveIn.users.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import liveIn.beans.*;
import liveIn.dao.*;

/**
 * Servlet implementation class contactus
 * @param <ContactUS_Bean>
 */
@WebServlet("/contactus")
public class contactus<ContactUS_Bean> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contactus() {
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
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		java.util.Date dt = new java.util.Date();
		long d =dt.getTime();
		
		java.sql.Date sqlDate = new java.sql.Date(d);
		ContactusBean cb = new ContactusBean(name, email, subject, message, sqlDate);
		
		userDAO dao = new userDAO();
		int status = dao.addContacts(cb);
		
		if(status>0) {
			request.setAttribute("msg","Thankyou for Contacting Us.");
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/contactus.jsp");
			rd.forward(request, response);
		}
		
		System.out.println(name);
		System.out.println(email);
		System.out.println(subject);
		System.out.println(message);
	}

}
