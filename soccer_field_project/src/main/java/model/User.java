package model;

public class User {
	private String userID;
    private String username;
    private String role;
    private String email;
    private String fullname;
    private String address;
    private String phone;

    
    
    public User(String userID, String username, String role, String email, String fullname, String address,
			String phone) {
		this.userID = userID;
		this.username = username;
		this.role = role;
		this.email = email;
		this.fullname = fullname;
		this.address = address;
		this.phone = phone;
	}


	public User(String username, String role, String email, String fullname, String address, String phone) {
        this.username = username;
        this.role = role;
        this.email = email;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
    }
    
    
    public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getFullname() {
        return fullname;
    }
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
}
