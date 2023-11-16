package model;

public class Product {

	private String productID;
	private String productName;
	private String img;
	private String productPrice;
	private String quantity;
	
	public Product(String productID, String productName, String img, String productPrice, String quantity) {
		this.productID = productID;
		this.productName = productName;
		this.img = img;
		this.productPrice = productPrice;
		this.quantity = quantity;
	}
	
	

	public Product(String productName, String img, String productPrice, String quantity) {
		this.productName = productName;
		this.img = img;
		this.productPrice = productPrice;
		this.quantity = quantity;
	}



	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	

	
}
