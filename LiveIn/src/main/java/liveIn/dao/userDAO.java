package liveIn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import liveIn.beans.*;
import liveIn.dbutils.DBConnection;

public class userDAO {
	public int addContacts(ContactusBean c) {
		int status=0;
		Connection con = DBConnection.openConnection();
		PreparedStatement ps=null;
		try {
			String insertQuery = "insert into contacts(Name,Email,Subject,Message,Date) values (?,?,?,?,?)";
			ps=con.prepareStatement(insertQuery);
			
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getSubject());
			ps.setString(4, c.getMessage());
			ps.setDate(5, c.getDate());
			
			System.out.println(ps);
			status = ps.executeUpdate();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return status;
	}
	
	public int addFeedback(FeedbackBean f) {
		int status=0;
		Connection con = DBConnection.openConnection();
		PreparedStatement ps =null;
		
		try {
			
			String insertQuery = "insert into feedbacks(Name,Email,Ratings,FeedbackText,Date,Checkbox) values(?,?,?,?,?,?)";
			ps=con.prepareStatement(insertQuery);
			
			ps.setString(1,f.getUsername());
			ps.setString(2, f.getEmail());
			ps.setInt(3, f.getRating());
			ps.setString(4, f.getFeedbacktext());
			ps.setDate(5, f.getDate());
			ps.setString(6, f.getStatus());
			
			status = ps.executeUpdate();
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return status;
	}

	
	  public int addUser(UserBean us) 
	  { 
		  int status=0; 
		  Connection con = DBConnection.openConnection(); 
		  PreparedStatement ps=null; 
		  try { 
			  String insertQuery = "insert into users(Name, Email, Phone, Password, ConfirmPassword, Date) values(?,?,?,?,?,?)";			  
			  ps=con.prepareStatement(insertQuery);
			  
			  	ps.setString(1,us.getName());
				ps.setString(2,us.getEmail());
				ps.setString(3, us.getPhone());
				ps.setString(4, us.getPassword());
				ps.setString(5, us.getConfirmpassword());
				ps.setDate(6, us.getDate());
				
				status = ps.executeUpdate();
		  }catch(SQLException se) {
			  se.printStackTrace(); 
		  } 
	  return status; 
	  }
	 
	  public UserBean userLogin(String email,String password) {
		  Connection con = DBConnection.openConnection();
		  PreparedStatement ps = null;
		  ResultSet rs = null;
		  UserBean user = null;
		  
		  String selectQuery = "select * from users where Email=? and Password=?";
		  
		  try {
			  ps=con.prepareStatement(selectQuery);
			  ps.setString(1, email);
			  ps.setString(2, password);
			  
			  rs=ps.executeQuery();
			  if(rs.next()==true) {
				  user = new UserBean();
				  String name = rs.getString("Name");
				  String userEmail = rs.getString("Email");
				  String phone = rs.getString("Phone");
				  String userPassword = rs.getString("Password");
				  
				  user.setName(name);
				  user.setEmail(userEmail);
				  user.setPhone(phone);
				  user.setPassword(userPassword);		    
			  }
		  }
		  catch(SQLException se) {
			  se.printStackTrace();
		  }
		  return user;
	  }

	public UserBean changePassword(UserBean ub) {
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		String updateQuery = "update users set Password=?,ConfirmPassword=? where Email=?";
		int status=0;
		UserBean updatedUser = null;		
		try {
			 ps=con.prepareStatement(updateQuery);
			 ps.setString(1, ub.getPassword());
			 ps.setString(2, ub.getConfirmpassword());
			 ps.setString(3, ub.getEmail());
			  
			 status = ps.executeUpdate();
			 if(status>0) {
				 String strSQL = "select * from users where Email=?";
				 PreparedStatement ps1 = null;
				 ResultSet rs = null;
				 
				 ps1 = con.prepareStatement(strSQL);
				 ps1.setString(1, ub.getEmail());
				 rs=ps1.executeQuery();
				 rs.next();
				 
				 String name = rs.getString("Name");
				 String email = rs.getString("Email");
				 String phone = rs.getString("Phone");
				 String password = rs.getString("Password");
				 /*String confirmPassword = rs.getString("ConfirmPassword");*/

				 updatedUser = new UserBean(name, email, phone, password);
			 }
			 	  
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return updatedUser;
	}
	
	
	public boolean check(String email) {
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select Email from users where Email=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,email);
			rs=ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return false;
	}
	
	public boolean checkAddress(String address) {
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select Email from submitpg where Address=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,address);
			rs=ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		return false;
	}

	public UserBean saveChanges(UserBean newUser) {
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		String updateQuery = "update users set Name=?, Phone=?,City=?,Address=? where Email=?";
		UserBean checkUser = null;
		int status=0;
		
		try {
			ps = con.prepareStatement(updateQuery);
			ps.setString(1, newUser.getName());
			ps.setString(2, newUser.getPhone());
			ps.setString(3, newUser.getCity());
			ps.setString(4, newUser.getAddress());
			ps.setString(5, newUser.getEmail());
			status=ps.executeUpdate();
			if(status>0) {
				String strSQL = "select * from users where Email=?";
				PreparedStatement ps1 = null;
				ResultSet rs = null;
				
				ps1 = con.prepareStatement(strSQL);
				ps1.setString(1, newUser.getEmail());
				rs = ps1.executeQuery();
				rs.next();
				//Id, Name, Email, Phone, Password, ConfirmPassword, City, Address, Date
				String name = rs.getString("Name");
				String email = rs.getString("Email");
				String phone = rs.getString("Phone");
				String city = rs.getString("City");
				String address = rs.getString("Address");
				
				checkUser = new UserBean(email, name, phone, city, address);
			}
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		
		return checkUser;
	}
}
