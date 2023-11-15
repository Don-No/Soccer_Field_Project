package model;

public class Pitch {

	private String pitchID;
	private String img;
	private String price;
	private String pitchTypeID;
	
	public Pitch(String pitchID, String img, String price, String pitchTypeID) {
		this.pitchID = pitchID;
		this.img = img;
		this.price = price;
		this.pitchTypeID = pitchTypeID;
	}

	public String getPitchID() {
		return pitchID;
	}

	public void setPitchID(String pitchID) {
		this.pitchID = pitchID;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPitchTypeID() {
		return pitchTypeID;
	}

	public void setPitchTypeID(String pitchTypeID) {
		this.pitchTypeID = pitchTypeID;
	}
	
	
}
