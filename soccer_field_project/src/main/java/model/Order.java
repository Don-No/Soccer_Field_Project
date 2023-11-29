package model;

public class Order {

	private String id;
	private String username;
	private String price;
	private String time;
	private String payMethod;
	private String status;

	public Order(String username, String price, String time, String payMethod, String status) {
		this.username = username;
		this.price = price;
		this.time = time;
		this.payMethod = payMethod;
		this.status = status;
	}

	public Order(String username, String price, String time, String payMethod, String status,String id) {
		this.username = username;
		this.price = price;
		this.time = time;
		this.payMethod = payMethod;
		this.status = status;
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}