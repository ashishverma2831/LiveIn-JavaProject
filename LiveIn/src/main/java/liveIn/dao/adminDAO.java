package liveIn.dao;

import java.util.ArrayList;
import java.sql.*;
import liveIn.beans.*;
import liveIn.dbutils.DBConnection;


public class adminDAO {
	public ArrayList<FeedbackBean> viewFeedbacks(){
		ArrayList<FeedbackBean> feedbackList = new ArrayList<>();
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String select_query = "select * from feedbacks";
		
		try {
			ps=con.prepareStatement(select_query);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("Name");
				String email = rs.getString("Email");
				String ratings = rs.getString("Ratings");
				String feedbackText = rs.getString("FeedbackText");
				Date date = rs.getDate("Date");
				String sno = rs.getString("Sno");
				
				FeedbackBean fb = new FeedbackBean();
				fb.setUsername(name);
				fb.setEmail(email);
				fb.setRating(Integer.parseInt(ratings));
				fb.setFeedbacktext(feedbackText);
				fb.setDate(date);
				fb.setSno(Integer.parseInt(sno));
				feedbackList.add(fb);
			}
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return feedbackList;
	}
	
	public ArrayList<ContactusBean> viewContacts(){
		ArrayList<ContactusBean> contactList = new ArrayList<>();
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String selectQuery = "select * from contacts";
		
		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String sno = rs.getString("Sno");
				String name = rs.getString("Name");
				String email = rs.getString("Email");
				String subject = rs.getString("Subject");
				String message = rs.getString("Message");
				Date date = rs.getDate("Date");
				
				ContactusBean cb = new ContactusBean();
				cb.setSno(Integer.parseInt(sno));
				cb.setName(name);
				cb.setEmail(email);
				cb.setSubject(subject);
				cb.setMessage(message);;
				cb.setDate(date);
				contactList.add(cb);
			}
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return contactList;
	}

	public int addHostelDetails(SubmitpgBean s) {
		int status=0;
		Connection con = DBConnection.openConnection();
		PreparedStatement ps=null;
		try {
			String insertQuery = "insert into submitpg(OwnerName, OwnerEmail, OwnerPhone, AccomodationFor, SuitableFor, Price, HostelTitle, HostelDescription, Image, City, Locality, Address, Date) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(insertQuery);
			
			ps.setString(1, s.getOwnername());
			ps.setString(2, s.getOwneremail());
			ps.setString(3, s.getOwnerphone());
			ps.setString(4, s.getAccomodation());
			ps.setString(5, s.getSuitable());
			ps.setString(6, s.getPrice());
			ps.setString(7, s.getHosteltitle());
			ps.setString(8, s.getHosteldescription());
			ps.setString(9, s.getImage());
			ps.setString(10, s.getCity());
			ps.setString(11, s.getLocality());
			ps.setString(12, s.getAddress());
			ps.setDate(13, s.getDate());
			
			System.out.println(ps);
			status = ps.executeUpdate();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return status;
	}
	
	public ArrayList<SubmitpgBean> viewHostels(){
		ArrayList<SubmitpgBean> hostelList = new ArrayList<>();
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String selectQuery = "select * from submitpg";
		
		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("OwnerName");
				String email = rs.getString("OwnerEmail");
				String phone = rs.getString("OwnerPhone");
				String id = rs.getString("Id");
				String accomodation = rs.getString("AccomodationFor");
				String suitable = rs.getString("SuitableFor");
				String price = rs.getString("Price");
				String title = rs.getString("HostelTitle");
				String description = rs.getString("HostelDescription");
				String image = rs.getString("Image");
				String city = rs.getString("City");
				String locality = rs.getString("Locality");
				String address = rs.getString("Address");
				Date date = rs.getDate("Date");
				
				SubmitpgBean pg = new SubmitpgBean();
				pg.setOwnername(name);
				pg.setOwneremail(email);
				pg.setOwnerphone(phone);
				pg.setId(Integer.parseInt(id));
				pg.setAccomodation(accomodation);
				pg.setSuitable(suitable);
				pg.setPrice(price);
				pg.setHosteltitle(title);
				pg.setHosteldescription(description);
				pg.setImage(image);
				pg.setCity(city);
				pg.setLocality(locality);
				pg.setAddress(address);
				pg.setDate(date);
				hostelList.add(pg);
			}
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return hostelList;
	}
	
	public ArrayList<SubmitpgBean> cityHostelsList(String searchcity){
       ArrayList<SubmitpgBean> citywiseHostelList = new ArrayList<>();
		
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
		//	String selectQuery = "select * from submitpg where City=?";
			String selectQuery = "select * from submitpg where City=? or Locality=?";
			ps=con.prepareStatement(selectQuery);
			ps.setString(1, searchcity);
			ps.setString(2, searchcity);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("Ownername");
				String email = rs.getString("OwnerEmail");
				String phone = rs.getString("OwnerPhone");
				String accomodation = rs.getString("AccomodationFor");
				String suitable = rs.getString("SuitableFor");
				String price = rs.getString("Price");
				String title = rs.getString("HostelTitle");
				String description = rs.getString("HostelDescription");
				String image = rs.getString("Image");
				String city = rs.getString("City");
				String locality = rs.getString("Locality");
				String address = rs.getString("Address");
				Date date = rs.getDate("Date");
				
				SubmitpgBean sg = new SubmitpgBean(name, email, phone, accomodation, suitable, price, title, description, image, city, locality, address, date);
				citywiseHostelList.add(sg);
			}
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return citywiseHostelList;
	}
}
