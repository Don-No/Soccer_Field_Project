package entity;

public class Pitch {

	private int pitchID;
	private String img;
	private double price;
	private PitchType pitchType;



	public Pitch() {
		super();
	}

	public Pitch(int pitchID, String img, double price, PitchType pitchType) {
		super();
		this.pitchID = pitchID;
		this.img = img;
		this.price = price;
		this.pitchType = pitchType;
	}


	public Pitch(int pitchID, String img, double price) {
		super();
		this.pitchID = pitchID;
		this.img = img;
		this.price = price;
	}

	@Override
	public String toString() {
		return "Pitch [pitchID=" + pitchID + ", img=" + img + ", price=" + price + ", pitchType=" + pitchType + "]";
	}

	public PitchType getPitchType() {
		return pitchType;
	}

	public void setPitchType(PitchType pitchType) {
		this.pitchType = pitchType;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}



}