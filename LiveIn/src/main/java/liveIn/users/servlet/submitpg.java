package liveIn.users.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import liveIn.beans.SubmitpgBean;
import liveIn.dao.*;

/**
 * Servlet implementation class submitpg
 */
@WebServlet("/submitpg")
public class submitpg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitpg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * String address = request.getParameter("address");
		 * System.out.println(address);
		 * 
		 * response.setContentType("text/html"); PrintWriter out = response.getWriter();
		 * 
		 * userDAO dao= new userDAO(); boolean status = dao.check(address); if(status) {
		 * out.println("A Hostel already exists at this location"); }
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String selectAccomodation = request.getParameter("selectAccomodation");
		String selectSuitable = request.getParameter("selectSuitable");
		String price = request.getParameter("price");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String image = request.getParameter("image");
		String selectCity = request.getParameter("selectCity");
		String selectLocality = request.getParameter("selectLocality");
		String address = request.getParameter("address");
		
		String uploadImageFilePath = "F:/advanceJava/LiveIn/src/main/webapp/images/"+image;
		try {
			FileOutputStream fos = new FileOutputStream(uploadImageFilePath);
			byte b[] = uploadImageFilePath.getBytes();
			fos.write(b);
			fos.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		/*
		 * UserBean currentUser = (UserBean)session.getAttribute("userDetails");
		 * System.out.println(currentUser.getEmail());
		 */
			
		java.util.Date dt = new java.util.Date();
		long d = dt.getTime();
		
		java.sql.Date sqlDate = new java.sql.Date(d);
		/*
		 * SubmitpgBean sg = new SubmitpgBean(selectAccomodation, selectSuitable, price,
		 * title, description, image, selectCity, selectLocality, address, sqlDate);
		 */		
		SubmitpgBean sg = new SubmitpgBean(name, email, phone, selectAccomodation, selectSuitable, price, title, description, image, selectCity, selectLocality, address, sqlDate);
		/*
		 * sg.setOwnername(currentUser.getName());
		 * sg.setOwneremail(currentUser.getEmail());
		 * sg.setOwnerphone(currentUser.getPhone());
		 */
		 
		
		adminDAO dao = new adminDAO();
		int status = dao.addHostelDetails(sg);
		System.out.println(status);
		
		if(status>0) {
			request.setAttribute("msg","Your Hostel details are submitted sucessfully.");
			RequestDispatcher rd = request.getRequestDispatcher("/user/submit_pg.jsp");
			rd.forward(request, response);
		}
		
		
		System.out.println(selectAccomodation);
		System.out.println(selectSuitable);
		System.out.println(price);
		System.out.println(title);
		System.out.println(description);
		System.out.println(image);
		System.out.println(selectCity);
		System.out.println(selectLocality);
		System.out.println(address);
		
	}

}
