package model;

public class Product {

	private int productID;
	private String productName;
	private String img;
	private int productPrice;
	private int quantity;
	
	
	public Product() {}


	public Product(int productID, String productName, String img, int productPrice, int quantity) {

		this.productID = productID;
		this.productName = productName;
		this.img = img;
		this.productPrice = productPrice;
		this.quantity = quantity;
	}
	


	public Product(int productID, String productName, String img, int productPrice) {
		this.productID = productID;
		this.productName = productName;
		this.img = img;
		this.productPrice = productPrice;
	}


	public int getProductID() {
		return productID;
	}


	public void setProductID(int productID) {
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


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	@Override
	public String toString() {
		return "Product [productID=" + productID + ", productName=" + productName + ", img=" + img + ", productPrice="
				+ productPrice + ", quantity=" + quantity + "]";
	}
	


	
}
