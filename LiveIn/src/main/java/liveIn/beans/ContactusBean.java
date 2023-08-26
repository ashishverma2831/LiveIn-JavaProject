package liveIn.beans;

import java.sql.Date;

public class ContactusBean {
	private String name,email,subject,message;
	private Date date;
	private int sno;
	
		
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public ContactusBean(String name, String email, String subject, String message, Date date) {
		super();
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.date = date;
	}
	public ContactusBean() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
