package liveIn.users.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import liveIn.beans.FeedbackBean;
import liveIn.dao.userDAO;

/**
 * Servlet implementation class feedbacks
 */
@WebServlet("/feedbacks")
public class feedbacks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public feedbacks() {
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
		String username = request.getParameter("txtname");
		String email = request.getParameter("txtemail");
		String rating = request.getParameter("selectoption");
		String feedbacktext = request.getParameter("txtfeedback");
		String chk = request.getParameter("checkbox");
		
		java.util.Date dt = new java.util.Date();
		long d = dt.getTime();
		
		java.sql.Date sqlDate = new java.sql.Date(d);
		FeedbackBean fb = new FeedbackBean(username, email,Integer.parseInt(rating), feedbacktext, sqlDate,chk);
		fb.setStatus(chk);
		
		userDAO dao = new userDAO();
		int status = dao.addFeedback(fb);
		
		if(status>0) {
			request.setAttribute("msg","Thankyou for your Feedback, your feedback submitted successfully.");
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/feedback.jsp");
			rd.forward(request, response);
		}
		
		/* System.out.println(username); */
	}

}
