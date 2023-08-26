package liveIn.beans;

import java.sql.Date;

public class FeedbackBean {
	private int rating,sno;
	private String username,email,feedbacktext,status;
	
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private Date date;
	
	public FeedbackBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FeedbackBean(String username, String email,int rating, String feedbacktext, Date date,String status) {
		super();
		this.rating = rating;
		this.username = username;
		this.email = email;
		this.feedbacktext = feedbacktext;
		this.date = date;
		this.status = status;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFeedbacktext() {
		return feedbacktext;
	}
	public void setFeedbacktext(String feedbacktext) {
		this.feedbacktext = feedbacktext;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
