package entity;

public class ProductData {
    private String productId;
    private String quantity;
    private Product product;

   	public ProductData() {
		super();
	}

	public ProductData(String productId, String quantity, Product product) {
		super();
		this.productId = productId;
		this.quantity = quantity;
		this.product = product;
	}


	public ProductData(String productId, String quantity) {
		super();
		this.productId = productId;
		this.quantity = quantity;
	}


	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "ProductData [productId=" + productId + ", quantity=" + quantity + ", product=" + product + "]";
	}


}