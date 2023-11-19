package model;

public class Pitch {
	private int pitchID;
	private String img;
	private int  price;
	private int pitchTypeID;
	private String pitchName;
	private String pitchTypeName;
	
	public Pitch() {}

	public Pitch(int pitchID, String img, int price, int pitchTypeID, String pitchName, String pitchTypeName) {
		super();
		this.pitchID = pitchID;
		this.img = img;
		this.price = price;
		this.pitchTypeID = pitchTypeID;
		this.pitchName = pitchName;
		this.pitchTypeName = pitchTypeName;
	}

	public int getPitchID() {
		return pitchID;
	}

	public void setPitchID(int pitchID) {
		this.pitchID = pitchID;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPitchTypeID() {
		return pitchTypeID;
	}

	public void setPitchTypeID(int pitchTypeID) {
		this.pitchTypeID = pitchTypeID;
	}

	public String getPitchName() {
		return pitchName;
	}

	public void setPitchName(String pitchName) {
		this.pitchName = pitchName;
	}

	public String getPitchTypeName() {
		return pitchTypeName;
	}

	public void setPitchTypeName(String pitchTypeName) {
		this.pitchTypeName = pitchTypeName;
	}

	@Override
	public String toString() {
		return "Pitch [pitchID=" + pitchID + ", img=" + img + ", price=" + price + ", pitchTypeID=" + pitchTypeID
				+ ", pitchName=" + pitchName + ", pitchTypeName=" + pitchTypeName + "]";
	}


}
