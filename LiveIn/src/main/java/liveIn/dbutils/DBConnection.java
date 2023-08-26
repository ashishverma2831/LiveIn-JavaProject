package liveIn.dbutils;

import java.sql.*;

public class DBConnection {
	
	
	private static Connection con;
	
	public static Connection openConnection() {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/liveindb","root","PASSword@281631");
		}
		catch(SQLException | ClassNotFoundException se) {
			/* se.printStackTrace(); */
			System.out.println(se);
		}
		return con;
	}

	public static void closeConnection() {
		if(con != null) {
			try {
				con.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public static void main(String[] args) {
		Connection c = DBConnection.openConnection();
		System.out.println(c);

	}

}
