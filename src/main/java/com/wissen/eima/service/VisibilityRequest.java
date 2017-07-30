package com.wissen.eima.service;

public class VisibilityRequest {
	private int eid;

	private int addressVisible;

	private int dobVisible;

	private int genderVisible;

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public int getAddressVisible() {
		return addressVisible;
	}

	public void setAddressVisible(int addressVisible) {
		this.addressVisible = addressVisible;
	}

	public int getDobVisible() {
		return dobVisible;
	}

	public void setDobVisible(int dobVisible) {
		this.dobVisible = dobVisible;
	}

	public int getGenderVisible() {
		return genderVisible;
	}

	public void setGenderVisible(int genderVisible) {
		this.genderVisible = genderVisible;
	}

}
