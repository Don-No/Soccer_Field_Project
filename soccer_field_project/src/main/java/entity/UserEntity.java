package entity;

public class UserEntity {

	private String username;

	private String fullname;

	private String password;

	private String email;

	private String phone;

	private int idRole;
	private String address;
	private int userID;

	public UserEntity() {
		super();
	}


	public UserEntity(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}





	public UserEntity(int userID) {
		super();
		this.userID = userID;
	}



	public UserEntity(int userID, String username, String password, String fullname, String email, String address,
			int idRole, String phone) {
		super();
		this.userID = userID;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.address = address;
		this.idRole = idRole;
		this.phone = phone;
	}


	public UserEntity(String username, String password, String fullname, String email,String address,int idRole, String phone			) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.idRole = idRole;
		this.address = address;
	}





	public UserEntity(int userID, String fullname, String email, String address, String phone) {
		super();
		this.userID = userID;
		this.fullname = fullname;
		this.email = email;
		this.address = address;
		this.phone = phone;
	}


	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	public int getIdRole() {
		return idRole;
	}

	public void setIdRole(int idRole) {
		this.idRole = idRole;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	@Override
	public String toString() {
		return "UserEntity [username=" + username + ", fullname=" + fullname + ", password=" + password + ", email="
				+ email + ", phone=" + phone + ", idRole=" + idRole + ", address=" + address + "]";
	}


	}









