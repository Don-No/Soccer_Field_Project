package model;

public class BookingUser {
	private String phoneNumber;
	private String fullname;
	
	public BookingUser() {}

	public BookingUser(String phoneNumber, String fullname) {
		super();
		this.phoneNumber = phoneNumber;
		this.fullname = fullname;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	@Override
	public String toString() {
		return "BookingUser [phoneNumber=" + phoneNumber + ", fullname=" + fullname + "]";
	}
	

}
