package liveIn.beans;

import java.sql.Date;

public class UserBean {
	private String name,email,phone,password,confirmpassword;
	private int id;
	private Date date;
	private String city,address;
	
	
	
	public UserBean(String email,String name, String phone, String city, String address) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.city = city;
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public UserBean(String name, String email, String phone, String password) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public UserBean(String name, String email, String phone, String password, String confirmpassword, Date date) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.confirmpassword = confirmpassword;
		this.date = date;
	}
	public UserBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
