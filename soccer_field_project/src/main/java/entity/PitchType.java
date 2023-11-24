package entity;

public class PitchType {
	private int pitchTypeID;
	private String name	;
	public PitchType() {
		super();
	}
	public PitchType(int pitchTypeID, String name) {
		super();
		this.pitchTypeID = pitchTypeID;
		this.name = name;
	}
	public int getPitchTypeID() {
		return pitchTypeID;
	}
	public void setPitchTypeID(int pitchTypeID) {
		this.pitchTypeID = pitchTypeID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "PitchType [pitchTypeID=" + pitchTypeID + ", name=" + name + "]";
	}

}
