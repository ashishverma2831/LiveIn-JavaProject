package liveIn.beans;

import java.sql.Date;

public class SubmitpgBean {
	
	//Id, AccomodationFor, SuitableFor, Price, HostelTitle, HostelDescription, Image, City, Locality, Address, Date
	private int id;
	private String accomodation,suitable,price,hosteltitle,hosteldescription,image,city,locality,address;
	private Date date;
	private String ownername,owneremail,ownerphone;
	
	
	
	
	public SubmitpgBean(String ownername, String owneremail, String ownerphone,String accomodation, String suitable, String price, String hosteltitle,
			String hosteldescription, String image, String city, String locality, String address, Date date
			) {
		super();
		this.accomodation = accomodation;
		this.suitable = suitable;
		this.price = price;
		this.hosteltitle = hosteltitle;
		this.hosteldescription = hosteldescription;
		this.image = image;
		this.city = city;
		this.locality = locality;
		this.address = address;
		this.date = date;
		this.ownername = ownername;
		this.owneremail = owneremail;
		this.ownerphone = ownerphone;
	}
	public String getOwnername() {
		return ownername;
	}
	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}
	public String getOwneremail() {
		return owneremail;
	}
	public void setOwneremail(String owneremail) {
		this.owneremail = owneremail;
	}
	public String getOwnerphone() {
		return ownerphone;
	}
	public void setOwnerphone(String ownerphone) {
		this.ownerphone = ownerphone;
	}
	public SubmitpgBean(String accomodation, String suitable, String price, String hosteltitle, String hosteldescription,
			String image, String city, String locality, String address, Date date) {
		super();
		this.accomodation = accomodation;
		this.suitable = suitable;
		this.price = price;
		this.hosteltitle = hosteltitle;
		this.hosteldescription = hosteldescription;
		this.image = image;
		this.city = city;
		this.locality = locality;
		this.address = address;
		this.date = date;
	}
	public SubmitpgBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccomodation() {
		return accomodation;
	}
	public void setAccomodation(String accomodation) {
		this.accomodation = accomodation;
	}
	public String getSuitable() {
		return suitable;
	}
	public void setSuitable(String suitable) {
		this.suitable = suitable;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getHosteltitle() {
		return hosteltitle;
	}
	public void setHosteltitle(String hosteltitle) {
		this.hosteltitle = hosteltitle;
	}
	public String getHosteldescription() {
		return hosteldescription;
	}
	public void setHosteldescription(String hosteldescription) {
		this.hosteldescription = hosteldescription;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
