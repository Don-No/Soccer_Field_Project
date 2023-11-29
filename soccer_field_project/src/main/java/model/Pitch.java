package model;

public class Pitch {

	private String pitchID;
	private String img;
	private String price;
	private String pitchTypeID;
	private String name;
	private String detail;

	public Pitch(String pitchID, String img, String price, String pitchTypeID, String name) {
		this.pitchID = pitchID;
		this.img = img;
		this.price = price;
		this.pitchTypeID = pitchTypeID;
		this.name = name;
	}



	public Pitch(String pitchID, String img, String price, String pitchTypeID, String name, String detail) {
		this.pitchID = pitchID;
		this.img = img;
		this.price = price;
		this.pitchTypeID = pitchTypeID;
		this.name = name;
		this.detail = detail;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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
