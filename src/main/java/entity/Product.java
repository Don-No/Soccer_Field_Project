package entity;

public class Product {
private int productID;
private String productName;
private String img;
private double price;
private int quantity;
public Product() {
	super();
}

public Product(int productID, String productName, String img, double price, int quantity) {
	super();
	this.productID = productID;
	this.productName = productName;
	this.img = img;
	this.price = price;
	this.quantity = quantity;
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
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}

@Override
public String toString() {
	return "Product [productID=" + productID + ", productName=" + productName + ", img=" + img + ", price=" + price
			+ ", quantity=" + quantity + "]";
}


}
